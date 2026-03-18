requires 'Authen::SASL';
requires 'Log::Log4perl';
requires 'LWP::Online';
requires 'Module::Install';
requires 'Moose', '0.82';
requires 'MooseX::Types', '0.12';
requires 'Mozilla::CA';
requires 'Net::Jabber', '2.0';
requires 'Sys::Hostname';
requires 'Time::HiRes';
requires 'version';
requires 'XML::Stream';
requires 'YAML::Tiny';

on 'test' => sub {
    requires 'FindBin';
    requires 'lib';
    requires 'Test::More';
    requires 'Test::NoWarnings';
    requires 'Test::Pod';
    requires 'Test::Pod::Coverage';
};
