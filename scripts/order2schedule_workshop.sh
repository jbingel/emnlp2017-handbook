#!/bin/bash
for dir in $(ls data); do
  [[ ! -d "auto/$dir" ]] && mkdir auto/$dir
  tar -zxvf data/$dir/proceedings.tgz -C data/$dir  proceedings/order  
  tar -zxvf data/$dir/proceedings.tgz -C data/$dir  proceedings/final.tgz 
  tar -zxvf data/$dir/proceedings/final.tgz -C data/$dir/proceedings 
  python2 ./scripts/meta2bibtex.py data/$dir/proceedings/final $dir
  cat data/$dir/proceedings/order | ./scripts/order2schedule_workshop.pl $dir > auto/$dir/schedule.tex
done
