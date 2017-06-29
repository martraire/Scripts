#! /usr/local/bin/tcsh -f
#cd $TMPBATCH

 set aires_fold = "/hpss/in2p3.fr/group/pauger/billoir/Aires_showers"
 # set aires_fold = "$HPSS_PAUGER/billoir/Aires_shower/"
 #set corstoroot = "/afs/in2p3.fr/group/pauger/users9/ipno/AUGERSIM/Convert/v0r2/amd64_sl6/CorsToRoot.exe"
 set airestoroot = "afs/in2p3.fr/group/pauger/users9/ipno/AUGERSIM/Convert/v0r2/amd64_sl6/AiresToRoot.exe"
 set default_file = "/afs/in2p3.fr/group/pauger/users9/ipno/AUGERSIM/AugerSim/v0r0/data/default.inp"
 set augersim = "/afs/in2p3.fr/group/pauger/users9/ipno/AUGERSIM/AugerSim/v0r0/amd64_sl6/AugerSim.exe"
 set workdir2 = "/afs/in2p3.fr/group/pauger/users31/isabelle/Diane/data"

unalias ls

rm -f submit
touch submit
foreach en (19)
    foreach it (`seq 1 1 50`)
        foreach it2(`seq 2 1 15`)
            set file = SYBILL_19.5_35_${it}_${it2}
            echo qsub -P P_pauger -l hpss=1 -l ct=40000 ${file}.sh >> submit
        end
    end
end
chmod +x submit

rm -f killfile
touch killfile
foreach en (19)
    foreach it (`seq 1 1 50`)
        foreach it2(`seq 2 1 15`)
            echo qdel SYBILL_19.5_35_${it}_${it2}  >> killfile
        end
    end
end
chmod +x killfile
echo "Well done, we killed the file !"
   


foreach en (19)
   foreach it (`seq 1 1 50`)
        foreach it2(`seq 2 1 15`)
            set file = SYBILL_19.5_35_${it}_${it2}
            rm -f ${file}.sh
            touch ${file}.sh

            echo "rfcp ${aires_fold}/p_s_19.5_35_${it}.grdpcles ${workdir2}/p_s_19.5_35_${it}_${it2}.grdpcles" >>   ${file}.sh
            echo  mv ${workdir2}/p_s_19.5_35_${it}.grdpcles ${workdir2}/p_s_19.5_35_${it}_${it2}.grdpcles >> ${file}.sh
            #echo "${airestoroot} ${workdir2}/p_s_19.5_45_${it}_${it2}.grdpcles ${workdir2}/p_s_19.5_35_${it}_${it2}.root" >> ${file}.sh
            #echo "rm -f ${workdir2}/p_s_19.5_35_${it}_${it2}.grdpcles" >> ${file}.sh
            #echo cp ${default_file} ./ >> ${file}.sh
            #echo cp ${default_file} ${workdir2}/. >> ${file}.sh
            #echo "${augersim} ${workdir2}/p_s_19.5_35_${it}_${it2}.root" >> ${file}.sh
            #echo  rm -f ${workdir2}/p_s_19.5_35_${it}_${it2}.root >> ${file}.sh

        chmod +x ${file}.sh
        end
    end
end
