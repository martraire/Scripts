#! /usr/local/bin/tcsh -f
#cd $TMPBATCH

set workdir2 = "/afs/in2p3.fr/group/pauger/users31/isabelle/Diane/data"
set script = "/afs/in2p3.fr/group/pauger/users31/isabelle/Diane/Offline/UserSkeleton_copy"
set localdir = "/afs/in2p3.fr/group/pauger/users31/isabelle/Diane/CDAS/trunk/Work/head/data"
# "/afs/in2p3.fr/group/pauger/users31/isabelle/Diane/CDAS/trunk/Work/head/data"
# "/afs/in2p3.fr/group/pauger/users31/isabelle/Diane/Offline/UserSkeleton_copy"

set en = ('1E19')

unalias ls

rm -f dosubmit
touch dosubmit
foreach it (`seq 75 1 100`)
    set file = Off_${en}_th36-45_${it}
    echo qsub -P P_pauger -l sps=1 -l ct=80000 ${file}.sh >> dosubmit
end

chmod +x dosubmit


rm -f killfile
touch killfile

foreach it (`seq 75 1 100`)
    echo qdel Off_${en}_th36-45_${it} >> killfile
end

chmod +x killfile
echo "Well done, we killed the file !"
   

foreach it (`seq 75 1 100`)
    set file = Off_${en}_th36-45_${it}
    rm -f ${file}.sh
    touch ${file}.sh
    echo "irods_env" >> ${file}.sh
    # echo "pwd" >>  ${file}.sh
    ## echo "cp ${script}/script_offline.pl . " >>  ${file}.sh
    # echo  "./script_offline.pl ${it}"  >> ${file}.sh
    echo  "${script}/script_offline.pl ${it}" >> ${file}.sh
    echo ${it} 

    chmod +x ${file}.sh
end
