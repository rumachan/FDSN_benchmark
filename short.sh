#!/bin/bash

#Bulk download many short files from GeoNet. For testing performance.
#This simulates a user wanting 'all' data for a large event.

HH="APZ BFZ BHW BKZ COVZ CTZ CVZ DCZ DSZ EAZ ETVZ FOZ FWVZ GLKZ GRZ GVZ HAZ HIZ INZ JCZ KHEZ KHZ KNZ KUZ LBZ LTZ MAVZ MKAZ MLZ MQZ MRZ MSZ MWZ MXZ NNZ NTVZ ODZ OPRZ OPZ OTVZ OUZ OXZ PUZ PXZ PYZ QRZ RATZ RIZ RPZ RTZ SYZ THZ TLZ TMVZ TOZ TRVZ TSZ TUZ URZ VRZ HWAZ WCZ WEL WHVZ WHZ WIZ WKZ WSRZ WVZ"

EH="ABAZ AKCZ ALRZ AMCZ ANWZ ARAZ ARCZ ARHZ AWAZ BSWZ CAW CKHZ CMWZ CNGZ CPWZ CRSZ DREZ DUWZ DVHZ EDRZ EPAZ ETAZ GCSZ GRRZ HATZ HBAZ HLRZ HOWZ HRRZ HSRZ KAHZ KARZ KATZ KBAZ KIW KMRZ KRHZ KRVZ KUTZ KWHZ LIRZ LREZ MARZ MBAZ MCHZ MHCZ MHEZ MHGZ MKRZ MOVZ MRHZ MRNZ MSWZ MTHZ MTVZ MTW MUGZ MYRZ NBEZ NEZ NGRZ NGZ NMEZ NMHZ NNVZ OGWZ OHWZ OKCZ OMRZ PAWZ PKE PKGZ PKVZ PLWZ PNHZ POIZ POWZ PREZ PRGZ PRHZ PRRZ PRWZ RACZ RAGZ RAHZ RIGZ RITZ RRRZ RUGZ RVAZ SNGZ SNVZ TARZ TCW TGRZ TIWZ TKGZ TKNZ TMWZ TRWZ TUVZ TUWZ TWGZ TWVZ UTU WACZ WATZ WHHZ WHRZ WHTZ WIAZ WMGZ WNVZ WPHZ WPRZ WTAZ WTVZ"

#service
starttime='2019-07-21T00:00:00.000'
endtime='2019-07-21T00:15:00.000'

if [ -f logfile.short.ser ]; then
	\rm logfile.short.ser
fi

for site in $HH
do
	echo $site
	curl -s "https://service.geonet.org.nz/fdsnws/dataselect/1/query?station=$site&network=NZ&location=10&channel=HH?&starttime=$starttime&endtime=$endtime" -o /dev/null -w "%{time_total},%{time_starttransfer},%{time_pretransfer},%{speed_download},%{size_download},%{url_effective}\n" >> logfile.short.ser
done

for site in $EH
do
	echo $site
	curl -s "https://service.geonet.org.nz/fdsnws/dataselect/1/query?station=$site&network=NZ&location=10&channel=EH?&starttime=$starttime&endtime=$endtime" -o /dev/null -w "%{time_total},%{time_starttransfer},%{time_pretransfer},%{speed_download},%{size_download},%{url_effective}\n" >> logfile.short.ser
done

#service-nrt
starttime='2019-08-21T00:00:00.000'
endtime='2019-08-21T00:15:00.000'

if [ -f logfile.short.nrt ]; then
	\rm logfile.short.nrt
fi

for site in $HH
do
	echo $site
	curl -s "https://service-nrt.geonet.org.nz/fdsnws/dataselect/1/query?station=$site&network=NZ&location=10&channel=HH?&starttime=$starttime&endtime=$endtime" -o /dev/null -w "%{time_total},%{time_starttransfer},%{time_pretransfer},%{speed_download},%{size_download},%{url_effective}\n" >> logfile.short.nrt
done

for site in $EH
do
	echo $site
	curl -s "https://service-nrt.geonet.org.nz/fdsnws/dataselect/1/query?station=$site&network=NZ&location=10&channel=EH?&starttime=$starttime&endtime=$endtime" -o /dev/null -w "%{time_total},%{time_starttransfer},%{time_pretransfer},%{speed_download},%{size_download},%{url_effective}\n" >> logfile.short.nrt
done
