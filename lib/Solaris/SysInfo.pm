#  You may distribute under the terms of either the GNU General Public License
#  or the Artistic License (the same terms as Perl itself)
#
#  (C) Paul Evans, 2007 -- leonerd@leonerd.org.uk

package Solaris::SysInfo;

use strict;
use warnings;

require Exporter;
require DynaLoader;

use Solaris::SysInfo::Constants;

our @ISA = qw( Exporter DynaLoader );

our @EXPORT_OK = qw(
   sysinfo
);

our $VERSION = '0.03';

bootstrap Solaris::SysInfo $VERSION;

# Import all the auto-generated constant symbols
for( @Solaris::SysInfo::Constants::NAMES ) {
   push @EXPORT_OK, $_;
   no strict 'refs';
   *{$_} = \&{"Solaris::SysInfo::Constants::$_"};
}

=head1 NAME

C<Solaris::SysInfo> - A perl wrapper around Solaris' sysinfo(1) system call

=head1 SYNOPSIS

 use Solaris::SysInfo qw( sysinfo SI_ARCHITECTURE SI_ISALIST );

 print "This system uses a " . sysinfo( SI_ARCHITECTURE ) . " CPU type\n";
 print "It supports instruction sets:\n";
 print "  $_\n" for split( m/ /, sysinfo( SI_ISALIST ) );

=head1 FUNCTIONS

=head2 $info = sysinfo( $command )

Return the sysinfo(1) string generated by the OS to the command given by
$command. Returns C<undef> on errors.

=head1 SEE ALSO

=over 4

=item *

L<POSIX> - Perl interface to IEEE Std 1003.1 (the C<uname> function)

=back

=head1 AUTHOR

Paul Evans E<lt>leonerd@leonerd.org.ukE<gt>

=cut

# Keep perl happy; keep Britain tidy
1;
