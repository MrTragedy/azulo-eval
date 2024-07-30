FROM flyway/flyway:latest

COPY init-flyway.sh /flyway/init-flyway.sh
RUN chmod +x /flyway/init-flyway.sh

ENTRYPOINT ["/flyway/init-flyway.sh"]
