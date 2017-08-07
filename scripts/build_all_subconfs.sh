basedir=~/emnlp17/emnlp17-handbook

for subconf_data in $basedir/data/* ; 
do
  subconf=`basename $subconf_data`
  if [ $subconf != papers ] 
  then 
    echo $subconf
    mkdir $basedir/auto/$subconf 2> /dev/null
    cat $subconf_data/proceedings/order | $basedir/scripts/order2schedule_workshop.pl $subconf > $basedir/auto/$subconf/schedule.tex
  fi
done
