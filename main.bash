mkdir web_monitor_log
cd web_monitor_log
touch WebLog.csv  #all log
touch Web_Log.csv  # final log with useful information

while :
      do
              time=$(date "+%Y-%m-%d %H:%M:%S")
              
            #  echo "Programname/ProgramID(PID)/null(ignorethis.if=0),Sent(KB),Received(KB)" >> WebLog.csv
              echo "${time}" >> WebLog.csv
#Monitor command
              nethogs -v 1 -t -c 500 >> WebLog.csv 
              time=$(date "+%Y-%m-%d %H:%M:%S")
              echo "${time}" >> WebLog.csv
#duplicate
              sed 's/Refreshing:/Programname/ProgramID(PID)/null(ignorethis.if=0),Sent(KB),Received(KB)/g' WebLog.csv
              
              awk -F '|' '!x[$1]++' WebLog.csv > Web_Log.csv
              echo "Programname/ProgramID(PID)/null(ignorethis.if=0),Sent(KB),Received(KB)" >> Web_Log.csv
#output
               sed -i 's/\s\+/,/g' Web_Log.csv
               awk -F '|' '!x[$1]++' Web_Log.csv

done