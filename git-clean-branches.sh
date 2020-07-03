## Usage : ./git-clean-branches.sh 2019-01-01 "develop|master|HEAD|release/*" 
## Tells whether the branch can be deleted or needs to present 
for branch in `git branch -r --merged | grep -Ev "$2" `; 
do 
	echo 'START ################################'
	#Uncomment below line to see commit details
	#echo "$(git log $branch -n 1 --after=$1)"
	#echo -e `git show --format="%aN\t %m %ae\t %cD\t %cr\t" $branch | head -n 1` \\t$branch;
	if [ -n "$(git log $branch -n 1 --after=$1)" ]; then
		echo "TO BE KEPT: $branch"	
	else
		echo "TO BE DELETED: $branch"
	fi
	echo 'ENDED ################################'
	echo ''
done

