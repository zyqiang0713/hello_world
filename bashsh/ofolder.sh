#!/bin/bash
toolfolder="c:/d/Project/tool_proj/"
xdriver="x:/"
display_help() {
    echo "Usage: $0 [option...] { }" >&2
    echo
    echo " attach00          open  00xmind delphi attachment                 "
    echo " 6 number          open  gv local folder                           "
    echo " dtool             open  delphi tool                               "
    echo " compile           source open  local clearcase command            "
    echo " -x name           open  clearcase x:\driver                       "
    echo " -chex name        copy hex a2l and so on file to  local directory "
    echo " lgh               local gv home                                   "
    echo " debug             debug directory                                 "
    echo
    # echo some stuff here for the -a or --add-options 
    exit 1
}

case $1 in
        -h | --help)
                display_help
                ;;
        dtool)
                python3 "C:\\D\\Tools\\hello\\delphi_cleartool\\main.py"
                ;;
        attach)
                explorer "C:\\D\\00_XMind\\Delphi_DCM7\\attachments"
                ;;
        compile)
                cd  "C:\\D\\07_Training\\compile"
                ;;
        lgh)
                explorer "c:\\d\\Project\\tool_proj\\" 
                cd "c:\\d\\Project\\tool_proj\\"
                ;;
        debug)
                explorer "C:\\T32\\bin\\windows64\\" 
                cd "C:\\T32\\bin\\windows64\\"
                ;;
        -x)
                gvfolder_path=`find $xdriver -maxdepth 1 -name "*$2*"`
                echo $gvfolder_path
                path_convert=${gvfolder_path//\//\\}
                echo $path_convert
                explorer $path_convert
                cd $path_convert
                ;;
        -chex)
                gvfolder_path=`find $xdriver -maxdepth 1 -name "*$2*"`
                echo $gvfolder_path
                FolderName=${gvfolder_path##*/}
                path_convert=${gvfolder_path//\//\\}
                echo $path_convert
                #open local
                localpath=`find $toolfolder -maxdepth 1 -name "*$FolderName*"`
                echo "local path: $localpath"
                localpath_convert=${localpath//\//\\}
                echo "local path: $localpath_convert"
                explorer $localpath_convert
                # copy we need files
                cd $path_convert
                cd ./gill_vob/6_coding
                pwd
                find ./ -maxdepth 1 -name "*.hex" -exec cp -i {} $localpath_convert \;
                find ./ -maxdepth 1 -name "*.elf" -exec cp -i {} $localpath_convert \;
                find ./ -maxdepth 1 -name "*.map" -exec cp -i {} $localpath_convert \;
                find ./ -maxdepth 1 -name "*.a2l" -exec cp -i {} $localpath_convert \;
                find ./ -maxdepth 1 -name "A2Lerr.txt" -exec cp -i {} $localpath_convert \;
                ;;
        *)
                if [ -z "$1" ]; then
                        echo "please input parameter or -h for help"
                else
                        gvfolder_path=`find $toolfolder -maxdepth 1 -name "*$1*"`
                        echo $gvfolder_path
                        path_convert=${gvfolder_path//\//\\}
                        echo $path_convert\\
                        explorer $path_convert
                        cd $path_convert
                fi
                ;;
esac

#if [ -z "$1" ]; then
#        echo "please input gv number"
#        path_convert=${toolfolder//\//\\}
#        echo $path_convert
#        explorer $path_convert
#elif [ "$1" = "attach00" ]; then
#        explorer "C:\\D\\00_XMind\\Delphi_DCM7\\attachments"
#elif [ "$1" ]; then
#        gvfolder_path=`find $toolfolder -maxdepth 1 -name "*$1*"`
#        echo $gvfolder_path
#        path_convert=${gvfolder_path//\//\\}
#        echo $path_convert
#        explorer $path_convert
#else
#        echo "please input gv number"
#        path_convert=${toolfolder//\//\\}
#        echo $path_convert
#        explorer $path_convert
#fi
