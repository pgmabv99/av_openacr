from kafka.admin import KafkaAdminClient, NewTopic
import sys
import time

def create_admin(bootstrap_servers):
    return KafkaAdminClient(bootstrap_servers=bootstrap_servers)

if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Usage: python top_del.py <bootstrap_servers> <topic_name>")
        sys.exit(1)

    bootstrap_servers = sys.argv[1]
    topic = sys.argv[2]

    admin = create_admin(bootstrap_servers)

    # Delete the topic
    print(f"Deleting topic: {topic}")
    try:
        admin.delete_topics([topic])
    except Exception as e:
        print(f"Warning: delete failed (might not exist yet): {e}")

    # Wait briefly to ensure deletion propagates
    nsec = 4
    print(f"sleeping {nsec}")
    time.sleep(nsec)

    # Recreate the topic with 1 partition and replication factor 1
    print(f"Creating topic: {topic} with 1 partition")
    new_topic = NewTopic(name=topic, num_partitions=1, replication_factor=1)
    try:
        admin.create_topics([new_topic])
        print("Topic created successfully.")
    except Exception as e:
        print(f"Failed to create topic: {e}")