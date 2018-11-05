#!/bin/bash

FILE=$1

while read LINE; do
  FILENAME=$(echo $LINE | awk -F'|' '{ print $1 }')
  VOICE=$(echo $LINE | awk -F'|' '{ print $2 }')
  TEXT=$(echo $LINE | awk -F'|' '{ print $3 }')

  curl -G "https://api.ispeech.org/api/rest?apikey=34b06ef0ba220c09a817fe7924575123&action=convert&voice="$VOICE"&speed=1&pitch=100" \
  --data-urlencode "text=$TEXT" -H 'Cookie: _ga=GA1.2.1895127659.1520382813; _gid=GA1.2.939189380.1520382813' \
  -H 'Accept-Encoding: gzip, deflate, br' -H 'Accept-Language: en-US,en;q=0.9' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0) like Gecko' \
  -H 'Accept: */*' -H 'Referer: https://www.ispeech.org/create.text.to.speech.audio' \
  -H 'X-Requested-With: ShockwaveFlash/28.0.0.161' \
  -H 'Connection: keep-alive' --compressed  > "$FILENAME.mp3";

done < $FILE
