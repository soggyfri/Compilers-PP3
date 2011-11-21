#!/usr/bin/perl -w

use IO::File;
use constant FIND => 'Error: popping';

@files = <test/*>;

foreach $file (@files){
    print $file . "\n";
   # $var = "./a.out < " . $file;
   # system($var);
    print $file . "\n";
    $outfile = "test_output/" .$file . ".output";
    $command = "./a.out < " . $file . " 2> " . $outfile;
    system($command);
#    <STDIN>;
}
