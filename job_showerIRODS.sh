#! /usr/local/bin/tcsh -f
#cd $TMPBATCH

 set augerdb = "/afs/in2p3.fr/group/pauger/tools/augerdb_env.csh"
 # set shower_list = "/afs/in2p3.fr/group/pauger/users9/ipno/CDASdev/trunk/Work/head/data/diane/shower_list/shower_EPOS_FER_E19_th0-25.txt"
 set corsika_file = "/afs/in2p3.fr/group/pauger/users9/ipno/CDASdev/trunk/Work/head/data/diane/shower_list/"
 set corstoroot = "/afs/in2p3.fr/group/pauger/users9/ipno/AUGERSIM/Convert/v0r2/amd64_sl6/CorsToRoot.exe"
 set default_file = "/afs/in2p3.fr/group/pauger/users9/ipno/AUGERSIM/AugerSim/v0r0/data/default.inp"
 set augersim = "/afs/in2p3.fr/group/pauger/users9/ipno/AUGERSIM/AugerSim/v0r0/amd64_sl6/AugerSim.exe"
 set workdir2 = "/afs/in2p3.fr/group/pauger/users31/isabelle/Diane/data"
                #/afs/in2p3.fr/group/pauger/users9/ipno/CDASdev/trunk/Work/head/data/diane"

# Proton Shower, Hadronic model: QSGJETII, Energy: 10E19, Theta: [25,36]°
set LISTPATH = ( "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.000/th0.65/DAT109136.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.000/th0.65/DAT109140.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/10/13/en19.000/th0.65/DAT109174.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.000/th0.65/DAT109182.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.000/th0.65/DAT109195.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.000/th0.65/DAT109215.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.000/th0.65/DAT109232.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.000/th0.65/DAT109242.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.000/th0.65/DAT109246.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/10/13/en19.000/th0.65/DAT109301.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.000/th0.65/DAT109342.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.000/th0.65/DAT109353.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.000/th0.65/DAT109367.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.000/th0.65/DAT109394.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.000/th0.65/DAT109488.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.000/th0.65/DAT109500.part",  "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.000/th0.65/DAT109517.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.000/th0.65/DAT109541.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.000/th0.65/DAT109557.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.000/th0.65/DAT109577.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.000/th0.65/DAT109647.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.000/th0.65/DAT109653.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.000/th0.65/DAT109658.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.000/th0.65/DAT109681.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.000/th0.65/DAT109723.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.000/th0.65/DAT109750.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.000/th0.65/DAT109779.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/10/13/en19.000/th0.65/DAT109792.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.000/th0.65/DAT109807.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.000/th0.65/DAT109820.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.000/th0.65/DAT109869.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.000/th0.65/DAT109872.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.000/th0.65/DAT109913.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.000/th0.65/DAT109943.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.000/th0.65/DAT109951.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.000/th0.65/DAT109960.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.000/th0.65/DAT109968.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.000/th0.65/DAT109973.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.000/th0.65/DAT109989.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.500/th0.65/DAT110012.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.500/th0.65/DAT110016.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.500/th0.65/DAT110034.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.500/th0.65/DAT110039.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.500/th0.65/DAT110040.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.500/th0.65/DAT110089.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.500/th0.65/DAT110098.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.500/th0.65/DAT110101.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.500/th0.65/DAT110107.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.500/th0.65/DAT110152.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.500/th0.65/DAT110182.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.500/th0.65/DAT110196.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.500/th0.65/DAT110198.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.500/th0.65/DAT110228.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.500/th0.65/DAT110250.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.500/th0.65/DAT110251.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.500/th0.65/DAT110291.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.500/th0.65/DAT110301.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.500/th0.65/DAT110308.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.500/th0.65/DAT110323.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.500/th0.65/DAT110327.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.500/th0.65/DAT110418.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.500/th0.65/DAT110438.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.500/th0.65/DAT110442.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.500/th0.65/DAT110447.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.500/th0.65/DAT110523.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.500/th0.65/DAT110529.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.500/th0.65/DAT110661.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.500/th0.65/DAT110686.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.500/th0.65/DAT110700.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.500/th0.65/DAT110714.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.500/th0.65/DAT110749.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.500/th0.65/DAT110759.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.500/th0.65/DAT110779.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.500/th0.65/DAT110824.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.500/th0.65/DAT110845.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.500/th0.65/DAT110875.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.500/th0.65/DAT110890.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.500/th0.65/DAT110900.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/10/13/en19.500/th0.65/DAT110955.part" "/pauger/Simulations/libraries/augermgr.ccin2p3/QGSjetII_Proton_SRB/2008/09/08/en19.500/th0.65/DAT110967.part" "/pauger/Simulations/libraries/bleve.ccin2p3/LD1_ATM01q2fl/corsika/qgsjet-ii/proton/e19.0/t26/dat000271.part" "/pauger/Simulations/libraries/bleve.ccin2p3/LD1_ATM01q2fl/corsika/qgsjet-ii/proton/e19.0/t26/dat000272.part" "/pauger/Simulations/libraries/bleve.ccin2p3/LD1_ATM01q2fl/corsika/qgsjet-ii/proton/e19.0/t26/dat000273.part" "/pauger/Simulations/libraries/bleve.ccin2p3/LD1_ATM01q2fl/corsika/qgsjet-ii/proton/e19.0/t26/dat000274.part" "/pauger/Simulations/libraries/bleve.ccin2p3/LD1_ATM01q2fl/corsika/qgsjet-ii/proton/e19.0/t26/dat000275.part" "/pauger/Simulations/libraries/bleve.ccin2p3/LD1_ATM01q2fl/corsika/qgsjet-ii/proton/e19.0/t26/dat000276.part" "/pauger/Simulations/libraries/bleve.ccin2p3/LD1_ATM01q2fl/corsika/qgsjet-ii/proton/e19.0/t26/dat000277.part" "/pauger/Simulations/libraries/bleve.ccin2p3/LD1_ATM01q2fl/corsika/qgsjet-ii/proton/e19.0/t26/dat000278.part" "/pauger/Simulations/libraries/bleve.ccin2p3/LD1_ATM01q2fl/corsika/qgsjet-ii/proton/e19.0/t26/dat000279.part" "/pauger/Simulations/libraries/bleve.ccin2p3/LD1_ATM01q2fl/corsika/qgsjet-ii/proton/e19.0/t26/dat000280.part" "/pauger/Simulations/libraries/bleve.ccin2p3/LD1_ATM01q2fl/corsika/qgsjet-ii/proton/e19.0/t26/dat000281.part" "/pauger/Simulations/libraries/bleve.ccin2p3/LD1_ATM01q2fl/corsika/qgsjet-ii/proton/e19.0/t26/dat000282.part" "/pauger/Simulations/libraries/bleve.ccin2p3/LD1_ATM01q2fl/corsika/qgsjet-ii/proton/e19.0/t26/dat000283.part" "/pauger/Simulations/libraries/bleve.ccin2p3/LD1_ATM01q2fl/corsika/qgsjet-ii/proton/e19.0/t26/dat000284.part" "/pauger/Simulations/libraries/bleve.ccin2p3/LD1_ATM01q2fl/corsika/qgsjet-ii/proton/e19.0/t26/dat000285.part" "/pauger/Simulations/libraries/bleve.ccin2p3/LD1_ATM01q2fl/corsika/qgsjet-ii/proton/e19.0/t26/dat000286.part" "/pauger/Simulations/libraries/bleve.ccin2p3/LD1_ATM01q2fl/corsika/qgsjet-ii/proton/e19.0/t26/dat000287.part" "/pauger/Simulations/libraries/bleve.ccin2p3/LD1_ATM01q2fl/corsika/qgsjet-ii/proton/e19.0/t26/dat000288.part" "/pauger/Simulations/libraries/bleve.ccin2p3/LD1_ATM01q2fl/corsika/qgsjet-ii/proton/e19.0/t26/dat000289.part" "/pauger/Simulations/libraries/bleve.ccin2p3/LD1_ATM01q2fl/corsika/qgsjet-ii/proton/e19.0/t26/dat000290.part"  )



set LISTFILE = ( "DAT109136" "DAT109140" "DAT109174" "DAT109182" "DAT109195" "DAT109215" "DAT109232" "DAT109242" "DAT109246" "DAT109301" "DAT109342" "DAT109353" "DAT109367" "DAT109394" "DAT109488" "DAT109500" "DAT109517" "DAT109541" "DAT109557" "DAT109577" "DAT109647" "DAT109653" "DAT109658" "DAT109681" "DAT109723" "DAT109750" "DAT109779" "DAT109792" "DAT109807" "DAT109820" "DAT109869" "DAT109872" "DAT109913" "DAT109943" "DAT109951" "DAT109960" "DAT109968" "DAT109973" "DAT109989" "DAT110012" "DAT110016" "DAT110034" "DAT110039" "DAT110040" "DAT110089" "DAT110098" "DAT110101" "DAT110107" "DAT110152" "DAT110182" "DAT110196" "DAT110198" "DAT110228" "DAT110250" "DAT110251" "DAT110291" "DAT110301" "DAT110308" "DAT110323" "DAT110327" "DAT110418" "DAT110438" "DAT110442" "DAT110447" "DAT110523" "DAT110529" "DAT110661" "DAT110686" "DAT110700" "DAT110714" "DAT110749" "DAT110759" "DAT110779" "DAT110824" "DAT110845" "DAT110875" "DAT110890" "DAT110900" "DAT110955" "DAT110967" "dat000271" "dat000272" "dat000273" "dat000274" "dat000275" "dat000276" "dat000277" "dat000278" "dat000279" "dat000280" "dat000281" "dat000282" "dat000283" "dat000284" "dat000285" "dat000286" "dat000287" "dat000288" "dat000289" "dat000290"  )



unalias ls

rm -f submitIRODS
touch submitIRODS
foreach en (19)
    foreach it (`seq 1 1 20`)
        foreach it2(`seq 1 1 1`)
            # echo $LISTFILE[$it].part
            set file = QSGJET_E${en}_th25-36_${it}_${it2}
            echo qsub -P P_pauger -l sps=1 -l ct=6000 ${file}.sh >> submitIRODS
        end
    end
end
chmod +x submitIRODS



rm -f killfile
touch killfile
foreach en (19)
    foreach it (`seq 1 1 20`)
        foreach it2(`seq 1 1 1`)
            echo qdel QSGJET_E${en}_th25-36_${it}_${it2}  >> killfile
        end
    end
end
chmod +x killfile
echo "Well done, we killed the file !"
   


foreach en (19)
   foreach it (`seq 1 1 20`)
	    foreach it2(`seq 1 1 1`)
            @ itgerbe = ${it}
            set file = QSGJET_E${en}_th25-36_${it}_${it2}
            rm -f ${file}.sh
            touch ${file}.sh

            # echo "source ${augerdb}" >> ${file}.sh
            echo "irods_env" >> ${file}.sh
            echo "${itgerbe} ${it}"
            echo "iget $LISTPATH[$it]" >> ${file}.sh
            #echo  mv $LISTFILE[$it].part ${workdir2}/. >> ${file}.sh
            echo  mv $LISTFILE[${it}].part QSGJET_E${en}_th25-36_${it}_${it2}.part >> ${file}.sh
            echo "${corstoroot} QSGJET_E${en}_th25-36_${it}_${it2}.part QSGJET_E${en}_th25-36_${it}_${it2}.root" >> ${file}.sh
            #echo  mv QSGJET_E${en}_th25-36_${it}_${it2}.root ${workdir2}/. >> ${file}.sh
            echo cp ${default_file} ./ >> ${file}.sh
            echo "${augersim} QSGJET_E${en}_th25-36_${it}_${it2}.root" >> ${file}.sh
            # echo  mv QSGJET_E${en}_th25-36_${it}_${it2}.part ${workdir2}/.  >> ${file}.sh
            echo  mv Sim_QSGJET_E${en}_th25-36_${it}_${it2}.root ${workdir2}/Sim_QSGJET_E${en}_th25-36_${it}_${it2}.root >> ${file}.sh

        chmod +x ${file}.sh
        end
    end
end
