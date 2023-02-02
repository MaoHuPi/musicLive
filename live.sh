#!/bin/bash

folder="./loop"
rtmp="rtmp://a.rtmp.youtube.com/live2/dgjr-dspx-6cmd-dpu2-4zpm"
showName= true
nameMargin=75
nameSize=75
RANDOM=$(date +%s)
cd $folder
pwd
while true; do
    # for video in $(ls *.webm); do
        # ffmpeg -re -i "$video" -c:v copy -c:a aac -b:a 192k -strict -2 -f flv ${rtmp}
    # done
    ls *.wav |sort -R |tail -$N |while read audio; do
        ls *.mp4 |sort -R |tail -$N |while read video; do
            if $showName; then
                before=".wav"
                after=""
                name=${audio/$before/$after}
                ffmpeg -re -stream_loop -1 -i "$video" -i "$audio" -shortest -map 0:v:0 -map 1:a:0 -vf "drawtext=fontcolor=white:fontsize=$nameSize:text=$name:x=$nameMargin:y=$nameMargin" -c:v libx264 -b:v 2500k -c:a aac -b:a 192k -loglevel error -stats -strict -2 -f flv ${rtmp}
            else
                ffmpeg -re -stream_loop -1 -i "$video" -i "$audio" -shortest -map 0:v:0 -map 1:a:0 -c:v libx264 -b:v 2500k -c:a aac -b:a 192k -strict -2 -f flv ${rtmp}
            fi
        done
    done
done