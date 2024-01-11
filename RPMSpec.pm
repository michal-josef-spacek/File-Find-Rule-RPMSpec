package File::Find::Rule::RPMSpec;

use base qw(File::Find::Rule);
use strict;
use warnings;

use Error::Pure qw(err);
use Parse::RPM::Spec;

our $VERSION = 0.01;

# Detect RPM spec files.
sub File::Find::Rule::rpm_spec {
	my $file_find_rule = shift;
	my $self = $file_find_rule->_force_object;
	return $self->file->exec(sub{
		my $file = shift;
		my $spec = Parse::RPM::Spec->new({
			'file' => $file,
		});
		if (defined $spec->name) {
			return 1;
		} else {
			return 0;
		}
	});
}

# Detect RPM spec file via string in license.
sub File::Find::Rule::rpm_spec_license {
	my ($file_find_rule, $license) = @_;
	return _rpm_spec_common($file_find_rule, 'license', $license);
}

# Detect RPM spec file via string in name.
sub File::Find::Rule::rpm_spec_name {
	my ($file_find_rule, $name) = @_;
	return _rpm_spec_common($file_find_rule, 'name', $name);
}

# Detect RPM spec file via string in version.
sub File::Find::Rule::rpm_spec_version {
	my ($file_find_rule, $version) = @_;
	return _rpm_spec_common($file_find_rule, 'version', $version);
}

sub _rpm_spec_common {
	my ($file_find_rule, $method, $value) = @_;
	my $self = $file_find_rule->_force_object;
	return $self->file->exec(sub{
		my $file = shift;
		my $spec = Parse::RPM::Spec->new({
			'file' => $file,
		});
		if (! defined $spec->name) {
			return 0;
		}
		if ($spec->$method =~ m/$value/) {
			return 1;
		} else {
			return 0;
		}
	});
}

1;

__END__

=pod

=encoding utf8

=head1 NAME

File::Find::Rule::RPM::Spec - Common rules for searching RPM spec files.

=head1 SYNOPSIS

 use File::Find::Rule;
 use File::Find::Rule::RPM::Spec;

 my @files = File::Find::Rule->rpm_spec->in($dir);
 my @files = File::Find::Rule->rpm_spec_preamble($preamble_hr)->in($dir);

=head1 DESCRIPTION

This Perl module contains File::Find::Rule rules for detecting DWG files.

See L<.dwg on Wikipedia|https://en.wikipedia.org/wiki/.dwg>.

=head1 SUBROUTINES

=head2 C<dwg>

 my @files = File::Find::Rule->rpm_spec->in($dir);

The C<dwg()> rule detect DWG files.

=head2 C<dwg_magic>

 my @files = File::Find::Rule->rpm_spec_preamble($preamble_hr)->in($dir);

The C<dwg_magic($acad_magic)> rule detect DWG files for one magic version (e.g. AC1008).

=head1 EXAMPLE

TODO

=for comment filename=find

TODO

 use strict;
 use warnings;

 use File::Find::Rule;
 use File::Find::Rule::RPMSpec;

 # Arguments.
 if (@ARGV < 1) {
         print STDERR "Usage: $0 dir\n";
         exit 1;
 }
 my $dir = $ARGV[0];

 # Print all RPM spec files in directory.
 foreach my $file (File::Find::Rule->rpm_spec->in($dir)) {
         print "$file\n";
 }

 # Output like:
 # Usage: qr{[\w\/]+} dir

=head1 DEPENDENCIES

L<Error::Pure>,
L<File::Find::Rule>.
L<Parse::RPM::Spec>.

=head1 SEE ALSO

=over

=item L<File::Find::Rule>

Alternative interface to File::Find.

=back

=head1 REPOSITORY

L<https://github.com/michal-josef-spacek/File-Find-Rule-RPM-Spec>

=head1 AUTHOR

Michal Josef Špaček L<mailto:skim@cpan.org>

L<http://skim.cz>

=head1 LICENSE AND COPYRIGHT

© 2021-2024 Michal Josef Špaček

BSD 2-Clause License

=head1 VERSION

0.01

=cut
