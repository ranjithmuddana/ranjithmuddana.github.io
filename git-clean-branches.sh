for branch in `git branch -r --merged | grep -v test | grep -v upstream | grep -v HEAD `; 
do 
echo 'START ################################'
echo "$(git log $branch -n 1 --after=$1)"
	#echo -e `git show --format="%aN\t %m %ae\t %cD\t %cr\t" $branch | head -n 1` \\t$branch;
	if [ -n "$(git log $branch -n 1 --after=$1)" ]; then
		echo "TO BE MIGRATED: $branch"	
	else
		echo "TO BE DELETED: $branch"
	fi
echo "######################################"
                echo "#####################################"
                echo 'ENDED ################################'
done

