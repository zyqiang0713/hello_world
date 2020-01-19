#curl -c cookies http://ukgil-ww01.europe.delphiauto.net/cqweb/
#curl -l http://ukgil-ww01.europe.delphiauto.net/cqweb/cqlogin.cq?action=DoLogin HTTP/1.1 
# cc.sh -c downloadGV -g 291244
name=zhaoy2
password=iamnew2cq
toolfolder="C:/D/Project/GV_Download/"
cqName="bjq5dl"
cqPassword=Zxcvbnm,./
function display_help(){

        echo "cq.sh Help"
        echo "   \ 
        -c downloadGV -g xxxxxx :  
        -c create_gv            :  
        -c downloadSpec -s AXXXXXXX_1.0    
"
}

while getopts "c:g:s:h" arg
do
        case $arg in
             c)
                echo -e "\033[32mCMD is $OPTARG  \033[0m"
                CMD=$OPTARG
                ;;
             g)
                echo -e "\033[32mCMDGV is $OPTARG  \033[0m"
                GV=$OPTARG
                ;;
             s)
                echo -e "\033[32mSPEC is $OPTARG  \033[0m"
                SPEC=$OPTARG
                ;;
             h)
                display_help
                ;;
             ?)  #当有不认识的选项的时候arg为?
            echo "Unkonw Argument!"
        exit 1
        ;;
        esac
done

if [ -n "$CMD" ]; then
  case $CMD in
          downloadGV)
                  ## Connect to Server
                  curl -b cookies -c cookies -o log1 --user-agent Mozilla/5.0 -d "loginId=${name}&password=${password}&repository=8.0.0&tzOffset=GMT%2B8%3A00&tzFilters=1546272000000%2C-480&loadAllRequiredInfo=true" "http://ukgil-ww01.europe.delphiauto.net/cqweb/cqlogin.cq?action=DoLogin"
                  curl -b cookies -c cookies -o log1 --user-agent Mozilla/5.0  -d "userDb=GV&loadAllRequiredInfo=true" "http://ukgil-ww01.europe.delphiauto.net/cqweb/cqlogin.cq?action=DoConnect HTTP/1.1"
                  #cp  -f cookies cookies
                  pwd
                  cquid=`grep -i "cquid" log1 | awk -F\' '{print $2}'` 
                  echo -e "\033[32m cquid:${cquid} \033[0m"
                  if [ ! -n "${cquid}" ]; then
                        echo "Connecting CQ Error, Please Try Again!"
                        exit
                  fi
                  curl -b cookies -c cookies -o log2 -H "cquid:${cquid}"  --referer http://ukgil-ww01.europe.delphiauto.net/cqweb/  --user-agent Mozilla/5.0  "http://ukgil-ww01.europe.delphiauto.net/cqweb/cqnav.cq?action=getRootNodes&refresh=false"
                  #cp  -f cookies cookies
                  #curl -b cookies   -c cookies -o log3 -H "cquid:${cquid}"  --referer http://ukgil-ww01.europe.delphiauto.net/cqweb/ -d "prefData=%7B%22HIDDEN_FIELDS%22%3A%7B%22MORSubmitTypes%22%3A%7B%22value%22%3A%5B%7B%22DisplayName%22%3A%22Baseline%22%2C%22LocationId%22%3A%22cq.record%3ABaseline%408.0.0%2FGV%22%7D%2C%7B%22DisplayName%22%3A%22IntegrationRequest%22%2C%22LocationId%22%3A%22cq.record%3AIntegrationRequest%408.0.0%2FGV%22%7D%2C%7B%22DisplayName%22%3A%22CR%22%2C%22LocationId%22%3A%22cq.record%3ACR%408.0.0%2FGV%22%7D%2C%7B%22DisplayName%22%3A%22content_request%22%2C%22LocationId%22%3A%22cq.record%3Acontent_request%408.0.0%2FGV%22%7D%2C%7B%22DisplayName%22%3A%22RAR%22%2C%22LocationId%22%3A%22cq.record%3ARAR%408.0.0%2FGV%22%7D%2C%7B%22DisplayName%22%3A%22sw_milestone%22%2C%22LocationId%22%3A%22cq.record%3Asw_milestone%408.0.0%2FGV%22%7D%5D%7D%2C%22STARTUP_QUERY%22%3A%7B%22value%22%3A%22%257B%2522loginDate%2522%253A%2522Wed%252C%252030%2520Oct%25202019%252001%253A14%253A18%2520GMT%2522%257D%22%7D%7D%2C%22generalView%22%3A%7B%22LOAD_STARTUP_QUERY_RESULT%22%3A%7B%22defaultValue%22%3A%22true%22%2C%22possibleValues%22%3A%22true%24false%22%2C%22uiCTRL%22%3A%22CHECKBOX%22%2C%22value%22%3A%22true%22%7D%2C%22SHOW_PROPERTIES_VIEW%22%3A%7B%22defaultValue%22%3A%22false%22%2C%22possibleValues%22%3A%22true%24false%22%2C%22uiCTRL%22%3A%22CHECKBOX%22%2C%22value%22%3A%22false%22%7D%7D%2C%22mruView%22%3A%7B%22MRU_PAGE_SIZE%22%3A%7B%22defaultValue%22%3A100%2C%22maxValue%22%3A%22maxMruPageSize%22%2C%22minValue%22%3A1%2C%22required%22%3Atrue%2C%22uiCTRL%22%3A%22NUMBERBOX%22%2C%22value%22%3A100%7D%2C%22MRU_PS_ASK_WHEN_INCREASING%22%3A%7B%22defaultValue%22%3A%22askMe%22%2C%22possibleValues%22%3A%22increasePageSize%24keepPageSize%24askMe%22%2C%22uiCTRL%22%3A%22COMBOBOX%22%2C%22value%22%3A%22askMe%22%7D%2C%22MRU_PS_ASK_WHEN_REDUCING%22%3A%7B%22defaultValue%22%3A%22askMe%22%2C%22possibleValues%22%3A%22decreasePageSize%24askMe%22%2C%22uiCTRL%22%3A%22COMBOBOX%22%2C%22value%22%3A%22askMe%22%7D%7D%2C%22resultSetview%22%3A%7B%22NUMBER_ROWS_PER_PAGE%22%3A%7B%22defaultValue%22%3A%2220%22%2C%22possibleValues%22%3A%2220%2450%24100%22%2C%22uiCTRL%22%3A%22COMBOBOX%22%2C%22value%22%3A%2220%22%7D%2C%22OPEN_RELATED_RECORD%22%3A%7B%22defaultValue%22%3A%22floatingPane%22%2C%22possibleValues%22%3A%22floatingPane%24tab%22%2C%22uiCTRL%22%3A%22COMBOBOX%22%2C%22value%22%3A%22floatingPane%22%7D%2C%22RESULTSET_DATE_FORMAT%22%3A%7B%22defaultValue%22%3A%22longDate%22%2C%22possibleValues%22%3A%22longDate%24mediumDate%24shortDate%22%2C%22uiCTRL%22%3A%22COMBOBOX%22%2C%22value%22%3A%22longDate%22%7D%2C%22SHOW_CUSTOM_RECORD_VIEW%22%3A%7B%22defaultValue%22%3A%22false%22%2C%22possibleValues%22%3A%22true%24false%22%2C%22uiCTRL%22%3A%22CHECKBOX%22%2C%22value%22%3A%22false%22%7D%2C%22SHOW_SPLIT_VIEW%22%3A%7B%22defaultValue%22%3A%22single%22%2C%22possibleValues%22%3A%22single%24split%22%2C%22uiCTRL%22%3A%22COMBOBOX%22%2C%22value%22%3A%22single%22%7D%2C%22SORT_SERVER_CLIENT%22%3A%7B%22defaultValue%22%3A%22client%22%2C%22possibleValues%22%3A%22client%24server%22%2C%22uiCTRL%22%3A%22COMBOBOX%22%2C%22value%22%3A%22client%22%7D%7D%7D" --user-agent Mozilla/5.0  "http://ukgil-ww01.europe.delphiauto.net/cqweb/cquser.cq?action=setPreference"
                  ##cp  -f cookies cookies
                  ############################################## Find GV Number and Get Details###############################
                  # echo $fetch_url | sed 's/{/%7B/g;s/}/%7D/g;s/:/%3A/g;s/\"/%22/g;s/,/%2C/g;s/:/%3A/g;s/\//%2F/g;s/@/%40/g'
                  
                  #Create Folder for GV
                  if [ ! -n "${GV}" ]; then
                        echo "Please add -g parameter for GV"
                        exit
                  fi
                  recordId=${GV}
                  if [ ! -d ${toolfolder}${recordId} ]; then
                        mkdir ${toolfolder}${recordId}
                  fi
                  outPath=${toolfolder}${recordId}
                  outPathWin=$(echo ${outPath} | sed 's:/:\\:g')
                  explorer.exe ${outPathWin}

                  #Find GV Number and Get resourceId
                  curl   -b cookies -c cookies  -o log -H "cquid:${cquid}"  --referer http://ukgil-ww01.europe.delphiauto.net/cqweb/ --user-agent Mozilla/5.0  "http://ukgil-ww01.europe.delphiauto.net/cqweb/cqfind.cq?action=DoFindRecord&recordId=${recordId}&searchType=BY_RECORD_ID"
                  #cp  -f cookies cookies
                  # get resourceId from previous response
                  resourceId=`grep -o -e "id:'.*'" log | awk -F\' '{print $2}'` 
                  echo -e "\033[32m  resourceId: ${resourceId}  \033[0m"
                  resourceId_url=`echo $resourceId | sed 's/%7B/{/g;s/%7D/}/g;s/%3A/:/g;s/%22/\"/g;s/%2C/,/g;s/%3A/:/g;s/%2F/\//g;s/%40/@/g;s/%5B/[/g;s/%5D/]/g;s/%20/ /g'`
                  echo -e "\033[32m resourceId_url: ${resourceId_url} \033[0m"
                  if [ ! -n "${resourceId}" ]; then
                        echo "Not Get this GV Location, Details in log File!"
                        exit
                  fi
                  #grep "cqLoginInfo" cookies >/dev/null

                  ## Get GV Details and Attached files Folder Path
                  curl -b cookies   -c cookies -o response -H "cquid:${cquid}"   --user-agent Mozilla/5.0  "http://ukgil-ww01.europe.delphiauto.net/cqweb/cqartifactdetails.cq?action=GetCQRecordDetails&resourceId=${resourceId_url}&state=VIEW&tabIndex=0&acceptAllTabsData=true"
                  attachFileFolderId=$(grep -oP '(?<=AttachmentFolderId": ").*(?=")'  response |  sed 's/\\//g')
                  if [ ! -n "${attachFileFolderId}" ]; then
                        echo "Do not Get Attached Files Folder Path!"
                        exit
                  fi
                  #cp  -f cookies cookies
                  #Get attached File location and Downloading

                  requestDataRaw="resourceId=${resourceId_url}&field=${attachFileFolderId}"
                  requestData=$(echo ${requestDataRaw} | sed -e 's/{/%7B/g' -e 's/}/%7D/g' -e 's/:/%3A/g' -e 's/\"/%22/g' -e 's/,/%2C/g' -e 's/:/%3A/g' -e 's/\//%2F/g' -e 's/@/%40/g' -e 's/\[/%5B/g' -e 's/\]/%5D/g'  -e 's/ /%20/g')

                  curl  -b cookies   -c cookies -o response -H "cquid:${cquid}"   --user-agent Mozilla/5.0  -d ${requestDataRaw} "http://ukgil-ww01.europe.delphiauto.net/cqweb/cqartifactdetails.cq?action=GetAttachmentList"
                  attachFileList=$(grep -oP '(?<=RecordId": ").*(?=")'  response |  sed 's/\\//g')
                  for fileId in ${attachFileList}
                  do
                        echo ${fileId}
                        fileName=$(echo ${fileId} | grep -oP '(?<=ments/).*(?=@)')
                        ###Get Files!
                        #grep -oP '(?<=RecordId": ").*(?=")'  response2 |  sed 's/\\//g' | grep -oP '(?<=ments/).*(?=@)'
                        curl  -b cookies   -c cookies -o ${outPath}"\\"${fileName} -H "cquid:${cquid}"   --user-agent Mozilla/5.0  -d "cquid=${cquid}" "http://ukgil-ww01.europe.delphiauto.net/cqweb/cqartifactdetails.cq?action=GetAttachmentContents&attachmentId=${fileId}&resourceId=${resourceId_url}"

                  done

                  #cp  -f cookies cookies
                  echo -e "\033[32m Press Any Key to Continue!!!!\033[0m"
                  read dummy
                  ;;

          create_gv)
                  ## Connect to Server
                  curl -b cookies -c cookies -o log1 --user-agent Mozilla/5.0 -d "loginId=${name}&password=${password}&repository=8.0.0&tzOffset=GMT%2B8%3A00&tzFilters=1546272000000%2C-480&loadAllRequiredInfo=true" "http://ukgil-ww01.europe.delphiauto.net/cqweb/cqlogin.cq?action=DoLogin"
                  curl -b cookies -c cookies -o log1 --user-agent Mozilla/5.0  -d "userDb=GV&loadAllRequiredInfo=true" "http://ukgil-ww01.europe.delphiauto.net/cqweb/cqlogin.cq?action=DoConnect HTTP/1.1"
                  #cp  -f cookies cookies
                  pwd
                  cquid=`grep -i "cquid" log1 | awk -F\' '{print $2}'` 
                  echo -e "\033[32m cquid:${cquid} \033[0m"
                  if [ ! -n "${cquid}" ]; then
                        echo "Connecting CQ Error, Please Try Again!"
                        exit
                  fi
                  curl -b cookies -c cookies -o log2 -H "cquid:${cquid}"  --referer http://ukgil-ww01.europe.delphiauto.net/cqweb/  --user-agent Mozilla/5.0  "http://ukgil-ww01.europe.delphiauto.net/cqweb/cqnav.cq?action=getRootNodes&refresh=false"
                  #cp  -f cookies1 cookies
                  ############################################## Create New GV Record################
                  #create new record
                  #GET /cqweb/cqartifactdetails.cq?action=NewRecord&recordType=cq.record%3ACR%408.0.0%2FGV&tabIndex=0&acceptAllTabsData=true&dojo.preventCache=1572326248453 HTTP/1.1
                  curl -b cookies -c cookies  -o response6 -H "cquid:${cquid}"    --user-agent Mozilla/5.0  "http://ukgil-ww01.europe.delphiauto.net/cqweb/cqartifactdetails.cq?action=GetSubmitForm&recordType=cq.record:CR@8.0.0/GV"
                  #cp  -f cookies cookies

                  curl -b cookies  -c cookies -o response -H "cquid:${cquid}"    --user-agent Mozilla/5.0  "http://ukgil-ww01.europe.delphiauto.net/cqweb/cqartifactdetails.cq?action=NewRecord&recordType=cq.record:CR@8.0.0/GV&tabIndex=0&acceptAllTabsData=true"
                  #cp  -f cookies cookies
                  #grep "cqLoginInfo" cookies >/dev/null
                  #if [ $? -eq 0 ]; then
                  #    echo "No Need add extra Cookie"
                  #else
                  #    cat addedCookie.txt | tee -a cookies >/dev/null
                  #fi
                  
                  gvno=`grep -o "DisplayName.*" response | sed 's/.*\(GV[0-9]*\).*/\1/g'`
                  echo -e "\033[32m Create ${gvno}! \033[0m"
                  stableLocation=$(grep -o "StableLocation.*" response | sed 's/.*\(cq\..*GV\).*/\1/g' | sed 's/\\\//\//g')
                  echo -e "\033[32m stableLocation: ${stableLocation}! \033[0m"
                  if [ ! -n ${stableLocation} ]; then
                        echo "Do not Get GV and StablelocationId"
                        exit
                  fi
                  #GET /cqweb/cqartifactdetails.cq?action=GetChoiceList&resourceId=cq.repo.cq-record%3A16777225%2F923038039%408.0.0%2FGV&fieldName=activity&cq.preventCache=1572326251718&sort=false&requestString=s*&realTypeaheadReq=false&dojo.preventCache=1572326372498 HTTP/1.1

                  #POST /cqweb/cqartifactdetails.cq?action=RecordUpdate&resourceId=cq.repo.cq-record%3A16777225%2F923038039%408.0.0%2FGV HTTP/1.1   Fields=%5B%7B%22FieldName%22%3A%22activity%22%2C%22FieldValue%22%3A%22s%22%7D%5D&state=SUBMIT&stableLocation=cq.repo.cq-record%3A16777225%2F923038039%408.0.0%2FGV
                  #GET /cqweb/cqartifactdetails.cq?action=GetChoiceList&resourceId=${stableLocation}&fieldName=activity&cq.preventCache=1572341552873&sort=false&requestString=*&realTypeaheadReq=false&dojo.preventCache=1572341560745 HTTP/1.1
                  curl   -b cookies    -c cookies  -o response4 -H "cquid:${cquid}" -H "Origin: http://ukgil-ww01.europe.delphiauto.net"   --user-agent Mozilla/5.0  "http://ukgil-ww01.europe.delphiauto.net/cqweb/cqartifactdetails.cq?action=GetChoiceList&resourceId=${stableLocation}&fieldName=activity&sort=false&requestString=*&realTypeaheadReq=false"
                  #cp  -f cookies cookies
                  #grep "cqLoginInfo" cookies >/dev/null
                  #if [ $? -eq 0 ]; then
                  #    echo "No Need add extra Cookie"
                  #else
                  #    cat addedCookie.txt | tee -a cookies >/dev/null
                  #fi
                  para=$3
                  echo ${para[*]}
                  for i in ${para[*]}; do
                        echo $i
                  done
                  gv=(`echo ${para[*]}`)
                  echo "${gv[0]}"
                  echo "${gv[1]}"
                  echo "${gv[2]}"
                  echo "${gv[3]}"
                  echo "${gv[4]}"
                  echo "${gv[5]}"
                  echo "${gv[6]}"
                  echo "${gv[7]}"
                  exit
                  Application=${gv[0]}
                  classification=${gv[1]}
                  Description=${gv[2]}
                  Headline=${gv[3]}
                  Project=${gv[4]}
                  Severity=${gv[5]}
                  Stage_Found=${gv[6]}
                  activity=${gv[7]}
                  parent=${gv[8]}

                  if [ ! -n "${activity}" -a ! -n "${Description}" ]; then
                        echo "Need more variabless! Project,activity,Description!"
                        exit
                  fi

                  requestDataRaw="Fields=[{\"FieldName\":\"activity\",\"FieldValue\":\"${activity}\"}]&state=SUBMIT&stableLocation=${stableLocation}"
                  requestData=$(echo ${requestDataRaw} | sed -e 's/{/%7B/g' -e 's/}/%7D/g' -e 's/:/%3A/g' -e 's/\"/%22/g' -e 's/,/%2C/g' -e 's/:/%3A/g' -e 's/\//%2F/g' -e 's/@/%40/g' -e 's/\[/%5B/g' -e 's/\]/%5D/g'  -e 's/ /%20/g')
                  echo -e "\033[32m requestData: ${requestData} \033[0m"
                  #Fields=%5B%7B%22FieldName%22%3A%22activity%22%2C%22FieldValue%22%3A%22Software%22%7D%5D&state=SUBMIT&stableLocation=cq.repo.cq-record%3A16777225%2F923038039%408.0.0%2FGV
                  curl --trace trace1 -b cookies   -c cookies -o response1 --user-agent Mozilla/5.0  -H "cquid:${cquid}" -H "Host: ukgil-ww01.europe.delphiauto.net" -H "Origin: http://ukgil-ww01.europe.delphiauto.net" -d ${requestData} "http://ukgil-ww01.europe.delphiauto.net/cqweb/cqartifactdetails.cq?action=RecordUpdate&resourceId=${stableLocation}"
                  #cp  -f cookies cookies
                  
                  #requestDataRaw="Fields=[{\"FieldName\":\"parent\",\"FieldValue\":\"${parent}\"}]&state=SUBMIT&stableLocation=${stableLocation}"
                  #requestData=$(echo ${requestDataRaw} | sed -e 's/{/%7B/g' -e 's/}/%7D/g' -e 's/:/%3A/g' -e 's/\"/%22/g' -e 's/,/%2C/g' -e 's/:/%3A/g' -e 's/\//%2F/g' -e 's/@/%40/g' -e 's/\[/%5B/g' -e 's/\]/%5D/g'  -e 's/ /%20/g')
                  #echo -e "\033[32m requestData: ${requestData} \033[0m"
                  #curl  -b cookies   -c cookies -o response2 --user-agent Mozilla/5.0  -H "cquid:${cquid}" -H "Host: ukgil-ww01.europe.delphiauto.net" -H "Origin: http://ukgil-ww01.europe.delphiauto.net"  -d ${requestData} "http://ukgil-ww01.europe.delphiauto.net/cqweb/cqartifactdetails.cq?action=RecordUpdate&resourceId=${stableLocation}"
                  ##cp  -f cookies cookies
                  
                  requestDataRaw="Fields=[{\"FieldName\":\"Application\",\"FieldValue\":\"${Application}\"},\
{\"FieldName\":\"classification\",\"FieldValue\":\"${classification}\"},\
{\"FieldName\":\"Project\",\"FieldValue\":\"${Project}\"},\
{\"FieldName\":\"Severity\",\"FieldValue\":\"${Severity}\"},\
{\"FieldName\":\"Stage_Found\",\"FieldValue\":\"${Stage_Found}\"}]&state=SUBMIT&stableLocation=${stableLocation}"

                  requestData=$(echo ${requestDataRaw} | sed -e 's/{/%7B/g' -e 's/}/%7D/g' -e 's/:/%3A/g' -e 's/\"/%22/g' -e 's/,/%2C/g' -e 's/:/%3A/g' -e 's/\//%2F/g' -e 's/@/%40/g' -e 's/\[/%5B/g' -e 's/\]/%5D/g'  -e 's/ /%20/g')
                  echo -e "\033[32m requestData: ${requestData} \033[0m"
                  curl -b cookies   -c cookies -o response2 --user-agent Mozilla/5.0  -H "cquid:${cquid}" -H "Host: ukgil-ww01.europe.delphiauto.net" -H "Origin: http://ukgil-ww01.europe.delphiauto.net"  -d ${requestData} "http://ukgil-ww01.europe.delphiauto.net/cqweb/cqartifactdetails.cq?action=RecordUpdate&resourceId=${stableLocation}"
                  #cp  -f cookies cookies

                  requestDataRaw="Fields=[]&state=SUBMIT&stableLocation=${stableLocation}"
                  requestData=$(echo ${requestDataRaw} | sed -e 's/{/%7B/g' -e 's/}/%7D/g' -e 's/:/%3A/g' -e 's/\"/%22/g' -e 's/,/%2C/g' -e 's/:/%3A/g' -e 's/\//%2F/g' -e 's/@/%40/g' -e 's/\[/%5B/g' -e 's/\]/%5D/g'  -e 's/ /%20/g')
                  echo -e "\033[32m requestData: ${requestData} \033[0m"
                  curl -b cookies   -c cookies -o response2 --user-agent Mozilla/5.0  -H "cquid:${cquid}" -H "Host: ukgil-ww01.europe.delphiauto.net" -H "Origin: http://ukgil-ww01.europe.delphiauto.net"  -d ${requestData} "http://ukgil-ww01.europe.delphiauto.net/cqweb/cqartifactdetails.cq?action=FireHook&resourceId=${stableLocation}&hookResourceId=cq.hook:CR/Clone@8.0.0/GV"
                  #cp  -f cookies cookies

                  requestDataRaw="state=SUBMIT&Fields=[{\"FieldName\":\"Headline\",\"FieldValue\":\"${Headline}\"},{\"FieldName\":\"Description\",\"FieldValue\":[\"${Description}\"]}]&resourceId=${stableLocation}"
                  requestData=$(echo ${requestDataRaw} | sed -e 's/{/%7B/g' -e 's/}/%7D/g' -e 's/:/%3A/g' -e 's/\"/%22/g' -e 's/,/%2C/g' -e 's/:/%3A/g' -e 's/\//%2F/g' -e 's/@/%40/g' -e 's/\[/%5B/g' -e 's/\]/%5D/g'  -e 's/ /%20/g')
                  echo -e "\033[32m requestData: ${requestData} \033[0m"
                  curl  -b  cookies   -c cookies1 -o response3 --user-agent Mozilla/5.0 -H "cquid:${cquid}"  -H "Host: ukgil-ww01.europe.delphiauto.net" -H "Origin: http://ukgil-ww01.europe.delphiauto.net"  -d ${requestData}  "http://ukgil-ww01.europe.delphiauto.net/cqweb/cqartifactdetails.cq?action=RecordCommit HTTP/1.1"
                  grep "true" response3
                  if [ $? -e 0 ]; then
                        echo "${gvno}  Commit Success!"
                  fi
                  #cp  -f cookies1 cookies

                  #Submit Record, confirm gv
                  echo "Press Any Key to Continue!!!!"
                  read dummy 
                  ;;

          downloadSpec)
                  # SPEC CQ
                  ####

                  curl -c cookies -o log --user-agent Mozilla/5.0   "http://frblo-ap20.europe.delphiauto.net/cqweb/"
                  cquid=`grep -i "cquidstring" log | awk -F\" '{print $2}'` 
                  echo -e "\033[31m  cquid:${cquid} \033[0m"
                  
                  #login SPEC CQ
                  curl -b cookies -c cookies -o log -H "cquid:${cquid}"  --user-agent Mozilla/5.0 -d "loginId=asia%5C${cqName}&password=${cqPassword}&repository=CQ_TCBL&tzOffset=GMT%2B8%3A00&tzFilters=1546272000000%2C-480&loadAllRequiredInfo=true&manualOverrideSSO=false&reAuthentication=false" "http://frblo-ap20.europe.delphiauto.net/cqweb/cqlogin.cq?action=DoLogin"
                  tmp=`grep -i "cquid" log | awk -F\' '{print $2}'` 
                  if [ $tmp ]; then
                    cquid=${tmp}
                  fi
                  
                  #curl -b cookies -c cookies -o cqresponse -H "cquid:${cquid}"  --user-agent Mozilla/5.0  "http://frblo-ap20.europe.delphiauto.net/cqweb/scripts/dds/FileDownload.jsp?file=reports/B8515308_3.0.pdf&contentDisp=attachment"
                  outLine=${SPEC}
                  specId=$(echo ${SPEC} | sed 's/_/ /g')
                  specDir=$(echo ${specId} | sed 's/ /_/g')
                  if [ ! -d ${toolfolder}${specDir} ]; then
                        mkdir ${toolfolder}${specDir}
                  fi
                  outPath=${toolfolder}${specDir}
                  outPathWin=$(echo ${outPath} | sed 's:/:\\:g')
                  explorer.exe ${outPathWin}

                  specId_url=$(echo ${specId} | sed -e 's/{/%7B/g' -e 's/}/%7D/g' -e 's/:/%3A/g' -e 's/\"/%22/g' -e 's/,/%2C/g' -e 's/:/%3A/g' -e 's/\//%2F/g' -e 's/@/%40/g' -e 's/\[/%5B/g' -e 's/\]/%5D/g'  -e 's/ /%20/g')
                  curl -b cookies -c cookies -o cqresponse -H "cquid:${cquid}"  --user-agent Mozilla/5.0  "http://frblo-ap20.europe.delphiauto.net/cqweb/cqfind.cq?action=DoFindRecord&recordId=${specId_url}&searchType=BY_RECORD_ID"
                  resourceId=`grep -o -e "id:'.*'" cqresponse | awk -F\' '{print $2}'` 
                  echo -e "\033[32m  resourceId: ${resourceId}  \033[0m"
                  resourceId_url=`echo $resourceId | sed 's/%7B/{/g;s/%7D/}/g;s/%3A/:/g;s/%22/\"/g;s/%2C/,/g;s/%3A/:/g;s/%2F/\//g;s/%40/@/g;s/%5B/[/g;s/%5D/]/g;s/%20/ /g'`
                  ####
                  cat cqresponse

                  # Get spec details, get attachment files location
                  curl -b cookies -c cookies -o cqresponse -H "cquid:${cquid}"  --user-agent Mozilla/5.0  "http://frblo-ap20.europe.delphiauto.net/cqweb/cqartifactdetails.cq?action=GetCQRecordDetails&resourceId=${resourceId}&state=VIEW&tabIndex=0&acceptAllTabsData=true"
                  cat cqresponse

                  # Get all spec_files location with "cq.repoXXXXXXXXXXX"
                  cat cqresponse | grep -A2 -P '"DisplayName": "[0-9]{8}"' |  grep -oP '(?<=StableLocation": ").*(?=")' | sed -e 's/\\//g' | tee cqFileLocation.txt > /dev/null
                  for stableLoc in `cat cqFileLocation.txt `
                  do
                        echo -e "\033[32m ${stableLoc} \033[0m"
                        attachFileResourceId=`echo ${stableLoc}`
                        attachFileResourceId_url=$(echo ${attachFileResourceId} | sed -e 's/{/%7B/g' -e 's/}/%7D/g' -e 's/:/%3A/g' -e 's/\"/%22/g' -e 's/,/%2C/g' -e 's/:/%3A/g' -e 's/\//%2F/g' -e 's/@/%40/g' -e 's/\[/%5B/g' -e 's/\]/%5D/g'  -e 's/ /%20/g')
                        if [ -z "${attachFileResourceId_url}" ]; then
                              echo -e "\033[31m Don't Get attachFileResourceId!  \033[0m"
                        fi

                        #Get every file detail info, like recordScriptAlias to download
                        curl -b cookies -c cookies -o cqresponse -H "cquid:${cquid}"  --user-agent Mozilla/5.0  "http://frblo-ap20.europe.delphiauto.net/cqweb/cqartifactdetails.cq?action=GetCQRecordDetails&resourceId=${attachFileResourceId_url}&state=VIEW&tabIndex=0&acceptAllTabsData=true"
                        #cat cqresponse
                        recordScriptAlias=$(cat cqresponse | grep -A1 '"DisplayName": "Extract"' | grep -oP '(?<="LocationId": ").*(?=")' | sed 's/\\//g')
                        recordScriptAlias_url=$(echo ${recordScriptAlias} | sed -e 's/{/%7B/g' -e 's/}/%7D/g' -e 's/:/%3A/g' -e 's/\"/%22/g' -e 's/,/%2C/g' -e 's/:/%3A/g' -e 's/\//%2F/g' -e 's/@/%40/g' -e 's/\[/%5B/g' -e 's/\]/%5D/g'  -e 's/ /%20/g')
      
                        #recordScriptAlias=    resourceId=  :  two parameters
                        curl -b cookies -c cookies -o cqresponse -H "cquid:${cquid}"  --user-agent Mozilla/5.0  "http://frblo-ap20.europe.delphiauto.net/cqweb/cqartifactdetails.cq?action=FireRecordScriptAlias&resourceId=${attachFileResourceId_url}&recordScriptAlias=${recordScriptAlias_url}"
                        #cat cqresponse

                        #Get file name and download the file with fileName
                        file=$(cat cqresponse | grep -oP '(?<="message": "SaveAsUrl ).*(?=")' | sed 's/\\//g')
                        echo -e "\033[32m ${file} \033[0m"
                        fileName=${file##*/}
                        if [ -z "${fileName}" ]; then
                              echo -e "\033[31m Don't Get file name!  \033[0m" | tee -a ${outPath}"/"error.txt
                        fi
                        curl -b cookies -c cookies -o ${outPath}"/"${fileName} -H "cquid:${cquid}"  --user-agent Mozilla/5.0  "http://frblo-ap20.europe.delphiauto.net/cqweb/scripts/dds/FileDownload.jsp?file=${file}&contentDisp=attachment"



                        ##exit    # below is download specific name files, it's not necessary
                        #filesuffix=${fileName##*.}
                        #if [[ ${filesuffix} == "mdl" ]] || [[ ${filesuffix} == "xml" ]] || [[ ${filesuffix} == "m" ]] || [[ ${filesuffix} == "xdic" ]]; then 
                        #  #fileName not include below strings
                        #  result=$(echo ${fileName} | grep 'simu.mdl')
                        #  result=${result}$(echo ${fileName} | grep -i 'str.xml')
                        #  result=${result}$(echo ${fileName} | grep 'simu_parameters.m')
                        #  if [ -z ${result} ]; then
                        #    curl -b cookies -c cookies -o ${outPath}"/"${fileName} -H "cquid:${cquid}"  --user-agent Mozilla/5.0  "http://frblo-ap20.europe.delphiauto.net/cqweb/scripts/dds/FileDownload.jsp?file=${file}&contentDisp=attachment"
                        #    outLine=${outLine}"    "${fileName}
                        #  fi
                        #fi
                  done
                  echo ${outLine} | tee -a SPECList.txt


                  #cat cqresponse | grep -A2 -P '"DisplayName": "[0-9]{8}"' |  grep -oP '(?<=StableLocation": ").*(?=")' | sed -e 's/\\//g' -e 's/^/\"/g' -e 's/$/\"/g'  | tee log
                  #recordsAll=""
                  #for stableLoc in `cat log`
                  #do
                  #      echo $stableLoc
                  #      recordsAll=${recordsAll}",${stableLoc}"
                  #done
                  #recordsAll=$(echo ${recordsAll} | sed 's/^,//g')
                  #echo ${recordsAll}

                  ### below steps must be followed, or could not download files!
                  #requestDataRaw="records=[${recordsAll}]&fields=[\"CCType\",\"CCName\",\"CCVersion\",\"PscmName\",\"CCFile_Id\"]&fieldSource=[\"Spec_Files\"]&resourceId=${resourceId}"
                  #requestData="records=%5B%22cq.repo.cq-record%3A16781055%2F51006298%40CQ_TCBL%2Fbl_gs%22%2C%22cq.repo.cq-record%3A16781055%2F51006300%40CQ_TCBL%2Fbl_gs%22%2C%22cq.repo.cq-record%3A16781055%2F51006303%40CQ_TCBL%2Fbl_gs%22%2C%22cq.repo.cq-record%3A16781055%2F51006308%40CQ_TCBL%2Fbl_gs%22%2C%22cq.repo.cq-record%3A16781055%2F51006311%40CQ_TCBL%2Fbl_gs%22%2C%22cq.repo.cq-record%3A16781055%2F51006313%40CQ_TCBL%2Fbl_gs%22%2C%22cq.repo.cq-record%3A16781055%2F51006316%40CQ_TCBL%2Fbl_gs%22%2C%22cq.repo.cq-record%3A16781055%2F51006319%40CQ_TCBL%2Fbl_gs%22%2C%22cq.repo.cq-record%3A16781055%2F51013334%40CQ_TCBL%2Fbl_gs%22%5D&fields=%5B%22CCType%22%2C%22CCName%22%2C%22CCVersion%22%2C%22PscmName%22%2C%22CCFile_Id%22%5D&fieldSource=%5B%22Spec_Files%22%5D&resourceId=cq.repo.cq-record%3A16777235%2F51006293%40CQ_TCBL%2Fbl_gs"
                  # URL format string data
                  #requestData=$(echo ${requestDataRaw} | sed -e 's/{/%7B/g' -e 's/}/%7D/g' -e 's/:/%3A/g' -e 's/\"/%22/g' -e 's/,/%2C/g' -e 's/:/%3A/g' -e 's/\//%2F/g' -e 's/@/%40/g' -e 's/\[/%5B/g' -e 's/\]/%5D/g'  -e 's/ /%20/g')
                  #curl -b cookies -c cookies -o cqresponse -H "cquid:${cquid}"  --user-agent Mozilla/5.0  -d ${requestData} "http://frblo-ap20.europe.delphiauto.net/cqweb/cqartifactdetails.cq?action=GetTableContents"
                  #cat cqresponse

                  #-------------------------------------------------------------------------------------------------
                  exit
                  #get detail information about specific file, like ***.pdf or ***.xml
                  #response include parameter : recordScriptAlias , resourceId 
                  attachFileResourceId="cq.repo.cq-record:16781055/51006300@CQ_TCBL/bl_gs"
                  attachFileResourceId_url=$(echo ${attachFileResourceId} | sed -e 's/{/%7B/g' -e 's/}/%7D/g' -e 's/:/%3A/g' -e 's/\"/%22/g' -e 's/,/%2C/g' -e 's/:/%3A/g' -e 's/\//%2F/g' -e 's/@/%40/g' -e 's/\[/%5B/g' -e 's/\]/%5D/g'  -e 's/ /%20/g')
                  if [ -z "${attachFileResourceId_url}" ]; then
                        echo -e "\033[31m Don't Get attachFileResourceId!  \033[0m"
                  fi
                  curl -b cookies -c cookies -o cqresponse -H "cquid:${cquid}"  --user-agent Mozilla/5.0  "http://frblo-ap20.europe.delphiauto.net/cqweb/cqartifactdetails.cq?action=GetCQRecordDetails&resourceId=${attachFileResourceId_url}&state=VIEW&tabIndex=0&acceptAllTabsData=true"
                  cat cqresponse
                  recordScriptAlias=$(cat cqresponse | grep -A1 '"DisplayName": "Extract"' | grep -oP '(?<="LocationId": ").*(?=")' | sed 's/\\//g')
                  recordScriptAlias_url=$(echo ${recordScriptAlias} | sed -e 's/{/%7B/g' -e 's/}/%7D/g' -e 's/:/%3A/g' -e 's/\"/%22/g' -e 's/,/%2C/g' -e 's/:/%3A/g' -e 's/\//%2F/g' -e 's/@/%40/g' -e 's/\[/%5B/g' -e 's/\]/%5D/g'  -e 's/ /%20/g')

                  #recordScriptAlias=    resourceId=  :  two parameters
                  curl -b cookies -c cookies -o cqresponse -H "cquid:${cquid}"  --user-agent Mozilla/5.0  "http://frblo-ap20.europe.delphiauto.net/cqweb/cqartifactdetails.cq?action=FireRecordScriptAlias&resourceId=${attachFileResourceId_url}&recordScriptAlias=${recordScriptAlias_url}"
                  cat cqresponse
                  #Get file name 
                  file=$(cat cqresponse | grep -oP '(?<="message": "SaveAsUrl ).*(?=")' | sed 's/\\//g')
                  echo ${file}
                  fileName=${file##*/}
                  if [ -z "${fileName}" ]; then
                        echo -e "\033[31m Don't Get file name!  \033[0m"
                        exit
                  fi
                  curl -b cookies -c cookies -o ${outPath}"/"${fileName} -H "cquid:${cquid}"  --user-agent Mozilla/5.0  "http://frblo-ap20.europe.delphiauto.net/cqweb/scripts/dds/FileDownload.jsp?file=${file}&contentDisp=attachment"

                  #### 
                  echo "download spec"
                  echo "Press Any Key to Continue!!!!"
                  read dummy 
                  ;;
          *)
                  echo "No this Command"
                  ;;
  esac
else 
  echo "no command found, please type -h for help"
fi