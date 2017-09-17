#!/usr/bin/perl
# mklinks.pl v0.1  -  small script for linking config files, ++
# by tapio, 2010
# Usage: mklinks.pl --help

use strict;
use warnings;
use File::Copy qw(move);
use File::Path qw(make_path);
use Tie::File;
use Getopt::Long;
use Pod::Usage;

use constant TRUE => 1;
use constant FALSE => 0;

my @files = <.*>;
my @editFiles= qw( .Xdefaults );
my $home = $ENV{'HOME'};
my $user = $ENV{'LOGNAME'};
my $dotsdir = "$home/.dotfiles";
my $bupSfx = "dotssave";
my $usage = "Usage:\n--verbose\t// be verbose\n
\n--dotfiles\t// all .files in this directory\n";

my $verbose;
my $awesome;
my $dotfiles;
my $fixpaths;
my $help;

GetOptions(
  'verbose' => \$verbose,
  'dotfiles'=> \$dotfiles,
  'help|?'    => \$help
) or pod2usage( { -message => $usage, -exitval => 2 } );

pod2usage( { -message => $usage, -exitval => 0 } ) if $help;

if ($ENV{'PWD'} !~ m/$dotsdir/i) {
  if ( ! -e $dotsdir ) {
    mkdir($dotsdir) or die "Could not create $dotsdir: $!\n";
  }
  chdir($dotsdir);
}
if ($dotfiles) {
  &dotfileDeploy;
}

sub dotfileDeploy {
  foreach my $file (@files) {
    unless ($file =~ m/^\.$|^\.\.$|^\.git$/i) {
      if (( -e "$home/$file" ) || ( -l "$home/$file" )) {
        if ( -d "$home/$file" ) {
          move("$home/$file", "$home/$file.$bupSfx")
            or die "Could not move directory: $!\n";
          if ($verbose) {
            print "Backup $home/$file => $home/$file.$bupSfx\n";
          }
        } else {
          move("$home/$file", "$home/$file.$bupSfx")
            or die "Could not move file: $!\n";
          if ($verbose) {
            print "Backup $home/$file => $home/$file.$bupSfx\n";
          }
        }
      }
      symlink("$dotsdir/$file", "$home/$file")
        or die "Could not create symlink: $!\n";
      if ($verbose) {
        print "Linking $home/$file => $dotsdir/$file\n";
      }
    }
  }
}
