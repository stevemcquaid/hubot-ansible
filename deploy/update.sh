#!/bin/bash

source hubot_env.config

ansible-playbook update.yaml -i hosts --extra-vars \
" \
HUBOT_LOG_LEVEL=$HUBOT_LOG_LEVEL \
HUBOT_SLACK_TOKEN=$HUBOT_SLACK_TOKEN \
HOME_FOLDER=$HOME_FOLDER \
SYNC_ABS_PATH=$SYNC_ABS_PATH \
REPO_NAME=$REPO_NAME \
HUBOT_NAME=$HUBOT_NAME \
" \
-k -K -vvvv
