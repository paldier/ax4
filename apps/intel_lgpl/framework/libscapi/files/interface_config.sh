#!/bin/bash



file=$1 ;
configFilePath=$2 ;
sList= ;
sInterface= ;
sLanArr= ;
sWanArr= ;

#remove if any existing file
rm -rf $configFilePath ;
count_int=0;
count_lan=0;
count_wan=0;


while read -r line;
 do 
{
    #Inputs to the script, the delimiter, and the string itself

    substring="CONFIG_INTERFACE";
    
    string=$line ; 
    #read each line of file
    if test "${line#$substring}" != "$line"
    then
        #Split the String into Substrings (CONIG_INTERFACE1_TYPE->1_TYPE)
        sList=$(echo $string | sed -e 's/^ *CONFIG_INTERFACE//g' | sed 's/'\"'//g');
       sInterface[$count_int]=$sList; 

       count_int=$count_int+1 ;
   
        #process if type is LAN 
        if [[ "$sList" == *_TYPE*=*LAN* ]];then
            #saving the interface number in pos_lantype
            pos_lantype=$(echo  ${sList//[^0-9]/});

        #get all the paramter for interface_position check if interface name is present then add in lan interface
        while read -r interfaceline;
        do 
            #Inputs to the script, the delimiter, and the string itself

            substring="CONFIG_INTERFACE";
    
            string=$interfaceline ; 
            #read each line of file
            if test "${interfaceline#$substring}" != "$interfaceline"
            then
                #Split the String into Substrings (CONIG_INTERFACE1_TYPE->1_TYPE)
                sInterfaceList=$(echo $string | sed -e 's/^ *CONFIG_INTERFACE//g' | sed 's/'\"'//g');
            
                if [[ "$sInterfaceList" == $pos_lantype"_IFNAME"* ]];then
                    varVal=$(echo $sInterfaceList | cut -f2 -d=)

                    #if not empty then copy the index in lan array
                    if [[ ! -z "${varVal// }" ]]; then
                        sLanArr[$count_lan]=$pos_lantype ;
                        count_lan=$count_lan+1 ;
                    fi
                fi
            fi 

        done < $file

        fi #end of lan

        
        

        #process if type is WAN 
        if [[ "$sList" == *_TYPE*=*WAN* ]];then
            pos_wantype=$(echo  ${sList//[^0-9]/});

        #get all the paramter for interface_position check if interface name is present then add in wan interface
        while read -r interfaceline;
        do 
            #Inputs to the script, the delimiter, and the string itself

            substring="CONFIG_INTERFACE";
    
            string=$interfaceline ; 
            #read each line of file
            if test "${interfaceline#$substring}" != "$interfaceline"
            then
                #Split the String into Substrings (CONIG_INTERFACE1_TYPE->1_TYPE)
                sInterfaceList=$(echo $string | sed -e 's/^ *CONFIG_INTERFACE//g' | sed 's/'\"'//g');
                #check if IFNAME is empty
                if [[ "$sInterfaceList" == $pos_wantype"_IFNAME"* ]];then
                    varVal=$(echo $sInterfaceList | cut -f2 -d=)


                    #if not empty then copy the index in wan array
                    if [[ ! -z "${varVal// }" ]]; then
                    sWanArr[$count_wan]=$pos_wantype ;
                    count_wan=$count_wan+1 ;
                    fi
                fi 
                
            fi

        done < $file

        fi #end of wan
        

    fi

}
done < $file

i=1;
count=1;
#for each lan array,output the interface to config file
for (( j = 0; j < ${#sLanArr[@]}; j++ )); do
    echo -e "###################LAN-${i}###########\n{" >> $configFilePath ;
    for (( k = 0; k < ${#sInterface[@]}; k++ )); do


    if [[ ${sInterface[k]} =~ ^${sLanArr[j]}_.* ]];then
        if [[ ${sInterface[k]} =~ ^.*=y$ ]]; then
            echo  ${sInterface[k]} | sed 's/^[0-9]*_//' | sed 's/=y$/=true/' >> $configFilePath ;
        else
        echo  ${sInterface[k]} | sed 's/^[0-9]*_//' >> $configFilePath ;
        fi
    fi
    done
    echo -e "}\n###################END LAN-${i}#######" >> $configFilePath ;
    ((i++))
    ((count++))
    done
i=1;
#for each wan array,output the interface to config file
for (( j = 0; j < ${#sWanArr[@]}; j++ )); do
    echo -e "###################WAN-${i}###########\n{" >> $configFilePath ;
    for (( k = 0; k < ${#sInterface[@]}; k++ )); do


    if [[ ${sInterface[k]} =~ ^${sWanArr[j]}_.* ]];then
        if [[ ${sInterface[k]} =~ ^.*=y$ ]]; then
            echo  ${sInterface[k]} | sed 's/^[0-9]*_//' | sed 's/=y$/=true/' >> $configFilePath ;
        else
            echo  ${sInterface[k]} | sed 's/^[0-9]*_//' >> $configFilePath ;
        fi
    fi
    done
    echo -e "}\n###################END WAN-${i}#######" >> $configFilePath ;
    ((i++))
    ((count++))
    done





