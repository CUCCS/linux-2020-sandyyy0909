#!/usr/bin/env bash
SPATH="/home/ali"

# 图片压缩
function compress(){

 qualitity=85 #图片质量
 filelist=`ls $SPATH`
 
 for file in $filelist; do
             
                ex="${file##*.}"

                if [[ $ex = 'jpg' ]] ;then
                        New_Photo=$SPATH/comp_$file
			convert -quality $qualitity $SPATH/$file $New_Photo

		fi
	done

}



#按比例压缩
function resize(){
 echo "输入你要的size："
	
 read width

 filelist=`ls $SPATH`

 for file in $filelist; do

                ex="${file##*.}"
 
                if [[ $ex == 'jpg' ]] || [[ $ex == 'png' ]] || [[ $ex == 'svg' ]] ;then
		
                  New_Photo=$SPATH/resi_$file

		  convert -resize $width $SPATH/$file $New_Photo	
                    
                fi
        done


}




#图片添加水印
function word(){

       echo "输入水印的文字："
       
       read word #指定文字

	
	filelist=`ls $SPATH`

 for file in $filelist; do

                ex="${file##*.}"

                if [[ $ex == 'jpg' ]] || [[ $ex == 'png' ]] || [[ $ex == 'svg' ]];then
                        New_Photo=$SPATH/word_$file
                
                        convert -fill green -pointsize 40 -draw "text 10,50 '$word'" $SPATH/$file $New_Photo

                fi
        done





}


# 批量重命名
function rename(){

  filelist=`ls $SPATH`

 for file in $filelist; do

                ex="${file##*.}"

                if [[ $ex == 'jpg' ]] || [[ $ex == 'png' ]] || [[ $ex == 'svg' ]];then
                        New_Photo=$SPATH/ren_$file

                        mv $file "pic"$file

                fi
        done


}


function trans(){

 filelist=`ls $SPATH`

 for file in $filelist; do

                ex="${file##*.}"

                if [[ $ex == 'png' ]] || [[ $ex == 'svg' ]];then
           
                fn="${file%%.*}"

		convert $file "trans_$fn".jpg 


                fi
        done

}

function help(){
	echo "选择帮助信息 "
	echo "-h: 获得帮助信息"
	echo "-c: 对jpeg格式图片进行图片质量压缩"
	echo "-r: 输入需要的图片宽度等比例压缩图片"
	echo "-w: 输入你要加的文本对图片加上水印"
	echo "-b: 对文件加上前缀"
        echo "-t: 改变图片格式"
}




if [[ $# -lt 1 ]];then 
	echo "enter somthing"

else
	while [[ $# -ne 0 ]];do               
		case $1 in                
		       	"-h")                       
			        help #显示帮助信息	
				shift
			       	;;			
		       	"-c")
				compress
			        echo "sucess"
				shift
				;;
			"-r")
                                resize 
				echo "sucess"
				shift 
                                ;;
			"-w")   
				word
				echo "sucess"
				shift 
				;;
			"-b")
				rename 
				echo "sucess"
				shift
				;;  

		       "-t")
		               trans
		               echo "sucess"	       
	       	               shift
			       ;;
		  esac


	done
fi







