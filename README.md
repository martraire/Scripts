# Scripts: Various scripts for Batch Job & Distributed Computing

This repository contains various scripts to launch Batch jobs or to run some algorithms on distributed computing (PCfarm/Grid computing).
These scripts are mainly witten in Shell (bash, tcsh) but there are some Perl too.


## Batch jobs
Most of these scripts are for Batch jobs. Here is the list :

**job.sh :** Builds a tree collecting all the information of Shower (energy, theta, distance to core, time, Nb tanks,...) to analyze the traces of Auger data, from 2004 to 2015

**job_shower.sh :** Runs simulations of the Auger Observatory different showers (angle, composition, position) :
1. Extracts the shower from iRods (data management soft)
2. Runs my simulation software AugerSim
3. Stores the output of the simulation (ROOT file).
 
**job_doshower.sh :** Builds Corsika showers and convert into ROOT.
1. Calls the Perl script "script_corsika.pl"
2. Builds Corsika showers, rename and convert into ROOT.
3. Runs my software "AugerSim" (simulation of Auger obs) 
4. Stores the output (ROOT file).

**job_showerIRODS.sh :** Gets the shower from iRODS and run AugerSim
1. Gets the shower from iRODS
2. Runs my software "AugerSim"
3. Stores the output (ROOT file).
                   
**job_offline.sh :** Runs Offline simulation of Auger observatory
1. Calls the Perl script "script_offline.pl"
2. Builds Corsika showers, rename and convert into ROOT.
3. Runs my software "AugerSim"
4. Stores the output (ROOT file).

**job_hpss.sh :** Get the shower stored in HPSS 
1. Moves the shower from HPSS to work directory
2. Runs simulation (AugerSim) 
                   
**job_mvShowerToHPSS.sh :** Move Corsika shower from iRods to HPSS
1. Gets Shower stored in iRODS
2. Moves to HPSS



## Distributed Computing

Some scripts to run my algorithms on Grid computing :

**IPNJobMaker.sh :** Run my simulation on IPN computing grid
1. Call the Perl script "script_corsika.pl"
2. Collect Corsika file as input and run LhaaSim
3. Save output of the simulation.
                   
**IPNJobMaker2.sh :** Same with more option and updated version.
    
    
    
## More
    
Here are some additionals files, useful for the script or simulation

**ShowerList directory :** Contains the list of showers stored on iRODS
1. *EPOS_FER:* List of Iron showers ordered by theta angle (Energy: 10E19, IRON, Hadronic Model: EPOS)
2. *EPOS_PROTON:* Same with proton shower
3. *QSGJET2_FER:* List of Iron showers ordered by theta angle (Energy: 10E19, IRON, Hadronic Model: QSGJET2)
4. *QSGJET2_PROTON:* Same with proton shower
5. *test_aires:* Some AIRES showers from SRB 
6. *test_irods:* Test shower from iRODS
                   
**ConverListSrbToIrods.C :** Programme to convert path from SRB to iRODS
    
    
