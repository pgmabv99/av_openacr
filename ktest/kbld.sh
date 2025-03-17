#!/bin/bash

pwd
g++ -o  producer producer.cpp -g -I/usr/include/librdkafka -lrdkafka
g++ -o  consumer consumer.cpp -g -I/usr/include/librdkafka -lrdkafka