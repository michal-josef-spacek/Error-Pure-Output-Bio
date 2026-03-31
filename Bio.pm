package Error::Pure::Output::Bio;

use base qw(Exporter);
use strict;
use warnings;

use Readonly;

# Constants.
Readonly::Array our @EXPORT => qw(err_bio);
Readonly::Scalar my $SPACE => q{ };

our $VERSION = 0.01;

# Bio error print.
sub err_bio {
	my @errors = @_;

	my @ret;
	foreach my $error_hr (@errors) {
		my $e = shift @{$error_hr->{'msg'}};
		chomp $e;

		# Title.
		# XXX Add class.
		my $title = '------------- EXCEPTION -------------';
		push @ret, $title;

		# Error.
		push @ret, 'MSG: '.$e;

		# Value.
		while (@{$error_hr->{'msg'}}) {
			my $f = shift @{$error_hr->{'msg'}};
			my $t = shift @{$error_hr->{'msg'}};

			if (! defined $f) {
				last;
			}
			my $ret = 'VALUE: '.$f;
			if ($t) {
				$ret .= ': '.$t;
			}
			push @ret, $ret;
		}

		# Stack trace.
		foreach my $i (0 .. $#{$error_hr->{'stack'}}) {
			my $st = $error_hr->{'stack'}->[$i];
			my $ret = 'STACK: '.$st->{'class'};
			$ret .= $SPACE.$st->{'prog'};
			$ret .= ':'.$st->{'line'};
			push @ret, $ret;
		}

		# Footer.
		my $footer = ('-' x length($title));
		push @ret, $footer;
	}

	return wantarray ? @ret : (join "\n", @ret)."\n";
}

1;
