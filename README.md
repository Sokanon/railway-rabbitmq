# RabbitMQ

One-click deploy of [RabbitMQ](https://www.rabbitmq.com/) with the Management UI on Railway.

[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/new/template/TEMPLATE_CODE)

## What's Included

- **RabbitMQ 4** -- message broker with AMQP 0-9-1 support
- **Management UI** -- web-based dashboard for monitoring queues, exchanges, connections, and users
- **Persistent volume** -- data survives redeployments

## Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `RABBITMQ_DEFAULT_USER` | Admin username | `guest` |
| `RABBITMQ_DEFAULT_PASS` | Admin password | Set in template |
| `RABBITMQ_DEFAULT_VHOST` | Default virtual host | `/` |

> Set `RABBITMQ_DEFAULT_USER` and `RABBITMQ_DEFAULT_PASS` in your Railway service variables. The public domain routes to the Management UI on port 15672.

## Ports

| Port | Protocol | Purpose |
|------|----------|---------|
| `5672` | AMQP | Message broker connections |
| `15672` | HTTP | Management UI and API |

## Post-Deployment

1. Generate a public domain for the service to expose the Management UI
2. Open `https://<your-domain>` to access the Management UI
3. Log in with `RABBITMQ_DEFAULT_USER` and `RABBITMQ_DEFAULT_PASS`
4. For AMQP connections from other Railway services, use the private domain (see below)

## Connecting from Other Services

Use Railway's private networking for service-to-service AMQP connections:

```
AMQP_URL=amqp://${{RabbitMQ.RABBITMQ_DEFAULT_USER}}:${{RabbitMQ.RABBITMQ_DEFAULT_PASS}}@${{RabbitMQ.RAILWAY_PRIVATE_DOMAIN}}:5672/${{RabbitMQ.RABBITMQ_DEFAULT_VHOST}}
```

## Volume

Data is persisted at `/var/lib/rabbitmq`. This includes queues, exchanges, bindings, users, and runtime configuration.

## Links

- [RabbitMQ Documentation](https://www.rabbitmq.com/docs)
- [Management Plugin](https://www.rabbitmq.com/docs/management)
- [AMQP 0-9-1 Reference](https://www.rabbitmq.com/amqp-0-9-1-reference)
