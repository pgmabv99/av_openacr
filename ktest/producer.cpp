#include <iostream>
#include <rdkafka.h>

void dr_msg_cb(rd_kafka_t *rk, const rd_kafka_message_t *rkmessage, void *opaque) {
    if (rkmessage->err)
        std::cerr << "Message delivery failed: " << rd_kafka_err2str(rkmessage->err) << std::endl;
    else
        std::cout << "Message delivered: " << (char *)rkmessage->payload << std::endl;
}

int main() {
    std::string brokers = "localhost:9092";
    std::string topic = "test-topic";

    rd_kafka_conf_t *conf = rd_kafka_conf_new();
    rd_kafka_conf_set_dr_msg_cb(conf, dr_msg_cb);

    char errstr[512];
    rd_kafka_t *rk = rd_kafka_new(RD_KAFKA_PRODUCER, conf, errstr, sizeof(errstr));
    if (!rk) {
        std::cerr << "Failed to create producer: " << errstr << std::endl;
        return 1;
    }

    rd_kafka_topic_t *rkt = rd_kafka_topic_new(rk, topic.c_str(), NULL);
    std::string message = "Hello, Kafka from C++!";
    
    rd_kafka_produce(rkt, RD_KAFKA_PARTITION_UA, RD_KAFKA_MSG_F_COPY,
                     (void *)message.c_str(), message.size(), NULL, 0, NULL);
    
    rd_kafka_flush(rk, 5000);

    rd_kafka_topic_destroy(rkt);
    rd_kafka_destroy(rk);

    return 0;
}
