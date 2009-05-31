#! /usr/bin/perl -w

use strict;
my $divfile = '/var/lib/dpkg/diversions';

open(DIVERSIONS,"<",$divfile) or die "Couldn't open $divfile for read: $!\n";

while (my $from = <DIVERSIONS>) {
  my $to = <DIVERSIONS>;
  my $pkg = <DIVERSIONS>;
  chomp($from, $to, $pkg);
  print "diversion by $pkg from: $from\n";
  print "diversion by $pkg to: $to\n";
}
close(DIVERSIONS);

