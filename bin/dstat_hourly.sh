#!/bin/sh
script_version="0.0.4"

# dstat_hourly.sh
# Created by:  luciano.ventura@gmail.com 


# dstat loggin with 15 sec delay and 240 counts (1hour)

v_delay=15		# seconds
v_count=240		# integer

 v_cpu="total"	# cpus  to check 0,1,x,y,total
v_disk="total"	# diska to check total


logs_dstat_dir=/u01/Oracle/home_infra/dstat/log/
out_log_file=$logs_dstat_dir/$(date +%Y.%m.%d_%H.%M.%S)"_"dstat_hourly.csv
err_log_file=$logs_dstat_dir/$(date +%Y.%m.%d_%H.%M.%S)"_"dstat_hourly.err

dstat --noupdate -t -c -C $v_cpu -d -D $v_disk -M load,freespace,mem,swap,net,tcp,udp,app --debug --output $out_log_file $v_delay $v_count 2> $err_log_file
