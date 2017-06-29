#! /usr/local/bin/tcsh -f
#cd $TMPBATCH

 set augerdb = "/afs/in2p3.fr/group/pauger/tools/augerdb_env.csh"
 set shower_list = "/afs/in2p3.fr/group/pauger/users9/ipno/CDASdev/trunk/Work/head/data/diane/shower_list/fer_3E19_th25.txt" 
 set corsika_file = "/afs/in2p3.fr/group/pauger/users9/ipno/CDASdev/trunk/Work/head/data/diane/shower_list/"
 set corstoroot = "/afs/in2p3.fr/group/pauger/users9/ipno/AUGERSIM/Convert/v0r2/amd64_sl5/CorsToRoot.exe"
 set default_file = "/afs/in2p3.fr/group/pauger/users9/ipno/AUGERSIM/AugerSim/v0r0/data/default.inp"
 set augersim = "/afs/in2p3.fr/group/pauger/users9/ipno/AUGERSIM/AugerSim/v6r0/amd64_sl5/AugerSim.exe"
 set workdir2 = "/afs/in2p3.fr/group/pauger/users31/isabelle/Diane/data"



# Iron shower with Energy= 3E19 & theta = 26°
set LISTFILE = ('DAT449239' 'dat000481' 'dat000482' 'dat000483' 'dat000484' 'dat000485' 'dat000486' 'dat000487' 'dat000488' 'dat000489' 'dat000490' 'dat000491' 'dat000492' 'dat000493' 'dat000494' 'dat000495' 'dat000496' 'dat000497' 'dat000498' 'dat000499' 'dat000500' 'dat000501' 'dat000502' 'dat000503' 'dat000504' 'dat000505' 'dat000506' 'dat000507' 'dat000508' 'dat000509' 'dat000510' 'dat001111' 'dat001112' 'dat001113' 'dat001114' 'dat001115' 'dat001116' 'dat001117' 'dat001118' 'dat001119' 'dat001120' 'dat001121' 'dat001122' 'dat001123' 'dat001124' 'dat001125' 'dat001126' 'dat001127' 'dat001128' 'dat001129' 'dat001130' 'dat001131' 'dat001132' 'dat001133' 'dat001134' 'dat001135' 'dat001136' 'dat001137' 'dat001138' 'dat001139' 'dat001140' 'dat001741' 'dat001742' 'dat001743' 'dat001744' 'dat001745' 'dat001746' 'dat001747' 'dat001748' 'dat001749' 'dat001750' 'dat001751' 'dat001752' 'dat001753' 'dat001754' 'dat001755' 'dat001756' 'dat001757' 'dat001758' 'dat001759' 'dat001760' 'dat001761' 'dat001762' 'dat001763' 'dat001764' 'dat001765' 'dat001766' 'dat001767' 'dat001768' 'dat001769' 'dat001770' 'dat002371' 'dat002372' 'dat002373' 'dat002374' 'dat002375' 'dat002376' 'dat002377' 'dat002378' 'dat002379')


unalias ls

rm -f submit
touch submit
foreach en (19)
    foreach it (`seq 1 1 100`)
        foreach it2(`seq 1 1 2`)
            #echo $LISTFILE[$it].part
            set file = fer_3E${en}_th25_${it}_${it2}
            echo qsub -P P_pauger -l sps=1 -l ct=20000 ${file}.sh >> submit
        end
    end
end
chmod +x submit

rm -f killfile
touch killfile
foreach en (19)
    foreach it (`seq 1 1 100`)
        foreach it2(`seq 1 1 2`)
            echo qdel fer_3E${en}_th25_${it}_${it2}  >> killfile
        end
    end
end
chmod +x killfile
echo "Well done, we killed the file !"
   


foreach en (19)
    foreach it (`seq 1 1 100`)
        foreach it2(`seq 1 1 2`)
            @ itgerbe = ${it} + 0 #394 145
            set file = fer_3E${en}_th25_${it}_${it2}
            rm -f ${file}.sh
            touch ${file}.sh

            echo "source ${augerdb}" >> ${file}.sh
            echo "${itgerbe} ${it}"
            echo "SdbGetShower ${shower_list} ${itgerbe} ${itgerbe}" >> ${file}.sh
            #echo  mv $LISTFILE[$it].part ${workdir2}/. >> ${file}.sh
            echo  mv $LISTFILE[${it}].part fer_3E${en}_th25_${it}_${it2}.part >> ${file}.sh
            echo "${corstoroot} fer_3E${en}_th25_${it}_${it2}.part fer_3E${en}_th25_${it}_${it2}.root" >> ${file}.sh
            #echo  mv fer_3E${en}_th25_${it}_${it2}.root ${workdir2}/. >> ${file}.sh
            echo cp ${default_file} ./ >> ${file}.sh
            echo "${augersim} fer_3E${en}_th25_${it}_${it2}.root" >> ${file}.sh
            echo  mv Sim_fer_3E${en}_th25_${it}_${it2}.root ${workdir2}/Sim_fer_3E${en}_th25_${it}_${it2}.root >> ${file}.sh

        chmod +x ${file}.sh
        end
    end
end
