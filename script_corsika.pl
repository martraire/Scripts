#!/usr/bin/perl -w

use strict;
use warnings;
use Cwd;
use File::Find;

if(@ARGV<3) {
    print("USAGE: ./script_corsika.pl [energy] [angle] [first run] [nruns]\n");
    die;
}

my $energy = $ARGV[0];
my $theta = $ARGV[1];
my $run = $ARGV[2];

my $localdir = "/afs/in2p3.fr/group/pauger/users9/ipno/CDASdev/trunk/Work/head/data/diane";
my $convert = "/afs/in2p3.fr/group/pauger/users9/ipno/AUGERSIM/Convert/v0r2/amd64_sl5/CorsToRoot.exe";
my $corsika = "./corsika6990Linux_QGSJET_gheisha";

my $inputdir = $localdir;
mkdir "$inputdir", 0777 unless -d "$inputdir";
my $outputdir = "/afs/in2p3.fr/group/pauger/users31/isabelle/corsika/diane";
mkdir "$outputdir", 0777 unless -d "$outputdir";



my @expr = ( "!run!", "!hseed!", "!egsseed!", "!chseed!", 
             "!ene!", "!theta!");

    
my $inputtobecopied = "$localdir/inputs_lhaaso.template";
open IN, $inputtobecopied or die "Can't read source file $inputtobecopied: $!\n";

my $input = $inputdir . "/inputsEPOS_auger_" . $energy . "_" . $theta . "_" . $run;
open OUT, ">$input" or die "Can't write on file $input: $!\n";
    
my $hseed = 100400 + $run;
my $egsseed = $hseed + 1;
my $chseed = $hseed + 2;;

while (<IN>) {
    s/$expr[0]/$run/g;
    s/$expr[1]/$hseed/g;
    s/$expr[2]/$egsseed/g;
    s/$expr[3]/$chseed/g;
    s/$expr[4]/$energy/g;
    s/$expr[5]/$theta/g;
    print OUT $_;
}
    
close IN;
close OUT;


my $command1 = $corsika . " < " . $input;
#print("$command1\n");
system($command1);

my $length = length($run);    
    
my $corsikafile = $localdir. "/DAT";
#my $corsikafile = $localdir;
for(my $digit=0; $digit<6-$length; $digit++) {
    $corsikafile = $corsikafile . "0";
    #print("$corsikafile\n");
}
$corsikafile = $corsikafile . $run;
my $command26 = "mv". $corsikafile . " " .  $outputdir . "/" . $energy . "_" . $theta; 
system($command26)

#print("$corsikafile\n");

my $corsikaroot = "$outputdir/corsika_" . $energy . "_" . $theta . ".root";

my $command2 = $convert . " " . $corsikafile . " " . $corsikaroot;
system($command2);  
system("rm $corsikafile"); 
print("$command2\n");

