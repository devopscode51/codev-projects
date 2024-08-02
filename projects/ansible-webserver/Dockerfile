FROM ubuntu:20.04

# Install dependencies
RUN apt-get update && \
    apt-get install -y \
    ansible \
    nginx \
    apache2 \
    && apt-get clean

# Copy the Ansible playbook and roles into the container
COPY playbook.yml /ansible/playbook.yml
COPY roles /ansible/roles
COPY inventory /ansible/inventory

# Set working directory
WORKDIR /ansible

# Run Ansible playbook
CMD ["ansible-playbook", "playbook.yml", "-i", "inventory"]