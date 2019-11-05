FROM node:latest

LABEL maintainer="glenn.ten.cate@owasp.org"

# Environment variables
ENV HUBOT_SLACK_TOKEN="nope-1234-5678-91011-00e4dd"
ARG HUBOT_NAME="bot"
ARG SKF_API_HOST="demo.securityknowledgeframework.org"
ENV HUBOT_OWNER="glenn.ten.cate@owasp.org"
ENV HUBOT_DESCRIPTION="SKF Hubot for Slack"
ENV EXTERNAL_SCRIPTS "hubot-diagnostics,hubot-help,hubot-pugme,hubot-google-images,hubot-google-translate,hubot-maps,hubot-shipit,hubot-rules"

RUN useradd hubot -m

RUN npm install -g yo generator-hubot
USER hubot

WORKDIR /home/hubot
RUN yo hubot --owner="${HUBOT_OWNER}" --name="${HUBOT_NAME}" --description="${HUBOT_DESCRIPTION}" --adapter=slack
ADD ./example.coffee scripts/example.coffee
RUN  perl -pi -e "s/\@bot/\@${HUBOT_NAME}/" scripts/example.coffee
RUN  perl -pi -e "s/demo.securityknowledgeframework.org/${SKF_API_HOST}/" scripts/example.coffee
CMD ./bin/hubot --adapter slack

#docker build -f Docker/slack/Dockerfile . -t skf-bot-slack --build-arg HUBOT_NAME=bot --build-arg SKF_API_HOST=demo.securityknowledgeframework.org 
#docker run -e "HUBOT_SLACK_TOKEN=xoxb-paste-your-token-here" -ti skf-bot-slack
