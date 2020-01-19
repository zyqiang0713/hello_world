#!/bin/bash

toolfolder="c:/d/Project/tool_proj/"
gvtool="C:/D/Tools/hello/delphi_cleartool/gv_routine/"
xdriver="x:/"
branchPre="task_zhaoy2_"
labelPre="TASK_ZHAOY2_"
cc_view='\\CNSHGCTC-AP07\views\ASIA\bjq5dl\'
display_help() {
    echo "Usage: $0 [option...] { }" >&2
    echo
    echo " -c    command:  
  lsvtree   : ls version tree                                       , -v -l
  fpy       : find file in py                                       , -v -f
  ffl       : find file in list                                     , -v -f, -p: list file property
  lview     : cleartool lsview                                      , -v
  find_str  : find string in all files                              , -v  -s
  createview: create view like -v 1jyucapp_b440p11_gv555555_zhaoy2  , -v 
  stview    : cleartool startview                                   , -v 
  find_label: find label in view                                    , -v  -l(optional)
  desc      : describe a file in specific view                      , -v  -f
  "
    echo " -l    label included string  "
    echo " -v    view    "
    echo
    # echo some stuff here for the -a or --add-options 
    exit 1
}
mk_label_branch(){
    cleartool mklbtype -global -nc ${label}'@\blois_code_p_l'
    cleartool mkbrtype -global -nc ${branch}'@\blois_code_p_l'
    cleartool mklbtype -global -nc ${label}'@\blois_soft_vob'
    cleartool mkbrtype -global -nc ${branch}'@\blois_soft_vob'
    cleartool mklbtype -global -nc ${label}'@\blois_hmc_code'
    cleartool mkbrtype -global -nc ${branch}'@\blois_hmc_code'
    cleartool mklbtype -global -nc ${label}'@\gill_vob'
    cleartool mkbrtype -global -nc ${branch}'@\gill_vob'
    cleartool mklbtype -global -nc ${label}'@\hwi_vob'
    cleartool mkbrtype -global -nc ${branch}'@\hwi_vob'
    cleartool mklbtype -global -nc ${label}'@\gwm_secure_vob'
    cleartool mkbrtype -global -nc ${branch}'@\gwm_secure_vob'
    cleartool mklbtype -global -nc ${label}'@\gill_dcm7_code'
    cleartool mkbrtype -global -nc ${branch}'@\gill_dcm7_code'
    cleartool mklbtype -global -nc ${label}'@\autosar_bsw_vob'
    cleartool mkbrtype -global -nc ${branch}'@\autosar_bsw_vob'
    echo "cleartool mkview -tag   %1   ${cc_view}%1.vws"
    cleartool mkview -tag   $1   ${cc_view}$1.vws
}
copy_config_view(){
  cp  ${winpath}"\\config_view.cfg"  "x:\\${VIEW}\\gill_vob\\config_view.cfg"
  cp  ${winpath}"\\config_view.cfg"  "x:\\${VIEW}\\autosar_bsw_vob\\config_view.cfg"
  cp  ${winpath}"\\config_view.cfg"  "x:\\${VIEW}\\gill_dcm7_code\\config_view.cfg"
  cp  ${winpath}"\\config_view.cfg"  "x:\\${VIEW}\\blois_code_p_l\\config_view.cfg"
  cp  ${winpath}"\\config_view.cfg"  "x:\\${VIEW}\\blois_soft_vob\\config_view.cfg"
  cp  ${winpath}"\\config_view.cfg"  "x:\\${VIEW}\\hwi_vob\\config_view.cfg"
  cp  ${winpath}"\\config_view.cfg"  "x:\\${VIEW}\\blois_hmc_code\\config_view.cfg"
}
find_LabelBat(){
  cleartool find X:\\${VIEW}\\blois_code_p_l -ver "lbtype(${LABEL})" -print >${winpath}"\\"${LABEL}"_lb.txt"
  cleartool find X:\\${VIEW}\\blois_soft_vob -ver "lbtype(${LABEL})" -print >>${winpath}"\\"${LABEL}"_lb.txt"
  cleartool find X:\\${VIEW}\\gill_vob       -ver "lbtype(${LABEL})" -print >>${winpath}"\\"${LABEL}"_lb.txt"
  cleartool find X:\\${VIEW}\\hwi_vob        -ver "lbtype(${LABEL})" -print >>${winpath}"\\"${LABEL}"_lb.txt"
  cleartool find X:\\${VIEW}\\gill_dcm624_code  -ver "lbtype(${LABEL})" -print >>${winpath}"\\"${LABEL}"_lb.txt"
  cleartool find X:\\${VIEW}\\blois_hmc_code -ver "lbtype(${LABEL})" -print >>${winpath}"\\"${LABEL}"_lb.txt"
  cleartool find X:\\${VIEW}\\gill_dcm7_code  -ver "lbtype(${LABEL})" -print >>${winpath}"\\"${LABEL}"_lb.txt"
  cleartool find X:\\${VIEW}\\autosar_bsw_vob  -ver "lbtype(${LABEL})" -print >>${winpath}"\\"${LABEL}"_lb.txt"

  cleartool find X:\\${VIEW}\\blois_code_p_l    -all -nvisible -ver "lbtype(${LABEL})" -print >>${winpath}"\\"${LABEL}"_lb.txt"
  cleartool find X:\\${VIEW}\\blois_soft_vob    -all -nvisible -ver "lbtype(${LABEL})" -print >>${winpath}"\\"${LABEL}"_lb.txt"
  cleartool find X:\\${VIEW}\\gill_vob          -all -nvisible -ver "lbtype(${LABEL})" -print >>${winpath}"\\"${LABEL}"_lb.txt"
  cleartool find X:\\${VIEW}\\hwi_vob           -all -nvisible -ver "lbtype(${LABEL})" -print >>${winpath}"\\"${LABEL}"_lb.txt"
  cleartool find X:\\${VIEW}\\gill_dcm624_code  -all -nvisible -ver "lbtype(${LABEL})" -print >>${winpath}"\\"${LABEL}"_lb.txt"
  cleartool find X:\\${VIEW}\\blois_hmc_code    -all -nvisible -ver "lbtype(${LABEL})" -print >>${winpath}"\\"${LABEL}"_lb.txt"
  cleartool find X:\\${VIEW}\\gill_dcm7_code  -all -nvisible -ver "lbtype(${LABEL})" -print >>${winpath}"\\"${LABEL}"_lb.txt"
  cleartool find X:\\${VIEW}\\autosar_bsw_vob  -all -nvisible -ver "lbtype(${LABEL})" -print >>${winpath}"\\"${LABEL}"_lb.txt"

# actually below is find  branch type
  cleartool find X:\\${VIEW}\\blois_code_p_l -ver "version(.../${LABEL}/LATEST)" -print >>${winpath}"\\"${LABEL}"_lb.txt"
  cleartool find X:\\${VIEW}\\blois_soft_vob -ver "version(.../${LABEL}/LATEST)" -print >>${winpath}"\\"${LABEL}"_lb.txt"
  cleartool find X:\\${VIEW}\\gill_vob       -ver "version(.../${LABEL}/LATEST)" -print >>${winpath}"\\"${LABEL}"_lb.txt"
  cleartool find X:\\${VIEW}\\hwi_vob        -ver "version(.../${LABEL}/LATEST)" -print >>${winpath}"\\"${LABEL}"_lb.txt"
  cleartool find X:\\${VIEW}\\gill_dcm624_code  -ver "version(.../${LABEL}/LATEST)" -print >>${winpath}"\\"${LABEL}"_lb.txt"
  cleartool find X:\\${VIEW}\\blois_hmc_code -ver "version(.../${LABEL}/LATEST)" -print >>${winpath}"\\"${LABEL}"_lb.txt"
  cleartool find X:\\${VIEW}\\gill_dcm7_code  -ver "version(.../${LABEL}/LATEST)" -print >>${winpath}"\\"${LABEL}"_lb.txt"
  cleartool find X:\\${VIEW}\\autosar_bsw_vob  -ver "version(.../${LABEL}/LATEST)" -print >>${winpath}"\\"${LABEL}"_lb.txt"

  cleartool find X:\\${VIEW}\\blois_code_p_l    -all -nvisible -ver "version(.../${LABEL}/LATEST)" -print >>${winpath}"\\"${LABEL}"_lb.txt"
  cleartool find X:\\${VIEW}\\blois_soft_vob    -all -nvisible -ver "version(.../${LABEL}/LATEST)" -print >>${winpath}"\\"${LABEL}"_lb.txt"
  cleartool find X:\\${VIEW}\\gill_vob          -all -nvisible -ver "version(.../${LABEL}/LATEST)" -print >>${winpath}"\\"${LABEL}"_lb.txt"
  cleartool find X:\\${VIEW}\\hwi_vob           -all -nvisible -ver "version(.../${LABEL}/LATEST)" -print >>${winpath}"\\"${LABEL}"_lb.txt"
  cleartool find X:\\${VIEW}\\gill_dcm624_code  -all -nvisible -ver "version(.../${LABEL}/LATEST)" -print >>${winpath}"\\"${LABEL}"_lb.txt"
  cleartool find X:\\${VIEW}\\blois_hmc_code    -all -nvisible -ver "version(.../${LABEL}/LATEST)" -print >>${winpath}"\\"${LABEL}"_lb.txt"
  cleartool find X:\\${VIEW}\\gill_dcm7_code  -all -nvisible -ver "version(.../${LABEL}/LATEST)" -print >>${winpath}"\\"${LABEL}"_lb.txt"
  cleartool find X:\\${VIEW}\\autosar_bsw_vob  -all -nvisible -ver "version(.../${LABEL}/LATEST)" -print >>${winpath}"\\"${LABEL}"_lb.txt"
}
#declare -i index=0
#for i in $*
#do
#  index=`expr $index + 1`
#  echo $index
#  echo $i
#done
lsview_cc(){
  cleartool lsview | grep $1 | awk '{if($1=="*") {print $2 "  --->  OPEN";}else{print $1}}' 
  cleartool lsview | grep $1
}
startview_cc(){
  #cleartool lsview | grep $1 | awk '{if($1=="*") {print $2;}else{print "startview  " $1;View=$2;}}' 
  eval $(cleartool lsview | grep $1 | awk '{if($1=="*") {print "view="$2;print "open="$1;}else{print "view="$1;}}')
  if [ "${open}" != "*" ]; then
    echo "starting view: "${view}
    cleartool startview ${view} 
  else
    echo ${view}" has started"
  fi
  cleartool lsview | grep $1 
}

# a: means -a need a parameter
while getopts "c:l:v:f:s:hpd" arg
do
        case $arg in
             c)
                echo "Cmd is $OPTARG"
                CMD=$OPTARG
                ;;
             l)
                echo "Label is $OPTARG"
                LABEL=$OPTARG
                ;;
             v)
                cleartool lsview | grep $OPTARG | awk '{if($1=="*") {print $2;}else{print $1}}'>tmp.txt 
                VIEW=$OPTARG
                echo "VIEW  is $OPTARG"
                rm tmp.txt
                ;;
             f)
                echo "File  is $OPTARG"
                FILE=$OPTARG
                ;;
             p)
                echo "property  is true"
                PROPERTY=true
                ;;
             d)
                echo "cleartool describe"
                DESCRIBE=true
                ;;
             s)
                echo "find string"
                STRING=$OPTARG
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
if [ "$VIEW" ]; then
  gvfolder_path=`find $xdriver -maxdepth 1 -name "*$VIEW*" `
  gvfolder_path=`echo ${gvfolder_path} | awk '{print $1}' | sed 's/@//g'`
  echo $gvfolder_path
  if [ ${gvfolder_path} ]; then
    build_path=$gvfolder_path"/gill_vob/6_coding"
    echo "BUILD PATH:"$build_path
#    gvpath_win=${gvfolder_path//\//\\}
    echo ${gvpath_win}
    buildpath_win=${build_path//\//\\}
    echo "BUILD PATH WIN: "${buildpath_win}
    filelist=${build_path}"/FileList.txt"
    filelist_win=${filelist//\//\\}
  else
    echo "no view name found"
  fi
fi

echo "FILE LIST: "${filelist}
pyfile=${build_path}"/config_sg7557.py"
echo ${pyfile}
pyfile_win=${pyfile_path//\//\\}
if [ "${VIEW}" ]&&[ ${filelist} ]&&[ -f ${filelist} ]; then
  echo "file list exist"
elif [ "${VIEW}" ]; then
  echo "file list not exist, touch it"
  echo ${pyfile}
  echo ${filelist}
  if [ -f ${pyfile} ]; then
    grep -o 'SourceFile\((.*)\)' ${pyfile}| cut -d\' -f 2 > ${filelist}
    grep -o 'HeaderFile\((.*)\)' ${pyfile}| cut -d\' -f 2 >> ${filelist}
    grep -o 'T55File\((.*\.t55.*)\)' ${pyfile}| cut -d\' -f 2 >> ${filelist}
    grep -o 'ProjectFile\('.*'\)' ${pyfile}| cut -d\' -f 2 >> ${filelist}
    echo "sed -i "s/^/${build_path}\//g" ${filelist}"
    sed -i "s/^/${build_path//\//\\\/}\//g" ${filelist}
    echo "created FileList.txt"
  else
    echo -e "\033[31m NO py file! \033[0m"
  fi
fi

tmpfile=${build_path}"/tmp.txt"
tmpfile_win=${tmpfile_path//\//\\}
echo ${tmpfile_win}
echo "-------------------------------------CMD OUTPUT------------------------------"

if [ -n "$CMD" ]; then
  case $CMD in
          lsvtree)
                  grep ${FILE} ${filelist} | while read line
                  do
                    file=${line}
                    echo "FILE: ${file}"
                    if [ -f "${file}" ]&&[ ${LABEL} ]; then
                      cleartool lsvtree ${file} | grep ${LABEL}   
                    else
                      echo "FILE: not exist or input label"
                    fi
                  done
#                  cleartool lsvtree   
                  ;;
          fpy)
                  if [ -f "${pyfile}" ]&&[ "${VIEW}" ]; then
                    echo "CMD:  grep ${FILE} ${pyfile}"
                    grep -i ${FILE} ${pyfile}
                  else
                    echo "py file missing or input view"
                  fi
                  ;; 
          ffl)
                  if [ -f "${filelist}" ]&&[ "${VIEW}" ]; then
                    echo "CMD:  grep ${FILE} ${filelist}"
                    grep -i ${FILE} ${filelist} | tee tmp.txt
                    if [ ${PROPERTY} ]; then
                      while IFS= read -r line
                      do
                        cleartool describe ${line}
                      done < tmp.txt
                    fi
                    rm tmp.txt
                  else
                    echo "filelist file missing or input view"
                  fi
                  ;; 
          lview)
                  if [ "${VIEW}" ]; then
                    lsview_cc $VIEW
                  else
                    echo "input view"
                  fi
                  ;; 
          find_filename)
                  if [ -f "${filelist}" ]&&[ "${VIEW}" ]; then
                    echo "CMD:  grep ${FILE} ${filelist}"
                    grep ${FILE} ${filelist} | tee -a gvfile.txt
                  else
                    echo "filelist file missing or input view"
                  fi
                  ;; 
          find_filelabel)
            # -v view    -f the target file list, mklabel on these files  -label: find corresponding file version by label
                  if [ -f "${filelist}" ]&&[ "${VIEW}" ]; then
                    while read -r line
                    do
                      if [ -f ${line} ];then
                        echo ${line} 
                        #cleartool mklabel -r ${label}  ${line}
                        cleartool lsvtree ${line} | grep -e "[ (]${LABEL}"| awk '{print $1}'|tee -a find_filelabel.txt 
                      else
                        echo "------------------------------"                        | tee -a find_filelabel.txt
                        echo "# CMD NO no this file: ${line##*/}                   " | tee -a find_filelabel.txt
                        echo "cleartool checkout -nc ${line%/*}"                     | tee -a find_filelabel.txt
                        echo "touch ${line}"                                         | tee -a find_filelabel.txt
                        echo "cleartool mkelem -nc ${line}"                              | tee -a find_filelabel.txt
                        echo "cd /d  ${line%/*}"                                     | tee -a find_filelabel.txt
                        echo "cleartool ln  src@@\\main\\${line##*/}  src\\${line##*/}"   | tee -a find_filelabel.txt
                        echo "cleartool lsvtree  ${line} | grep -e \"[ (]${LABEL}\" "   | tee -a find_filelabel.txt
                        echo "------------------------------"                        | tee -a find_filelabel.txt
                        #cleartool checkout -nc ${line%/*}
                      fi
                    done < ${FILE}
                  else
                    echo "filelist file missing or input view"
                  fi
                  ;;
          find_spec_name)
                  if [ -f "${filelist}" ]&&[ "${VIEW}" ]; then
                    while read -r line
                    do
                      if [ -f ${line} ];then
                        echo ${line} 
                        #cleartool mklabel -r ${label}  ${line}
                        cleartool describe ${line} | grep -f "./tmp/speclist.txt" 
                      else
                        echo "-----------------------------"
                        #cleartool checkout -nc ${line%/*}
                      fi
                    done < ${FILE}
                  fi
                  ;; 
          find_str)
                  if [ -f "${filelist}" ]&&[ "${VIEW}" ]&&[ "${STRING}" ]; then
                    cat ${filelist} | xargs grep --color ${STRING}
                  else
                    echo "Parameter Error!"
                  fi
                  ;; 
          createview)
                  if [ "${VIEW}" ]; then
                    if [ ! -d ${toolfolder}${VIEW} ]; then
                      viewnumber=`echo ${VIEW} | sed 's/.*\(gv[0-9]*\).*/\1/g'` 
                      branch=${branchPre}${viewnumber}
                      labelnumber=`echo ${viewnumber} | sed 's/gv/GV/g'`
                      label=${labelPre}${labelnumber}
                      echo "Label : ${label}"
                      echo "Branch : ${branch}"
                      mkdir "${toolfolder}${VIEW}"
                      echo ${toolfolder}${VIEW}
                      winpath=$(echo ${toolfolder}${VIEW} | sed 's:/:\\:g')
                      explorer ${winpath}
                      touch ${toolfolder}${VIEW}"/"${VIEW}"_checkin.txt" 
                      echo "label=${label} ; branche=${branch}" >${winpath}"\\config_view.cfg"
                      base=$(echo ${VIEW} | sed 's/\(.*\)_gv.*/\1/g')
                      BASE=${base^^}
                      echo "BASE:  "${BASE}
                      mk_label_branch ${VIEW}
                      baseConfig=$(cleartool lsview | grep -oP "\\\\.*${BASE}.vws")
                      cp  ${baseConfig}"\\config_spec"  ${cc_view}${VIEW}".vws\\config_spec"
                      cleardescribe ${VIEW}
                      echo -e "\033[31m  Refresh this view in CC  \033[0m"
                      read  nouse
                      echo -e "\033[31m  Copy config_view.cfg File! \033[0m"
                      copy_config_view
                    else
                      echo "View Folder already exists!"
                    fi
                  else
                    echo "Parameter Error!"
                  fi
                  ;; 
          stview)
                  if [ "${VIEW}" ]; then
                    startview_cc $VIEW
                  else
                    echo "input view"
                  fi
                  ;; 
          find_label)
                  VIEW=$(cleartool lsview | grep ${VIEW} | awk '{if($1=="*") {print $2;}else{print $1}}')
                  if [ -z "${LABEL}" ]; then
                    # if empty
                    viewnumber=`echo ${VIEW} | sed 's/.*\(gv[0-9]*\).*/\1/g'`
                    labelnumber=`echo ${viewnumber} | sed 's/gv/GV/g'`
                    LABEL=${labelPre}${labelnumber}
                  fi
                  echo -e "\033[32m Find Label: ${LABEL}  \033[0m"

                  if [ "${VIEW}" ]&&[ "${LABEL}" ]; then
                    startview_cc $VIEW
                    if [ ! -d ${toolfolder}${VIEW} ]; then
                      mkdir "${toolfolder}${VIEW}"
                      winpath=$(echo ${toolfolder}${VIEW} | sed 's:/:\\:g')
                    else
                      winpath=$(echo ${toolfolder}${VIEW} | sed 's:/:\\:g')
                    fi
                    explorer.exe ${winpath}
                    find_LabelBat
                  else
                    echo -e "\033[31m Please Input View and Label! \033[0m"
                  fi
                  ;; 
          *)
                  echo "No this Command"
                  ;;
  esac
else 
  echo "no command found, please type -h for help"
fi