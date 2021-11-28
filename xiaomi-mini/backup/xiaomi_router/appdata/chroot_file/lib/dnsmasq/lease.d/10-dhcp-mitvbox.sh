
#!/bin/sh

file='/tmp/mitvbox_records'

# only handle add and old op in this script
[ "$1" == 'add' -o "$1" == 'old' ] || return 0
shift

mitv=`echo $3 | tr '[A-Z]' '[a-z]' | grep -E "^mitv"`
mibox=`echo $3 | tr '[A-Z]' '[a-z]' | grep -E "^mibox"`

if [ -n "$mitv" ]; then
	datacenterClient -h localhost -p 9090 -i "{\"api\":626,\"mac\":\"$1\",\"type\":0}"
	record=`sed -n /$1/p $file 2>/dev/null`
	if [ -z "$record" ]; then
		echo $1 0 >> $file
	fi
fi

if [ -n "$mibox" ]; then
	datacenterClient -h localhost -p 9090 -i "{\"api\":626,\"mac\":\"$1\",\"type\":1}"
	record=`sed -n /$1/p $file 2>/dev/null`
	if [ -z "$record" ]; then
		echo $1 1 >> $file
	fi
fi

# for plug-in
datacenterClient -h localhost -p 9090 -i "{\"api\":631,\"mac\":\"$1\",\"ip\":\"$2\",\"deviceName\":\"$3\"}"
