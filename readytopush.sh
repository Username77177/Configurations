#!/bin/bash
clear
git add ./
git status
sleep 1
echo "Commit? (1 - yes, anything else - no)"
read yon
dt=$(date '+%d/%m/%Y %H:%M:%S');
if [[ $yon = "1" ]]
then
	echo "Maybe some comment? (Not necessarily)"
	read comment
	if [[ $comment = "" ]]
	then
		git commit -m "$dt"
	else
	git commit -m "$dt | $comment"
	fi

	echo "Push? (1 - Yes, 0 - No)"
    read yon
	if [[ $yon = "1" ]]
	then
		xclip -sel clip ./somecodes
		git push origin master
	fi
fi

