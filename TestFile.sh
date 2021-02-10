#!/bin/sh

count_lines(){
	wc -l < ./sample_txt.txt
}

count_words(){
	grep -n "Lorem" ./sample_txt.txt | grep -n "model" ./sample_txt.txt | grep -n "Ipsum" ./sample_txt.txt | grep -n "will" ./sample_txt.txt
	
	
}

add_text(){
	echo "Enter new text to append" 
	read newtext
	echo $newtext>>./sample_txt.txt
}

copy_and_exit(){
	cp sample_txt.txt solution.txt
}

exitPrompt(){
    read -p "Do you wish to continue? [y]es or [n]o: " ans
    if [ $ans == 'n' ]
    then
        echo "Exiting"
        break
    else
        continue
    fi
}

if ls ./sample_txt.txt > /dev/null
then
	while(true)
		do
		clear
		printf "===Menu===\n"
		printf "[a]Count Lines\n[b]Count Words\n[c]Add text\n[d]Copy and Exit\n"
		read -p "Your choice: " choice

		case $choice in
		[aA])
			count_lines
		;;
		
		[bB])
			count_words
		;;

		[cC])
			add_text
		;;

		[dD])
			copy_and_exit
		;;
			
		*)
		
			echo "wrong choice"

		esac
		exitPrompt
	done	
		
else 
	echo "Error: File Does Not Exist. Press 0 to exit"
	read number
fi


