#Application="1JYUCAPP_B440P21"
#gv[0]="1JYUCAPP_B440P21"
Application="1JYUCAPP_B440P21"

#classification="New Component"
#gv[1]="New Component"
classification="New Component"

#Description="[CODE] Yuc update test"
#gv[2]="[CODE] Yuc update test"
Description="[CODE] Yuc update test"

#Headline="[CODE] YUC software update for supporting"
#gv[3]="[CODE] YUC software update for supporting"
Headline="[CODE] YUC software update for supporting"

#Project="YUC 4S DCM7.24"
#DFAC M9T
#gv[4]="YUC 4S DCM7.24"
Project="YUC 4S DCM7.24"

#Severity="3-Average"
#gv[5]="3-Average"
Severity="3-Average"

#Stage_Found="Requirements Analysis"
#gv[6]="Requirements Analysis"
Stage_Found="Requirements Analysis"

#activity="Software"
#SW Int Test Exec
#gv[7]="Software"
activity="Software"

#parent="GV00291152"
#gv[8]="GV00291152"
parent="GV00291152"


#gv[0]=$(echo ${gv[0]} | sed 's/ /%20/g')
#gv[1]=$(echo ${gv[1]} | sed 's/ /%20/g')
#gv[2]=$(echo ${gv[2]} | sed 's/ /%20/g')
gv[0]=${Application}
gv[1]=${classification}
gv[2]=${Description}
gv[3]=${Headline}
gv[4]=${Project}
gv[5]=${Severity}
gv[6]=${Stage_Found}
gv[7]=${activity}
gv[8]=${parent}
for((i=0; i<9; i++))
do
	#Change space to %20, or as a string it will separate by space
	gv[i]=$(echo ${gv[i]} | sed 's/ /%20/g')
	echo "${gv[i]}"
done

cq.sh -c create_gv "${gv[*]}"

