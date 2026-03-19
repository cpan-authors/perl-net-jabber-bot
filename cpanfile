requires 'Log::Log4perl';
requires 'Moo', '2';
requires 'Type::Tiny', '1';
requires 'Types::Standard';
requires 'Mozilla::CA';
requires 'Net::Jabber', '2.0';
requires 'Sys::Hostname';
requires 'Time::HiRes';
requires 'version';

on 'test' => sub {
    requires 'FindBin';
    requires 'lib';
    requires 'Test::More';
    requires 'Test::NoWarnings';
    requires 'Test::Pod';
    requires 'Test::Pod::Coverage';
};
