#!/user/bin/env bash



num=0 #数据总数\
num_low_20=0 #低于20的人数
num_high_30=0 #高于20的人
num_between=0 #在20到30之间的人



num=`awk '{(num+=1)};END {print num}' world.tsv`   #获取总数


num_low_20=`awk -F'\t' '{if($6<20) num_low_20+=1 };END {printf num_low_20}' world.tsv`  #低于20的人数

num_high_30=`awk -F'\t' '{if($6>30) num_high_30+=1 };END {printf num_high_30}' world.tsv` #高于30的人数

num_between=`expr $num - $num_low_20 - $num_high_30`

percent_1=`awk 'BEGIN{printf "%.1f%%\n",('$num_low_20'/'$num')*100}'` #小于20的百分比

percent_2=`awk 'BEGIN{printf "%.1f%%\n",('$num_high_30'/'$num')*100}'`

percent_3=`awk 'BEGIN{printf "%.1f%%\n",('$num_between'/'$num')*100}'`

echo "20岁以下人数及比例: $num_low_20 $percent_1"

echo "大于30岁的人数及比例：$num_high_30 $percent_2"

echo "处于20到30岁的人数及比例：$num_between $percent_3"

awk -F'\t' '{print $5}' world.tsv | sort | uniq -c >sort.TXT

echo -e  "\n----------------各个位置人数及百分比-----------------\n"

echo "位置    人数    百分比"


awk '{printf $2} {printf "   "} {printf $1} {printf "   "} {printf "%.1f%%\n",($1/'${num}')*100} ' sort.TXT



echo -e  "\n----------------名字最长最短球员，年龄最大最小球员-----------------\n"

#获得最小年龄
low_age=`sort -t$'\t' -n -k 6 world.tsv | awk -F '\t' '{print $6}' | awk 'NR==2{print}'`

#获得最大年龄
high_age=`sort -t$'\t' -n -k 6 world.tsv | awk -F '\t' '{print $6}' | awk 'NR==$num{print}'`

echo -e "\n年龄最小的人： \n"


#找到满足最小年龄的人的名字
awk -F'\t' '$6=='${low_age}'{print $9}' world.tsv


echo -e "\n年龄最大的人： \n"

awk -F'\t' '$6=='${high_age}'{print $9}' world.tsv



#获得最小名字长度

min_length=`awk -F '\t' '{print length($9)}' world.tsv | sort -n | awk 'NR==1{print}'`

max_length=`awk -F '\t' '{print length($9)}' world.tsv | sort -n | awk 'NR==$num{print}'`


echo -e "\n名字最短的球员： \n"

awk -F '\t' 'length($9)=='${min_length}'{print $9}' world.tsv

echo -e "\n名字最短的球员： \n"

awk -F '\t' 'length($9)=='${max_length}'{print $9}' world.tsv






