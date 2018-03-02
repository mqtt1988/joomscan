#!/usr/bin/perl

use Term::ANSIColor;

print color("YELLOW");
print q{
    ____  _____  _____  __  __  ___   ___    __    _  _ 
   (_  _)(  _  )(  _  )(  \/  )/ __) / __)  /__\  ( \( )
  .-_)(   )(_)(  )(_)(  )    ( \__ \( (__  /(__)\  )  ( 
  \____) (_____)(_____)(_/\/\_)(___/ \___)(__)(__)(_)\_)
};
   	print color("red") . "\t\t\t(1337.today)" . color("reset");
   	print "
   
    --=[". color("BLUE") . "OWASP JoomScan". color("reset") ."
    +---++---==[Version : "
   	. color("red"). "$version\n". color("reset") . "    +---++---==[Update Date : [". color("red") . "$update". color("reset") . "]
    +---++---==[Authors : ". color("red") . "$author". color("reset")."
    --=[Code name : ". color("red") . "$codename". color("reset")."\n    \@OWASP_JoomScan , \@rezesp , \@Ali_Razmjo0 , \@OWASP\n\n";
    	
if(!defined $ARGV[0]){
 
    print color("cyan");
    printf "\n   Usage: 
    	joomscan.pl <target>
   	joomscan.pl -u http://target.com/joomla
   
   
      Options: 
   	joomscan.pl --help\n\n";
    print color("reset");
    exit(1);
}
$cookie=1;
#Start help Function
sub help
{
	print color("cyan");
	printf "   

Help :

Usage:	$0 [options]

--url | -u <URL>                |   The Joomla URL/domain to scan.
--enumerate-components | -ec    |   Try to enumerate components.

--cookie <String>               |   Set cookie.
--user-agent | -a <User-Agent>  |   Use the specified User-Agent.
--random-agent | -r             |   Use a random User-Agent.
--timeout <Time-Out>            |   Set timeout.
--about                         |   About Author
--update                        |   Update to the latest version.
--help | -h                     |   This help screen.
--version                       |   Output the current version and exit.

";
	print color("reset");
	exit(1);
}
sub about
{
	print color("cyan");
	printf "
   Author         :   $author
   Twitter        :   \@rezesp , \@Ali_Razmjo0
   Git repository :   https://github.com/rezasp/joomscan/
   Issues         :   https://github.com/rezasp/joomscan/issues
    \n\n";
	print color("reset");
	exit(1);
}
sub update
{
    do "./core/update.pl";
	print color("reset");
	exit(1);
}


GetOptions(
  'help|h' => sub { help(0) },
  'update' => sub { update(0) },
  'about' => sub { about(0) },
  'enumerate-components|ec'   => sub { $components = 1 },
  'random-agent|r'   => sub { $randomagent = 1 },
  'user-agent|a=s' => \$agent,
  'timeout=s' => \$timeout,
  'cookie=s' => \$cookie,
  'u|url=s' => \$target,
  'version' => sub { print "\n\nVersion : $version\n\n";exit; },

);
if($target !~ /\./){exit 0;}
if($target !~ /http/) { $target = "http://$target"; };

#End help Function
