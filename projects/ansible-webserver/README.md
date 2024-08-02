## Project Description (Ansible - Webserver)
This project provides an Ansible configuration to set up and manage a web server (Apache or NGINX) on a Linux server. The configuration includes tasks for installing the web server, deploying a virtual host configuration file, and ensuring the web server starts on boot and is always running. The setup is designed to be portable and can be run within a Docker container for consistency and ease of use.


## Directory Structure

ansible-webserver/
├── Dockerfile
├── playbook.yml
├── roles/
│   └── webserver/
│       ├── tasks/
│       │   └── main.yml
│       ├── templates/
│       │   ├── vhost_apache.conf.j2
│       │   └── vhost_nginx.conf.j2
│       └── vars/
│           └── main.yml
└── inventory
    └── inventory.ini


## Directory Descriptions 
- `role/webserver/tasks`: Defines the tasks performed by the role.
- `role/webserver/templates`: Provide configurations for NGINX and Apache.
- `role/webserver/variables`: Specifies configuration options for the web server.
- `inventory`: Serves as a central location to manage and organize inventory files that define the hosts and groups of hosts for automation tasks.


## File Descriptions
- `Dockerfile`: Defines the Docker container environment, installs dependencies (Ansible, NGINX, Apache), and sets up the working directory for running the Ansible playbook.
- `playbook.yml`: Manages the installation, configuration, and service management of the web server.
- `roles/webserver/tasks/main.yml`: Contains tasks for installing the web server, enabling and starting the service, and deploying the vhost configuration.
- `roles/webserver/templates/`: Contains Jinja2 templates for NGINX and Apache virtual host configurations.
    a. Apache Template - roles/webserver/templates/vhost_apache.conf.j2
    b. NGINX Template - roles/webserver/templates/vhost_nginx.conf.j2
- `roles/webserver/vars/main.yml`: Defines variables used by the role, including which web server to use and configuration file paths.
- `inventory/inventory.ini`: Specifies target hosts for Ansible; configured for local execution in Docker.


## Setup Instructions
`Prerequisites`
    - Docker: Ensure Docker is installed on your system. You can download Docker from docker.com.

`Building the Docker Image`
    - To build the Docker image for this project, run the following command from the root directory of the project:

    ```bash
    docker build -t my-ansible-webserver .
    ```

`Running the Docker Container`
    - To run the Docker container and execute the Ansible playbook, use the following command:

    ```bash
    Copy code
    docker run --rm -it my-ansible-webserver
    ```


## Configuration
-`Changing the Web Server Type`
    In roles/webserver/vars/main.yml, you can configure which web server to use by setting the following variables:

    webserver_type: Set to nginx for NGINX or apache for Apache.
    webserver_package`: Set to nginx for NGINX or apache2 for Apache.
    webserver_service`: Set to nginx for NGINX or apache2 for Apache.
    webserver_conf_dir`: Set to nginx/sites-available for NGINX or apache2/sites-available for Apache.
    vhost_template`: Set to vhost_nginx.conf.j2 for NGINX or vhost_apache.conf.j2 for Apache.


-`Virtual Host Configuration Templates`
    Modify the virtual host configuration templates located in roles/webserver/templates/ as needed for your specific requirements.


## Usage
-`Build the Docker image`: Ensure you are in the root directory of the project and run docker

    ```bash
    build -t my-ansible-webserver ..
    ```

-`Run the Docker container`: Execute docker command to run the Ansible playbook inside the container.

    ```bash
    run --rm -it my-ansible-webserver
    ```

## Troubleshooting
-`Docker Build Issues`: Ensure Docker is properly installed and running. Check Docker logs for any errors during the build process.

-`Ansible Playbook Issues`: Review the playbook and role files for any misconfigurations. Ensure the Docker container has network access if required for package installation.
