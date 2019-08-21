#!/bin/bash

#Bulk download some files from GeoNet and IRIS FDSN web servers. For testing performance.
#Download the same data from each server. Use only NZ stations that IRIS holds.

#https://stackoverflow.com/questions/17638026/calculating-server-processing-time-with-curl

sites="BFZ BKZ CTZ HIZ KHZ ODZ OUZ QRZ RPZ URZ"
starttime='2019-07-20T00:00:00.000'
endtime='2019-07-21T00:00:00.000'

if [ -f logfile.geonet ]; then
	\rm logfile.geonet
fi
if [ -f logfile.iris ]; then
	\rm logfile.iris
fi

for site in $sites
do
	echo $site
	curl -s "https://service.geonet.org.nz/fdsnws/dataselect/1/query?network=NZ&station=$site&location=10&channel=HHZ&starttime=$starttime&endtime=$endtime" -o /dev/null -w "%{time_total},%{time_starttransfer},%{time_pretransfer},%{speed_download},%{url_effective}\n" >> logfile.geonet
	curl -s "https://service.iris.edu/fdsnws/dataselect/1/query?network=NZ&station=$site&location=10&channel=HHZ&starttime=$starttime&endtime=$endtime" -o /dev/null -w "%{time_total},%{time_starttransfer},%{time_pretransfer},%{speed_download},%{url_effective}\n" >> logfile.iris
done
