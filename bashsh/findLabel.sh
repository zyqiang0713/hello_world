#!/bin/bash
# $1 view name      $2 label name  $3 local view folder 
cleartool startview $1
toolfolder="c:/d/Project/tool_proj/"

viewnumber=`echo $1 | sed 's/.*\(gv[0-9]*\).*/\1/g'` 
createrName=`echo $1 | sed 's/.*_\([a-z][0-9]\)*/\1/g'`
createrUpper=${createrName^^}
labelnumber=`echo ${viewnumber} | sed 's/gv/GV/g'`
label="TASK_"${createrUpper}"_"${labelnumber}
localViewFolder=${toolfolder}"\\"$1

echo -e "\033[31m  Label:   ${label}  \033[0m"
echo -e "\033[31m  ${localViewFolder}  \033[0m"

if [ ! -d ${localViewFolder} ]; then
  echo -e "\033[31m${localViewFolder} not exists!!  \033[0m"
  echo "create ${localViewFolder}"
  mkdir ${localViewFolder}
fi

cleartool find "X:\\$1\\blois_code_p_l" -ver "lbtype($label)" -print >"$localViewFolder"\\$label"_lb.txt"
cleartool find "X:\\$1\\blois_soft_vob" -ver "lbtype($label)" -print >>"$localViewFolder"\\$label"_lb.txt"
cleartool find "X:\\$1\\euro5_vob"      -ver "lbtype($label)" -print >>"$localViewFolder"\\$label"_lb.txt"
cleartool find "X:\\$1\\gill_vob"       -ver "lbtype($label)" -print >>"$localViewFolder"\\$label"_lb.txt"
cleartool find "X:\\$1\\hwi_vob"        -ver "lbtype($label)" -print >>"$localViewFolder"\\$label"_lb.txt"
cleartool find "X:\\$1\\gill_dcm624_code"  -ver "lbtype($label)" -print >>"$localViewFolder"\\$label"_lb.txt"
cleartool find "X:\\$1\\blois_hmc_code" -ver "lbtype($label)" -print >>"$localViewFolder"\\$label"_lb.txt"
cleartool find "X:\\$1\\gwm_secure_vob" -ver "lbtype($label)" -print >>"$localViewFolder"\\$label"_lb.txt"
cleartool find "X:\\$1\\gill_dcm7_code"  -ver "lbtype($label)" -print >>"$localViewFolder"\\$label"_lb.txt"
cleartool find "X:\\$1\\autosar_bsw_vob"  -ver "lbtype($label)" -print >>"$localViewFolder"\\$label"_lb.txt"

cleartool find  "X:\\$1\\blois_code_p_l"    -all -nvisible -ver "lbtype($label)" -print >>"$localViewFolder"\\$label"_lb.txt"
cleartool find  "X:\\$1\\blois_soft_vob"    -all -nvisible -ver "lbtype($label)" -print >>"$localViewFolder"\\$label"_lb.txt"
cleartool find  "X:\\$1\\euro5_vob"         -all -nvisible -ver "lbtype($label)" -print >>"$localViewFolder"\\$label"_lb.txt"
cleartool find  "X:\\$1\\gill_vob"          -all -nvisible -ver "lbtype($label)" -print >>"$localViewFolder"\\$label"_lb.txt"
cleartool find  "X:\\$1\\hwi_vob"           -all -nvisible -ver "lbtype($label)" -print >>"$localViewFolder"\\$label"_lb.txt"
cleartool find  "X:\\$1\\gill_dcm624_code"  -all -nvisible -ver "lbtype($label)" -print >>"$localViewFolder"\\$label"_lb.txt"
cleartool find  "X:\\$1\\blois_hmc_code"    -all -nvisible -ver "lbtype($label)" -print >>"$localViewFolder"\\$label"_lb.txt"
cleartool find  "X:\\$1\\gwm_secure_vob"    -all -nvisible -ver "lbtype($label)" -print >>"$localViewFolder"\\$label"_lb.txt"
cleartool find  "X:\\$1\\gill_dcm7_code"  -all -nvisible -ver "lbtype($label)" -print >>"$localViewFolder"\\$label"_lb.txt"
cleartool find  "X:\\$1\\autosar_bsw_vob"  -all -nvisible -ver "lbtype($label)" -print >>"$localViewFolder"\\$label"_lb.txt"

