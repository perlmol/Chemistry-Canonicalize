#!/home/ivan/bin/perl

use strict;
use warnings;
use blib;

use Chemistry::File::SMILES;
use Chemistry::Canonicalize 'canonicalize';

my $smiles = shift or die "please give a SMILES\n";
my $mol = Chemistry::Mol->parse($smiles, format => "smiles");

canonicalize($mol, sort => 1);

for my $atom ($mol->atoms) {
    #print "atom\n";
    printf "$atom: %s %s\n", $atom->attr("canon/symmetry_class"), 
        $atom->attr("canon/class");
}
