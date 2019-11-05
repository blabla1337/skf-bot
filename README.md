# OWASP SKF Chatbot
[![SKF Logo](https://www.securityknowledgeframework.org/img/banner-wiki-owasp.jpg)](https://www.securityknowledgeframework.org/) 

### Introduction
skfbot is a chat bot built on the [Hubot][hubot] framework. It was
initially generated by [generator-hubot][generator-hubot], and configured to be
deployed using Docker to get you up and running as quick as possible.

### Where to Check:
You can check this bot on gitter.im in the following lobby:

**Security-Knowledge-Framework/Lobby**
[![Join the chat at https://gitter.im/Security-Knowledge-Framework/Lobby](https://badges.gitter.im/Security-Knowledge-Framework/Lobby.svg)](https://gitter.im/Security-Knowledge-Framework/Lobby?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

You can check this bot on Slack in the following lobby:

**OWASP-SKF/Lobby**
[![Join the chat at https://owasp.slack.com/messages/C0F7L9X6V](https://img.shields.io/badge/chat-on%20slack-blueviolet)](https://owasp.slack.com/messages/C0F7L9X6V))

### Gitter Setup

Login to Gitter ang visit this page to retrieve your API TOKEN
http://developer.gitter.im/

After creation add the bot in the channel using the green Add button on the page

Now you are ready to build the bot, we use the SKF_API_HOST for telling the bot where the Chatbot API needs to be used from:
```docker build -f Docker/gitter/Dockerfile . -t skf-bot-gitter --build-arg HUBOT_NAME=bot --build-arg SKF_API_HOST=demo.securityknowledgeframework.org ```

Now you can run the chatbot with:
```docker run -e "HUBOT_GITTER2_TOKEN=xoxb-paste-your-token-here" -ti  skf-bot-gitter```

### Slack Setup

Create a configuration in the Hubot Integration on Slack: From the below link click Install/Add to Slack, choose for the username: bot, and finish by clicking Add Hubot Integration. On the next page, you’ll see an API Token. Copy that value, it will be your Slack token.

https://my.slack.com/apps/A0F7XDU93-hubot

After creation invite the hubot in the channel:
```/invite @bot```

Now you are ready to build the bot, we use the SKF_API_HOST for telling the bot where the Chatbot API needs to be used from:
```docker build -f Docker/slack/Dockerfile . -t skf-bot-slack --build-arg HUBOT_NAME=bot --build-arg SKF_API_HOST=demo.securityknowledgeframework.org ```

Now you can run the chatbot with:
```docker run -e "HUBOT_SLACK_TOKEN=xoxb-paste-your-token-here" -ti  skf-bot-slack```
    
### OWASP:

* [Owasp](http://owasp.com/index.php/Main_Page)  
Licensed under the [creative commons](http://creativecommons.org/licenses/by-nd/3.0/nl/) license

## <a name="CC"></a>Creator & Contributor of the SKF chatbot
- [Priyanka Jain](https://www.linkedin.com/in/priyanka997/)
- Hemant Jain 