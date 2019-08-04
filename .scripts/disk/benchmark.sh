#!/bin/sudo bash

[ -z "$1" ] && echo "Missing device argument." && exit

dev=$1

f="$(dirname $0)/benchfile_tmp"
blocksize=$(blockdev --getbsz $dev)
blockcount=1024000
times=10
w_total=0
r_total=0
b_total=0

echo -e "Benchmarking \033[1m$dev\033[0m"
echo "- times=$times"
echo "- blocksize=$blocksize"
echo "- blockcount=$blockcount"
echo ""
for i in $(seq 1 $times)
do
	printf "\033[1m#$i\033[0m"
	
	# Clear cache
	sync > /dev/null 2>&1
	echo 3 > /proc/sys/vm/drop_caches

	# Write speed
	ws=$(dd if=/dev/zero of=$f bs=$blocksize count=$blockcount conv=fdatasync,notrunc 2>&1 | grep copied | awk '{print $10 " " $11}')
	wa=($ws)
	w=${wa[0]}
	
	# Clear cache
	sync
	echo 3 > /proc/sys/vm/drop_caches

	# Read speed
	rs=$(dd if=$f of=/dev/null bs=$blocksize count=$blockcount 2>&1 | grep copied | awk '{print $10 " " $11}')
	ra=($rs)
	r=${ra[0]}
	
	# Read speed with buffer
	bs=$(dd if=$f of=/dev/null bs=$blocksize count=$blockcount 2>&1 | grep copied | awk '{print $10 " " $11}')
	ba=($bs)
	b=${ba[0]}

	# Delete tmpfile
	rm $f
	
	# Print result
	echo -e " => \033[1mwrite\033[0m:$ws \033[1mread\033[0m:$rs \033[1mread-buffer\033[0m:$bs"
	
	# Add numbers
	w_total=$(echo $w_total + $w | bc)
	r_total=$(echo $r_total + $r | bc)
	b_total=$(echo $b_total + $b | bc)
done

# Calculate averages
w_avg=$(echo "scale=1; $w_total / $times" | bc -l)
r_avg=$(echo "scale=1; $r_total / $times" | bc -l)
b_avg=$(echo "scale=1; $b_total / $times" | bc -l)

echo ""
printf '\033[1m%-30s' "write-avg"
echo -e "\033[0m| $w_avg ${wa[1]}"
printf '\033[1m%-30s' "read-avg"
echo -e "\033[0m| $r_avg ${ra[1]}"
printf '\033[1m%-30s' "read-avg with buffer-cache"
echo -e "\033[0m| $b_avg ${ba[1]}"
