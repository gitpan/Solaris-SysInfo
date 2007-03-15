use strict;
use warnings;

use Module::Build;

my $build = Module::Build->new
  (
   module_name => 'Solaris::SysInfo',
   PL_files    => {
                     'lib/Solaris/SysInfo/Constants.pm.PL' => 'lib/Solaris/SysInfo/Constants.pm',
                  },
   build_requires => {
                        'Test::More' => 0,
                     },
   license => 'perl',
   create_makefile_pl => 'traditional',
  );
  
$build->create_build_script;
