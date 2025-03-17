#include <iostream>
#include <rdkafka.h>

void msg_consume(rd_kafka_message_t *rkmessage, void *opaque) {
    if (rkmessage->err)
        std::cerr << "Consumer error: " << rd_kafka_err2str(rkmessage->err) << std::endl;
    else
        std::cout << "Received: " << (char *)rkmessage->payload << std::endl;
}

int main() {
    std::string brokers = "localhost:9092";
    std::string topic = "test-topic";

    rd_kafka_conf_t *conf = rd_kafka_conf_new();
    rd_kafka_conf_set(conf, "group.id", "my_group", NULL, 0);

    char errstr[512];
    rd_kafka_t *rk = rd_kafka_new(RD_KAFKA_CONSUMER, conf, errstr, sizeof(errstr));
    if (!rk) {
        std::cerr << "Failed to create consumer: " << errstr << std::endl;
        return 1;
    }

    rd_kafka_poll_set_consumer(rk);
    rd_kafka_topic_partition_list_t *topics = rd_kafka_topic_partition_list_new(1);
    rd_kafka_topic_partition_list_add(topics, topic.c_str(), RD_KAFKA_PARTITION_UA);

    rd_kafka_subscribe(rk, topics);

    while (true) {
        rd_kafka_message_t *msg = rd_kafka_consumer_poll(rk, 1000);
        if (msg) {
            msg_consume(msg, NULL);
            rd_kafka_message_destroy(msg);
        }
    }

    rd_kafka_consumer_close(rk);
    rd_kafka_destroy(rk);

    return 0;
}
