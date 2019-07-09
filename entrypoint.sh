#!/bin/bash

RAGEMP_MAXPLAYERS="${RAGEMP_MAXPLAYERS:-10}"
RAGEMP_NAME="${RAGEMP_NAME:-eisengrind.de RageMP Docker image}"
RAGEMP_GAMEMODE="${RAGEMP_GAMEMODE:-freeroam}"
RAGEMP_STREAM_DISTANCE="${RAGEMP_STREAM_DISTANCE:-500.0}"
RAGEMP_ANNOUNCE="${RAGEMP_ANNOUNCE:-false}"
RAGEMP_PORT="${RAGEMP_PORT:-22005}"

if [ ! -f "./conf.json" ]; then
    declare -A CFG
    [ ! -z "$RAGEMP_ANNOUNCE" ] && CFG[announce]=$RAGEMP_ANNOUNCE
    [ ! -z "$RAGEMP_BIND" ] && CFG[bind]="\"$RAGEMP_BIND\""
    [ ! -z "$RAGEMP_GAMEMODE" ] && CFG[gamemode]="\"$RAGEMP_GAMEMODE\""
    [ ! -z "$RAGEMP_ENCRYPTION" ] && CFG[encryption]=$RAGEMP_ENCRYPTION
    [ ! -z "$RAGEMP_MAXPLAYERS" ] && CFG[maxplayers]=$RAGEMP_MAXPLAYERS
    [ ! -z "$RAGEMP_NAME" ] && CFG[name]="\"$RAGEMP_NAME\""
    [ ! -z "$RAGEMP_STREAM_DISTANCE" ] && CFG[stream-distance]=$RAGEMP_STREAM_DISTANCE
    [ ! -z "$RAGEMP_PORT" ] && CFG[port]=$RAGEMP_PORT
    [ ! -z "$RAGEMP_DISALLOW_MULTIPLE_CONNECTIONS_PER_IP" ] && CFG[disallow-multiple-connections-per-ip]=$RAGEMP_DISALLOW_MULTIPLE_CONNECTIONS_PER_IP
    [ ! -z "$RAGEMP_LIMIT_TIME_OF_CONNECTIONS_PER_IP" ] && CFG[limit-time-of-connections-per-ip]=$RAGEMP_LIMIT_TIME_OF_CONNECTIONS_PER_IP
    [ ! -z "$RAGEMP_URL" ] && CFG[url]="\"$RAGEMP_URL\""
    [ ! -z "$RAGEMP_LANGUAGE" ] && CFG[language]="\"$RAGEMP_LANGUAGE\""
    [ ! -z "$RAGEMP_SYNC_RATE" ] && CFG[sync-rate]=$RAGEMP_SYNC_RATE
    [ ! -z "$RAGEMP_RESOURCE_SCAN_THREAD_LIMIT" ] && CFG[resource-scan-thread-limit]=$RAGEMP_RESOURCE_SCAN_THREAD_LIMIT
    [ ! -z "$RAGEMP_MAX_PING" ] && CFG[max-ping]=$RAGEMP_MAX_PING
    [ ! -z "$RAGEMP_MIN_FPS" ] && CFG[min-fps]=$RAGEMP_MIN_FPS
    [ ! -z "$RAGEMP_MAX_PACKET_LOSS" ] && CFG[max-packet-loss]=$RAGEMP_MAX_PACKET_LOSS
    [ ! -z "$RAGEMP_ALLOW_CEF_DEBUGGING" ] && CFG[allow-cef-debugging]=$RAGEMP_ALLOW_CEF_DEBUGGING
    [ ! -z "$RAGEMP_ENABLE_NODEJS" ] && CFG[enable-nodejs]=$RAGEMP_ENABLE_NODEJS
    [ ! -z "$RAGEMP_CSHARP" ] && CFG[csharp]="\"$RAGEMP_CSHARP\""
    [ ! -z "$RAGEMP_ENABLE_HTTP_SECURITY" ] && CFG[enable-http-security]=$RAGEMP_ENABLE_HTTP_SECURITY
    [ ! -z "$RAGEMP_VOICE_CHAT" ] && CFG[voice-chat]=$RAGEMP_VOICE_CHAT
    [ ! -z "$RAGEMP_ALLOW_VOICE_CHAT_INPUT" ] && CFG[allow-voice-chat-input]=$RAGEMP_ALLOW_VOICE_CHAT_INPUT
    [ ! -z "$RAGEMP_VOICE_CHAT_SAMPLE_RATE" ] && CFG[voice-chat-sample-rate]=$RAGEMP_VOICE_CHAT_SAMPLE_RATE
    [ ! -z "$RAGEMP_FASTDL_HOST" ] && CFG[fastdl-host]="\"$RAGEMP_FASTDL_HOST\""

    printf "{\n" >> conf.json
    var=1
    for i in "${!CFG[@]}"
    do
        [ $var -ne "1" ] && printf ",\n" >> conf.json
        printf "\t\"$i\": ${CFG[$i]}" >> conf.json
        ((++var))
    done
    printf "\n}" >> conf.json
fi

./server
