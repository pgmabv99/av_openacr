#include <iostream>
#include <string>
#include <csignal>
#include <librdkafka/rdkafka.h>
#include <chrono>
#include <ctime>
#include <iomanip>

std::string cts() {
    std::ostringstream oss;
    std::time_t now = std::time(nullptr);
    oss << "[" << std::put_time(std::localtime(&now), "%F %T") << "] ";
    return oss.str();
}

// Flag for signal handling
volatile sig_atomic_t run = 1;

// Signal handler for graceful shutdown
void signal_handler(int sig)
{
    run = 0;
}

// Message consumption callback
void msg_consume(rd_kafka_message_t *rkmessage, void *opaque)
{
    if (rkmessage->err)
    {
        std::cerr  << cts() << "Consumer error: " << rd_kafka_err2str(rkmessage->err) << std::endl;
        if (rkmessage->err == RD_KAFKA_RESP_ERR__PARTITION_EOF)
        {
            std::cerr << "Reached end of partition" << std::endl;
        }
    }
    else
    {
        std::cout << cts() << "Received message (len=" << rkmessage->len << "): "
                  << std::string((char *)rkmessage->payload, rkmessage->len) << std::endl;
    }
}

int main()
{
    // std::string brokers = "dev.ak-8.kafka-4.ext-0:1047"; // Kafka broker(s) address
    // std::string brokers = "localhost:9092"; // Kafka broker(s) address
    std::string brokers = "127.0.0.1:9092"; // Kafka broker(s) address
    std::string topic = "test-topic";  // Kafka topic name
    std::string group_id = "my_group"; // Consumer group ID
    char errstr[512];                  // Error string buffer

    // Register signal handler for graceful shutdown
    signal(SIGINT, signal_handler);
    signal(SIGTERM, signal_handler);

    // Create configuration object
    rd_kafka_conf_t *conf = rd_kafka_conf_new();
    if (!conf)
    {
        std::cerr << "Failed to create configuration object" << std::endl;
        return 1;
    }
    bool debug = false; // Set to true for debugging output
    if (debug)
    {

        if (rd_kafka_conf_set(conf, "client.id", "my-consumer-1", errstr, sizeof(errstr)) != RD_KAFKA_CONF_OK)
        {
            std::cerr << "Failed to set client.id: " << errstr << std::endl;
            rd_kafka_conf_destroy(conf);
            return 1;
        }
        //============prevent termination when server is debugged
        if (rd_kafka_conf_set(conf, "session.timeout.ms", "3600000", errstr, sizeof(errstr)) != RD_KAFKA_CONF_OK)
        {
            std::cerr << "Failed to set session.timeout.ms: " << errstr << std::endl;
            rd_kafka_conf_destroy(conf);
            return 1;
        }
        if (rd_kafka_conf_set(conf, "max.poll.interval.ms", "3600000", errstr, sizeof(errstr)) != RD_KAFKA_CONF_OK)
        {
            std::cerr << "Failed to set max.poll.interval.ms: " << errstr << std::endl;
            rd_kafka_conf_destroy(conf);
            return 1;
        }
        if (rd_kafka_conf_set(conf, "socket.timeout.ms", "300000", errstr, sizeof(errstr)) != RD_KAFKA_CONF_OK)
        {
            std::cerr << "Failed to set socket.timeout.ms: " << errstr << std::endl;
            rd_kafka_conf_destroy(conf);
            return 1;
        }
        if (rd_kafka_conf_set(conf, "heartbeat.interval.ms", "60000", errstr, sizeof(errstr)) != RD_KAFKA_CONF_OK)
        {
            std::cerr << "Failed to set heartbeat.interval.ms: " << errstr << std::endl;
            rd_kafka_conf_destroy(conf);
            return 1;
        }
    }
    //=============
    // Set initial offset to earliest
    if (rd_kafka_conf_set(conf, "auto.offset.reset", "earliest", errstr, sizeof(errstr)) != RD_KAFKA_CONF_OK)
    {
        std::cerr << "Failed to set auto.offset.reset: " << errstr << std::endl;
        rd_kafka_conf_destroy(conf);
        return 1;
    }
    //=============

    // if (    rd_kafka_conf_set(conf, "debug", "all", errstr, sizeof(errstr)) != RD_KAFKA_CONF_OK) {
    //     std::cerr << "Failed to set debug: " << errstr << std::endl;
    //     rd_kafka_conf_destroy(conf);
    //     return 1;
    // }

    // Set bootstrap.servers configuration
    if (rd_kafka_conf_set(conf, "bootstrap.servers", brokers.c_str(), errstr, sizeof(errstr)) != RD_KAFKA_CONF_OK)
    {
        std::cerr << "Failed to set bootstrap.servers: " << errstr << std::endl;
        rd_kafka_conf_destroy(conf);
        return 1;
    }

    // Set consumer group ID
    if (rd_kafka_conf_set(conf, "group.id", group_id.c_str(), errstr, sizeof(errstr)) != RD_KAFKA_CONF_OK)
    {
        std::cerr << "Failed to set group.id: " << errstr << std::endl;
        rd_kafka_conf_destroy(conf);
        return 1;
    }

    // Enable manual offset commits (optional, depending on use case)
    if (rd_kafka_conf_set(conf, "enable.auto.commit", "false", errstr, sizeof(errstr)) != RD_KAFKA_CONF_OK)
    {
        std::cerr << "Failed to set enable.auto.commit: " << errstr << std::endl;
        rd_kafka_conf_destroy(conf);
        return 1;
    }

    // Create consumer instance
    rd_kafka_t *rk = rd_kafka_new(RD_KAFKA_CONSUMER, conf, errstr, sizeof(errstr));
    if (!rk)
    {
        std::cerr << cts() << "Failed to create consumer: " << errstr << std::endl;
        rd_kafka_conf_destroy(conf);
        return 1;
    }
    conf = nullptr; // Configuration is now owned by rk

    // Enable consumer polling
    if (rd_kafka_poll_set_consumer(rk) != RD_KAFKA_RESP_ERR_NO_ERROR)
    {
        std::cerr << cts() << "Failed to set consumer polling: " << rd_kafka_err2str(rd_kafka_last_error()) << std::endl;
        rd_kafka_destroy(rk);
        return 1;
    }

    // Create topic partition list for subscription
    rd_kafka_topic_partition_list_t *topics = rd_kafka_topic_partition_list_new(1);
    rd_kafka_topic_partition_list_add(topics, topic.c_str(), RD_KAFKA_PARTITION_UA);

    // Subscribe to topics
    rd_kafka_resp_err_t err = rd_kafka_subscribe(rk, topics);
    if (err != RD_KAFKA_RESP_ERR_NO_ERROR)
    {
        std::cerr << cts() << "Failed to subscribe to topics: " << rd_kafka_err2str(err) << std::endl;
        rd_kafka_topic_partition_list_destroy(topics);
        rd_kafka_destroy(rk);
        return 1;
    }

    std::cout << cts() << "Subscribed to topic: " << topic << " brokers:" << brokers << ". Press Ctrl+C to exit." << std::endl;

    // Main consumption loop
    while (run)
    {
        rd_kafka_message_t *msg = rd_kafka_consumer_poll(rk, 1000); // Poll every 1 second
        if (msg)
        {
            msg_consume(msg, nullptr);
            rd_kafka_message_destroy(msg);
        }
    }

    std::cout << cts() << "Shutting down consumer..." << std::endl;

    // Clean up resources
    rd_kafka_topic_partition_list_destroy(topics);
    rd_kafka_consumer_close(rk);
    rd_kafka_destroy(rk);

    return 0;
}