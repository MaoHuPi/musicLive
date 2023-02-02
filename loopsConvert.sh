#!/bin/bash

# audio
# ffmpeg-normalize -t "-20" -of "./loop" ./loop/*.wav
# ls ./loop/*.wav | xargs rm

# video
for video in $(ls ./loop/*.webm); do
    ffmpeg -i "$video.webm" -an -filter:v "setpts=0.25*PTS" -y "$video-2.webm"
    ffmpeg -i "$video-2.webm" -q:v 0 -r 30 -y "$video.webm"
    ffmpeg -i "$video.webm" -vf "pad=ceil(iw/2)*2:ceil(ih/2)*2" -c:v libx264 -crf 23 -preset veryfast -y "$video.mp4"
    rm "$video-2.webm"
    rm "$video.webm"
done