#!/bin/bash
#
# // modify ipngrid04.in2p3.fr  to   ipngrid12.in2p3.fr


WHOAMI=$(whoami)
GRID_FTPSERVER="ipngrid12.in2p3.fr"
pwd=$(pwd)
jobname=corsika-test
statusfile="joblist"
joblist_finished="joblist_finished"
LFC_HOME="/grid/vo.ipno.in2p3.fr/martraire/"

nruns=1
THETA="0 18 26 33 39 45"  
LISTENER="1E3 3E3 6E3 1E4 3E4 6E4 1E5 3E5 6E5 1E6"
#LISTENER="1E4 1.58E4 2.51E4 3.98E4 6.31E4 1E5 1.58E5 2.51E5 3.98E5 6.31E5 1E6 1.58E6"

ALLjobfile="jobs_list_IPN"
ALLjobfile_sav="jobs_list_IPN_sav"
ALLjobfile_u="jobs_list_IPN_update"

echo -e "\t0- Renew delegated proxy"
echo -e "\t1- Remove job list"
echo -e "\t2- Create/submit jobs"
echo -e "\t5- Status of jobs"
echo -e "\t6- Copy final files in a folder"
echo -e "\t7- Migrate finished jobs"
echo -e "\t9- Cancel & Purge ALL files"
echo -e "\t\twhat do you want to do? opt="
read opt


if [ $opt -eq 1 ] 
    then
    echo `rm -f $ALLjobfile`

elif [ $opt -eq 2 ] 
    then 
    echo "what is the minimum/maximum iteration (ex: 20 30)"
    read ans ans2

    LISTITER="`seq ${ans} ${ans2}`"

    for iter in $LISTITER
      do
      for ener in $LISTENER
	do
	for angle in $THETA
	  do
	  jobdir=job-$ener-$angle-$iter
	  
	  mkdir -p $pwd/$jobdir
	  rm -f $pwd/$jobdir/*.*
	  jdlfile="$pwd/$jobdir/$jobdir.jdl"
	  shfile="$pwd/$jobdir/$jobdir.sh"
	  lfc-mkdir /grid/vo.ipno.in2p3.fr/martraire/$jobdir
	  
	  echo "Executable = \"$jobdir.sh\";" >> $jdlfile
	  echo "Arguments = \" $ener $angle $iter $nruns\";" >> $jdlfile
	  echo "StdOutput     = \"file.stdout\";" >> $jdlfile
	  echo "StdError      = \"file.stderr\";" >> $jdlfile
	  echo "InputSandbox={\"/projet/auger/Corsika_6.9/corsika_grid/v6.990.r2427/run/script_corsika.pl\",\"/projet/auger/Corsika_6.9/corsika_grid/v6.990.r2427/run/CS.tar.gz\",\"/projet/auger/Corsika_6.9/corsika_grid/v6.990.r2427/run/corsika6990Linux_QGSJET_gheisha\",\"/projet/auger/Corsika_6.9/corsika_grid/v6.990.r2427/run/inputs_lhaaso.template\",\"/projet/auger/Diane/LHAASIM/Convert/v0r2/Linux-x86_64/CorsToRoot.exe\",\"/projet/auger/Diane/LHAASIM/LhaaSim/v0r2/data/default.inp\",\"/projet/auger/Corsika_6.9/corsika_grid/v6.990.r2427/run/$jobdir/$jobdir.sh\"};">> $jdlfile
#	echo "OutputSandbox = {\"file.stdout\",\"file.stderr\"};" >> $jdlfile
	  
	  echo "#!/bin/bash" >> $shfile
	  echo "chmod +x corsika6990Linux_QGSJET_gheisha CorsToRoot.exe script_corsika.pl" >> $shfile
	  echo "echo \'hello world\'" >>  $shfile
	  echo "tar xvfz CS.tar.gz" >> $shfile
	  echo "mkdir -p /nfs1/scratch/corsika" >> $shfile
	  echo "rm -rf /nfs1/scratch/corsika/\*" >> $shfile
	  echo "setenv ROOTSYS /nfs1/scratch/deligny/root" >> $shfile
	  echo "setenv LD_LIBRARY_PATH ${ROOTSYS}/lib" >> $shfile
	  echo "setenv PATH ${PATH}:${ROOTSYS}/bin" >> $shfile
	  echo "./script_corsika.pl $ener $angle $iter" >> $shfile
	  echo "cp -r * /nfs1/scratch/corsika" >> $shfile
	  echo "chmod -Rf 777 /nfs1/scratch/corsika" >> $shfile
	  echo "lcg-cr -v -d ipnsedpm.in2p3.fr file://\`pwd\`/Sim_corsika_${ener}_${angle}_${iter}.root -l lfn:/grid/vo.ipno.in2p3.fr/martraire/$jobdir/Sim_corsika_${ener}_${angle}_${iter}.root" >> $shfile 
	  echo "lcg-cr -v -d ipnsedpm.in2p3.fr file://\`pwd\`/file.stdout -l lfn:/grid/vo.ipno.in2p3.fr/martraire/$jobdir/file.stdout" >> $shfile
	  echo "lcg-cr -v -d ipnsedpm.in2p3.fr file://\`pwd\`/file.stderr -l lfn:/grid/vo.ipno.in2p3.fr/martraire/$jobdir/file.stderr" >> $shfile
	  

# Old method to submit jobs :
## jobid=`glite-ce-job-submit -D proxy_martraire  -r ipngrid12.in2p3.fr:8443/cream-pbs-ipno -o jid $jdlfile `

# New method to submit distributed jobs :  
	  jobid=`glite-ce-job-submit -D proxy_martraire  -r ipngrid12.in2p3.fr:8443/cream-pbs-ipnofast  -o jid $jdlfile `

	  echo "$iter $ener $angle $jobid">> $ALLjobfile
	done
      done
    done

    
elif [ $opt -eq 5 ] 
    then 
    joblist_tmp=tmp_l
    rm -f $joblist
    glite-ce-job-list ipngrid12.in2p3.fr:8443>$statusfile 2>/dev/null
    while read line
      do 
      glite-ce-job-status $line
    done < "$statusfile"

elif [ $opt -eq 6 ] 
    then 

    echo "what is the minimum/maximum iteration (ex: 20 30)"
    read ans ans2
    LISTITER="`seq ${ans} ${ans2}`"

    for iter in $LISTITER
      do
      for ener in $LISTENER
	do
	for angle in $THETA
	  do
	  #jobdir=job-$ener-$angle-$iter
	  #lcg-cp -v lfn:${jobdir}/Sim_corsika_${ener}_${angle}_${iter}.root file://`pwd`/LhaRootGamma/Sim_corsika_${ener}_${angle}_${iter}.root
	  #lcg-cp -v lfn:$/nfs1/scratch/corsika/Sim_corsika_${ener}_${angle}_${iter}.root file://`pwd`/LhaRootProton_op/Sim_corsika_${ener}_${angle}_${iter}.root
	  lcg-cp -v /nfs1/scratch/corsika/Sim_corsika_${ener}_${angle}_${iter}.root file://`pwd`/LhaRootProton/Sim_corsika_${ener}_${angle}_${iter}.root

	done
      done
    done
    
    

elif [ $opt -eq 7 ] 
    then 
    
    joblist_tmp=tmp_l
    rm -f $joblist_tmp
    glite-ce-job-list ipngrid12.in2p3.fr:8443>$statusfile
    while read it e a j
      do 
      glite-ce-job-status $j |grep Status |grep -q DONE-OK > /dev/null 2>&1
      jobfinish_ok=$?
      glite-ce-job-status $j |grep Status |grep -q DONE-FAILED > /dev/null 2>&1
      jobfinish_failed=$?
      #echo "job output: $jobfinish_ok $jobfinish_failed"
      if [ $jobfinish_ok -eq 0 ]
	  then
	  jobdir=job-$e-$a-$it 
	  echo "$it $e $a $j">>$joblist_finished 
#	  rm -f $pwd/$jobdir/anis.dat
	  lcg-cp -v lfn:/grid/vo.ipno.in2p3.fr/martraire/$jobdir/DAT000006 file://`pwd`/$jobdir/DAT000006
	  lcg-cp -v lfn:/grid/vo.ipno.in2p3.fr/martraire/$jobdir/Sim_corsika_${e}_${a}_${it}.root file://`pwd`/$jobdir/Sim_corsika_${e}_${a}_${it}.root
	  glite-ce-job-purge -N $j
#	  uberftp ${GRID_FTPSERVER} "rm /sandboxes/tmp/$WHOAMI/$jobdir/*.*"
      elif [ $jobfinish_failed -eq 0 ]
	  then
	  jobdir=job-$e-$a-$it
	  echo "ERROR: $jobdir failed"
	  glite-ce-job-purge -N $j
#	  uberftp ${GRID_FTPSERVER} "rm /sandboxes/tmp/$WHOAMI/$jobdir/*.*"   
      else
	  echo "$it $e $a $j">>$joblist_tmp
      fi
    done < $ALLjobfile

    rm -f $ALLjobfile; [ -f "$joblist_tmp" ] && mv $joblist_tmp $ALLjobfile


elif [ $opt -eq 9 ] 
    then 

    joblist_tmp=tmp_l
    rm -f $joblist
    glite-ce-job-list ipngrid12.in2p3.fr:8443>$joblist_tmp
    while read line
      do 
      glite-ce-job-cancel -N $line
      glite-ce-job-purge -N $line

    done < "$joblist_tmp"
    
elif [ $opt -eq 0 ] 
    then 
    voms-proxy-init --voms vo.ipno.in2p3.fr --valid 24:0
    #glite-ce-delegate-proxy -e ipngrid12 proxy_martraire
    glite-ce-proxy-renew -e ipngrid12 proxy_martraire
else 
    echo "Wrong option: opt=$opt"
fi
