#!/usr/bin/bash
i=93
for var in $(ls -1|grep -E "Vdrebezgi-9[3-7]")
do
command=$(ffmpeg -i $var -acodec libmp3lame -vcodec mpeg4 -vtag DIVX Vdrebezgi-$i.avi)
((i+=1))
done
