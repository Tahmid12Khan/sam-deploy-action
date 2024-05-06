FROM ubuntu:latest

LABEL version="1.0.0"

LABEL com.github.actions.name="SAM Deploy Action"
LABEL com.github.actions.description="Deploy AWS SAM Stack"
LABEL com.github.actions.icon="upload-cloud"
LABEL com.github.actions.color="blue"

LABEL repository="https://github.com/Tahmid12Khan/sam-deploy-action"
LABEL homepage="https://github.com/Tahmid12Khan/sam-deploy-action"
LABEL maintainer="Tahmid Khan <tahmidkhan37@gmail.com>"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt install -y curl && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-2.0.30.zip" -o "awscliv2.zip" && unzip awscliv2.zip && sudo ./aws/install --bin-dir /usr/local/bin --install-dir /usr/local/aws-cli --update


ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
