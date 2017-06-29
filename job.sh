#! /usr/local/bin/tcsh -f
#cd $TMPBATCH

set exec = "/afs/in2p3.fr/group/pauger/users9/ipno/CDASdev/trunk/Work/head/amd64_sl6/testtime.exe" 
set subdir = "/sps/pauger/Malargue/Raid/data/Prod/v1r0/AugerSd"
set workdir = "/afs/in2p3.fr/group/pauger/users31/isabelle/Diane/data"
unalias ls

rm -f submit
touch submit

foreach yr (2004 2005 2006 2007 2008 2009 2010 2011 2012 2013)
    foreach mth (01 02 03 04 05 06 07 08 09 10 11 12)
	set file = Test_${yr}_${mth}
	echo qsub -P P_pauger -l sps=1 -l ct=15000 ${file}.sh >> submit
    end
end
chmod +x submit


foreach yr (2004 2005 2006 2007 2008 2009 2010 2011 2012 2013)
    foreach mth (01 02 03 04 05 06 07 08 09 10 11 12)
	set file = Test_${yr}_${mth}
	rm -f ${file}.sh
	touch ${file}.sh
    
	#echo cp ${workdir}/lis${yr}.txt lis.txt  >> ${file}.sh
	echo ${exec}  ${subdir}/${yr}/${mth}/adsd*.root >> ${file}.sh
	
	echo  "cp  TestMois.root ${workdir}/TestMois_${yr}_${mth}.root" >> ${file}.sh     
	    
 
	chmod +x ${file}.sh
		
  end
end
