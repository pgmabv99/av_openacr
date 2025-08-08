from kafka.admin import KafkaAdminClient
import sys

def create_admin(bootstrap_servers):
    return KafkaAdminClient(bootstrap_servers=bootstrap_servers)

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python top_del.py <bootstrap_servers>")
        sys.exit(1)
    bootstrap_servers = sys.argv[1]
    topic = sys.argv[2]
    admin = create_admin(bootstrap_servers)
admin.delete_topics([topic])