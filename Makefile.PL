# Load the Module::Install bundled in ./inc/
use inc::Module::Install;

##############################################################################
# Define metadata (we read it from the binary)

name         'check_lm_sensors';
version_from 'check_lm_sensors';
all_from     'check_lm_sensors.pod';

##############################################################################
# Specific dependencies

include 'version';

my %prereqs = (
requires 'Carp'                      => 0,
requires 'English'                   => 0,
requires 'Getopt::Long'              => 0,
requires 'version'                   => 0

);

if( eval { require Monitoring::Plugin } ) {
    $prereqs{'Monitoring::Plugin'} = 0.31;
}
else {
    $prereqs{'Nagios::Plugin'} = 0;
}

if( eval { require Monitoring::Plugin::Threshold } ) {
    $prereqs{'Monitoring::Plugin::Threshold'} = 0;
}
else {
    $prereqs{'Nagios::Plugin::Threshold'} = 0;
}

if( eval { require Monitoring::Plugin::Getopt } ) {
    $prereqs{'Monitoring::Plugin::Getopt'} = 0;
}
else {
    $prereqs{'Nagios::Plugin::Getopt'} = 0;
}

install_script  'check_lm_sensors';

WriteMakefile(
    INSTALLSCRIPT        => '/usr/lib/nagios/plugins/contrib',
    INSTALLBIN           => '/usr/lib/nagios/plugins/contrib',
    INSTALLSITESCRIPT    => '/usr/lib/nagios/plugins/contrib',
);
