#! /usr/local/bin/tcsh -f
#cd $TMPBATCH

 set augerdb = "/afs/in2p3.fr/group/pauger/tools/augerdb_env.csh"
 set shower_list = "/afs/in2p3.fr/group/pauger/users9/ipno/CDASdev/trunk/Work/head/data/diane/shower_list/QSGJET2_proton_E19_th18.txt"
 set corsika_file = "/afs/in2p3.fr/group/pauger/users9/ipno/CDASdev/trunk/Work/head/data/diane/shower_list/"
 set corstoroot = "/afs/in2p3.fr/group/pauger/users9/ipno/AUGERSIM/Convert/v0r2/amd64_sl5/CorsToRoot.exe"
 set default_file = "/afs/in2p3.fr/group/pauger/users9/ipno/AUGERSIM/AugerSim/v0r0/data/default.inp"
 set augersim = "/afs/in2p3.fr/group/pauger/users9/ipno/AUGERSIM/AugerSim/v0r0/amd64_sl5/AugerSim.exe"
 set workdir2 = "/afs/in2p3.fr/group/pauger/users31/isabelle/Diane/data"


# Proton shower, Hadronic model: QSGJET2, Energy: 10E19, Theta: 18°
set LISTFILE = ('dat000241' 'dat000242' 'dat000243' 'dat000244' 'dat000245' 'dat000246' 'dat000247' 'dat000248' 'dat000249' 'dat000250' 'dat000251' 'dat000253' 'dat000254' 'dat000255' 'dat000256' 'dat000257' 'dat000258' 'dat000259' 'dat000260' 'dat000261' 'dat000262' 'dat000263' 'dat000264' 'dat000265' 'dat000266' 'dat000267' 'dat000268' 'dat000269' 'dat000270' 'dat000871' 'dat000872' 'dat000873' 'dat000874' 'dat000875' 'dat000876' 'dat000877' 'dat000878' 'dat000879' 'dat000880' 'dat000881' 'dat000882' 'dat000883' 'dat000884' 'dat000885' 'dat000886' 'dat000887' 'dat000888' 'dat000889' 'dat000890' 'dat000891' 'dat000892' 'dat000893' 'dat000894' 'dat000895' 'dat000896' 'dat000897' 'dat000898' 'dat000899' 'dat000900' 'dat001501' 'dat001502' 'dat001503' 'dat001504' 'dat001505' 'dat001506' 'dat001507' 'dat001508' 'dat001509' 'dat001510' 'dat001511' 'dat001512' 'dat001513' 'dat001514' 'dat001515' 'dat001516' 'dat001517' 'dat001518' 'dat001519' 'dat001520' 'dat001521' 'dat001522' 'dat001523' 'dat001524' 'dat001525' 'dat001526' 'dat001527' 'dat001528' 'dat001529' 'dat001530' 'dat002131' 'dat002132' 'dat002133' 'dat002134' 'dat002135' 'dat002136' 'dat002137' 'dat002138' 'dat002139' 'dat002140' 'dat002141' 'dat002142')


unalias ls

rm -f submit
touch submit
foreach en (19)
    foreach it (`seq 1 1 100`)
        foreach it2(`seq 1 1 6`)
            #echo $LISTFILE[$it].part
            set file = QSGJET_E${en}_th18_${it}_${it2}
            echo qsub -P P_pauger -l sps=1 -l ct=40000 ${file}.sh >> submit
        end
    end
end
chmod +x submit


rm -f killfile
touch killfile
foreach en (19)
    foreach it (`seq 1 1 100`)
        foreach it2(`seq 1 1 6`)
            echo qdel QSGJET_E${en}_th18_${it}_${it2}  >> killfile
        end
    end
end
chmod +x killfile
echo "Well done, we killed the file !"
   


foreach en (19)
   foreach it (`seq 1 1 100`)
	    foreach it2(`seq 1 1 6`)
            @ itgerbe = ${it} + 91
            set file = QSGJET_E${en}_th18_${it}_${it2}
            rm -f ${file}.sh
            touch ${file}.sh

            echo "source ${augerdb}" >> ${file}.sh
            echo "${itgerbe} ${it}"
            echo "SdbGetShower ${shower_list} ${itgerbe} ${itgerbe}" >> ${file}.sh
            #echo  mv $LISTFILE[$it].part ${workdir2}/. >> ${file}.sh
            echo  mv $LISTFILE[${it}].part QSGJET_E${en}_th18_${it}_${it2}.part >> ${file}.sh
            echo "${corstoroot} QSGJET_E${en}_th18_${it}_${it2}.part QSGJET_E${en}_th18_${it}_${it2}.root" >> ${file}.sh
            #echo  mv QSGJET_E${en}_th18_${it}_${it2}.root ${workdir2}/. >> ${file}.sh
            echo cp ${default_file} ./ >> ${file}.sh
            echo "${augersim} QSGJET_E${en}_th18_${it}_${it2}.root" >> ${file}.sh
            echo  mv Sim_QSGJET_E${en}_th18_${it}_${it2}.root ${workdir2}/Sim_QSGJET_E${en}_th18_${it}_${it2}.root >> ${file}.sh

        chmod +x ${file}.sh
        end
    end
end
