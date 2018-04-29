#!/bin/sh
DIR="$( cd "$( dirname "$0"  )" && pwd  )"

#日志文件所在目录
path=logs
#进入日志目录
cd $DIR/../$path
#catalina.out日志文件备份
#获取前一天的日期
bak_date=`date +%Y-%m-%d -d "1 days ago"`
#备份catalina.out日志，后面添加日期
cp catalina.out catalina.out.$bak_date.log
#清空catalina.out日志文件
echo > catalina.out
#5天之前的日志文件删除
#获取5天之前的日期
del_date=`date +%Y-%m-%d -d "5 days ago"`
#获取文件名中的日期字符串，然后对比时间进行相应的操作，localhost_access_log的后缀文件名一般是txt，这里包括txt文件
#for n in `ls  *.log* *.txt* *_log* 2>/dev/null`;do
for n in `ls  2>/dev/null`;do
#m=`echo $n | awk -F. '{print $(NF-1)}'`
m=`echo $n |sed 's/.*\([1-9][0-9]\{3\}-[0-1][0-9]-[0-9]\{2\}\).*/\1/g' | awk  '{print $1}'`
if [[ $m < $del_date || $m = $del_date ]];then
echo file $n will be deleted.
rm -rf $n
fi
done
