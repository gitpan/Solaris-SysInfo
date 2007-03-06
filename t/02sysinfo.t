#!/usr/bin/perl -w

use strict;

use Test::More tests => 8;

use Solaris::SysInfo qw( sysinfo SI_ISALIST );

use POSIX qw( EINVAL );

my $ret = sysinfo( SI_ISALIST );
ok( defined $ret, 'defined $ret' );

my @list = split( m/ /, $ret );
ok( scalar @list > 1, '$ret contains more than one word' );

# Check it works just as well with strings-that-look-like-numbers
$ret = sysinfo( "514" );
ok( defined $ret, 'defined $ret with string-as-number' );

# Solaris doesn't define 100
$ret = sysinfo( 100 );
my $errno = $!+0;
ok( !defined $ret,    'not defined $ret with invalid number' );
ok( $errno == EINVAL, '$! == EINVAL with invalid number' );

my $warning;

{
   local $SIG{__WARN__} = sub { $warning = shift };
   $ret = sysinfo( "Hello" );
   $errno = $!+0;
}

ok( !defined $ret,    'not defined $ret with invalid number' );
ok( $errno == EINVAL, '$! == EINVAL with invalid number' );
like( $warning, qr/\bisn't numeric\b/, 'appropriate warning with invalid number' );
