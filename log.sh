#!/user/bin/env bash

# web.txt里存有按序排列的各来源主机出现次数和其Host



# 再获取前一百行即可获得

echo -e "---------------top100 访问次数及其来源主机ip----------------\n"

sort -t$'\t' -k 1 web_log.tsv | awk 'BEGIN{FS="\t";ORS="\t"} {print $1,"\n"}' | uniq -c | sort -r -n -k 1 >web.txt

head -n100 web.txt


echo -e "---------------top100 访问次数及其来源主机------------------\n"


array=`awk '{print $2}' web.txt | head -n 100`

echo "$array"

for i in ${array[@]}
do 
	awk '{if($1=="'$i'"){print}}' web_log.tsv

done

echo -e "---------------top100 访问次数及url------------------\n"

sort -t$'\t' -k 5 web_log.tsv | awk 'BEGIN{FS="\t";ORS="\t"} {print $5,"\n"}' | uniq -c | sort -r -n -k 1 | head -n100


echo -e "---------------不同响应状态码出现次数和对应百分比------------------\n"

sort -t$'\t' -k 6 web_log.tsv | awk -F '\t' '{print $6}' | uniq -c | awk -F ' ' '{printf "%d %d %.4f%%\n" ,$2,$1,($1/1569887)*100 }'  


echo -e "---------------不同4XX状态码对应的TOP 10 URL和对应出现的总次数-------------------\n"

cat web_log.tsv | awk -F "\t" '{ if ($6=="403") {print $5} }' | sort | uniq -c | sort -nr | head -10


echo -e "---------------给的URL输出TOP100主机-------------------\n"

read url

cat web_log.tsv|awk -F'\t' '{if($5=="'$url'"){print}}'|sort|uniq -c|sort -nr|head -n 100





