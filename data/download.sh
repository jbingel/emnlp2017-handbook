#!/bin/bash
#
# Command line arguments are book directory names used on START
# To be run from within the book directory
# papers srw tutorials demos BEA8 SSST-7 Meta4NLP2013 MWE2013 LASM2013 EVENTS WVL13 CLfL NLP4ITA2013 WASSA2013
#

[[ ! -d tar ]] && mkdir tar

while test $# -gt 0; do
   # basename shouldn't be necssary, but just in case since we're doing some RMing
   conf=$(basename $1)
   echo $conf
   tarball=tar/$conf.tgz
#   if [[ -s "$tarball" ]]; then
#     echo "Cowardly skipping $conf which already exists ($tarball)"
#     shift
#     continue
#   fi
   wget -O $tarball --no-check-certificate https://www.softconf.com/naacl2015/$conf/manager/aclpub/proceedings.tgz
   if [[ $? -ne 0 ]]; then
     echo "Couldn't download $conf's tarball ($tarball), WTF?!"
     shift
     continue
   fi
   rm -rf $conf
   tar -xzf $tarball proceedings/{order,meta,final/*/*.txt}
   mv -f proceedings $conf
   shift
done
