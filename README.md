# Services Infrastructure

This project contains the configuration for deploying and managing a set of services using Docker and Traefik.

## Project Structure

```
/home/sasha/
├── traefik/
│   ├── docker-compose.yml
│   ├── traefik.yml
│   └── config/
│       └── dynamic_conf.yml
├── n8n/
│   ├── docker-compose.yml
│   └── data/
├── portainer/
│   ├── docker-compose.yml
│   └── data/
├── baserow/
│   ├── docker-compose.yml
│   └── data/
├── gpt/
│   ├── docker-compose.yml
│   └── data/
├── .env
└── n8n-local-files/
```

## Prerequisites

- Docker
- Docker Compose
- Git

## Quick Start

1. Clone the repository:
   ```
   git clone https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git
   cd YOUR_REPO_NAME
   ```

2. Set up environment variables:
   ```
   cp .env.example .env
   # Edit the .env file and add necessary values
   ```

3. Launch Traefik:
   ```
   cd traefik
   docker-compose up -d
   ```

4. Launch other services:
   ```
   cd ../n8n
   docker-compose up -d
   
   cd ../portainer
   docker-compose up -d
   
   cd ../baserow
   docker-compose up -d
   
   cd ../gpt
   docker-compose up -d
   ```

## Detailed Instructions

### Traefik Setup

Traefik is used as a reverse proxy and load balancer. It automatically configures SSL certificates using Let's Encrypt.

1. Ensure your domains are correctly configured in `traefik/traefik.yml` and `traefik/config/dynamic_conf.yml`.
2. Launch Traefik before other services.

### Service Configuration

Each service has its own `docker-compose.yml` file. Make sure you've configured all necessary environment variables in the `.env` file before launching the services.

## Updating

To update services:

1. Stop the service:
   ```
   docker-compose down
   ```

2. Update code from the repository:
   ```
   git pull
   ```

3. Restart the service:
   ```
   docker-compose up -d
   ```

## Monitoring

Use Portainer to monitor and manage your Docker containers.

## Security

- Regularly update your Docker images and system.
- Use strong passwords and store them securely.
- Configure the firewall to limit access only to necessary ports.

## Support

If you encounter any issues or have questions, please create an issue in this repository.