use strict;
use warnings;

use Module::Build;

my $build = Module::Build->new
  (
   module_name => 'Solaris::SysInfo',
   PL_files    => {
                     'lib/Solaris/SysInfo/Constants.pm.PL' => 'lib/Solaris/SysInfo/Constants.pm',
                  },
   license     => 'perl',
  );

$build->create_build_script;
