ARG SERVICE_VERSION=${SERVICE_VERSION:-1.19.5}
ARG PROD_SERV=nginx:${SERVICE_VERSION}
FROM ${PROD_SERV}
ARG nginx:1.19.5
RUN sed -i "/jessie-updates/d" /etc/apt/sources.list
RUN apt-get update && apt-get install -y curl
HEALTHCHECK --interval=1s --retries=90 CMD curl -f http://localhost/server-status
COPY ./nginx.conf /etc/nginx/
