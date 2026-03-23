FROM rabbitmq:4-management-alpine

ENV PORT=15672

EXPOSE 5672 15672

CMD ["rabbitmq-server"]
