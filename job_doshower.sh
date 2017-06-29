#! /usr/local/bin/tcsh -f
#cd $TMPBATCH

 set corstoroot = "/afs/in2p3.fr/group/pauger/users9/ipno/AUGERSIM/Convert/v0r2/amd64_sl5/CorsToRoot.exe"
 set default_file = "/afs/in2p3.fr/group/pauger/users9/ipno/AUGERSIM/AugerSim/v0r0/data/default.inp"
 set workdir2 = "/afs/in2p3.fr/group/pauger/users31/isabelle/Diane/data"
 set script = "/afs/in2p3.fr/group/pauger/users31/isabelle/Diane/v7.4000/run"


set en = ('1E10')
#set theta = ('45')
foreach it (`seq 0 0.25 25`)

unalias ls

rm -f dosubmit
touch dosubmit
foreach it (`seq 1 1 1`)
    set file = EPOS_${en}_th0-25_${it}
    echo qsub -P P_pauger -l sps=1 -l ct=5000 ${file}.sh >> dosubmit
end

chmod +x dosubmit

rm -f killfile
touch killfile

foreach it (`seq 1 1 1`)
    echo qdel EPOS_${en}_th0-25_${it} >> killfile
end

chmod +x killfile
echo "Well done, we killed the file !"
   

foreach it (`seq 1 1 1`)
    set file = EPOS_${en}_th0-25_${it}
    rm -f ${file}.sh
    touch ${file}.sh
    echo  ${script}/script_corsika.pl ${en} $theta[${it}] ${it} ${it} >> ${file}.sh
    echo $theta[${it}]
    #echo  ./script_corsika.pl ${en} ${theta} ${it} ${it} >> ${file}.sh
    chmod +x ${file}.sh
end

