
# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi


export JAVA_HOME=/home/botdev01/jdk1.8.0_151/bin
export PROC_NAME=$1
export FILE_NAME=$2


while [ : ]
do

# get process id what you want monitoring
PID=`ps -ef | grep $PROC_NAME | grep -v grep | grep -v sh | grep -v vim | grep -v tail | awk '{print $2 }'`


echo $(date +\%y\-%m\-%d\ %T) >> $FILE_NAME
$JAVA_HOME/jmap  -heap $PID   >> $FILE_NAME
$JAVA_HOME/jstat -gc   $PID   >> $FILE_NAME

cat /proc/$PID/status | grep ^Threads >> $FILE_NAME
#echo -e "\n\n" >> $FILE_NAME

sleep 5m
done
