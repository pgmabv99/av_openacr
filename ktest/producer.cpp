#include <iostream>
#include <string>
#include <chrono>
#include <thread>
#include <csignal>
#include <librdkafka/rdkafka.h>

// Flag for signal handling
volatile sig_atomic_t run = 1;

// Signal handler for graceful shutdown
void signal_handler(int sig) {
    run = 0;
}

// Delivery report callback
void dr_msg_cb(rd_kafka_t *rk, const rd_kafka_message_t *rkmessage, void *opaque) {
    if (rkmessage->err) {
        std::cerr << "Message delivery failed: " << rd_kafka_err2str(rkmessage->err) << std::endl;
    } else {
        std::cout << "Message delivered: " << (char *)rkmessage->payload << std::endl;
    }
}

int main() {
    std::string brokers = "dev.ak-8.kafka-4.ext-0:1047";
    // std::string brokers = "localhost:9092";
    // std::string brokers = "1kcat :9092";
    std::string topic = "test-topic";
    char errstr[512];

    // Register signal handlers
    signal(SIGINT, signal_handler);
    signal(SIGTERM, signal_handler);

    // Create configuration object
    rd_kafka_conf_t *conf = rd_kafka_conf_new();
    if (!conf) {
        std::cerr << "Failed to create configuration object" << std::endl;
        return 1;
    }

    // Set delivery report callback
    rd_kafka_conf_set_dr_msg_cb(conf, dr_msg_cb);

    if (rd_kafka_conf_set(conf, "client.id", "my-producer-1", errstr, sizeof(errstr)) != RD_KAFKA_CONF_OK) {
        std::cerr << "Failed to set client.id: " << errstr << std::endl;
        rd_kafka_conf_destroy(conf);
        return 1;
    }
    // Set bootstrap.servers configuration
    if (rd_kafka_conf_set(conf, "bootstrap.servers", brokers.c_str(), errstr, sizeof(errstr)) != RD_KAFKA_CONF_OK) {
        std::cerr << "Failed to set bootstrap.servers: " << errstr << std::endl;
        rd_kafka_conf_destroy(conf);
        return 1;
    }

    // Create producer instance
    rd_kafka_t *rk = rd_kafka_new(RD_KAFKA_PRODUCER, conf, errstr, sizeof(errstr));
    if (!rk) {
        std::cerr << "Failed to create producer: " << errstr << std::endl;
        rd_kafka_conf_destroy(conf);
        return 1;
    }
    conf = nullptr;  // Configuration is now owned by rk

    // Create topic handle
    rd_kafka_topic_t *rkt = rd_kafka_topic_new(rk, topic.c_str(), nullptr);
    if (!rkt) {
        std::cerr << "Failed to create topic handle: " << rd_kafka_err2str(rd_kafka_last_error()) << std::endl;
        rd_kafka_destroy(rk);
        return 1;
    }

    std::cout << "Producing  to topic: " << topic << " brokers:"<< brokers  << std::endl;
    // Generate messages with incrementing numbers
    uint64_t message_number = 0;
#define MAX_MESSAGE_NUMBER 2
    while (run && message_number < MAX_MESSAGE_NUMBER) {
        // Convert number to ASCII string
        std::string message_tmp = std::to_string(message_number);
        std::string message = "";
        for (int i=0; i <10; i++) {
            message += " ";
            message += message_tmp;

        }

        // Produce message
        int produce_result = rd_kafka_produce(
            rkt, RD_KAFKA_PARTITION_UA, RD_KAFKA_MSG_F_COPY,
            (void *)message.c_str(), message.size(),
            nullptr, 0, nullptr
        );

        if (produce_result == -1) {
            std::cerr << "Failed to produce message " << message << ": " << rd_kafka_err2str(rd_kafka_last_error()) << std::endl;
        } else {
            std::cout << "Enqueued message: " << message << std::endl;
        }

        // Poll for delivery reports
        rd_kafka_poll(rk, 0);

        // Sleep for 1 millisecond
        std::this_thread::sleep_for(std::chrono::milliseconds(1));

        // Increment message number
        message_number++;
    }

    std::cout << "Shutting down producer..." << std::endl;

    // Flush remaining messages (wait up to 5 seconds)
    rd_kafka_flush(rk, 5000);

    // Clean up resources
    rd_kafka_topic_destroy(rkt);
    rd_kafka_destroy(rk);

    return 0;
}