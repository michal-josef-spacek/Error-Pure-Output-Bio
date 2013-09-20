package Error::Pure::Output::Bio;

# Pragmas.
use base qw(Exporter);
use strict;
use warnings;

# Modules.
use Readonly;

# Constants.
Readonly::Array our @EXPORT => qw(err_bio);
Readonly::Scalar my $SPACE => q{ };

# Version.
our $VERSION = 0.01;

# Bio error print.
sub err_bio {
	my @errors = @_;
	my $ret;
	foreach my $error_hr (@errors) {
		my $e = shift @{$error_hr->{'msg'}};
		chomp $e;

		# Title.
		# XXX Add class.
		my $title = '------------- EXCEPTION -------------';
		$ret .= $title."\n";

		# Error.
		$ret .= 'MSG: '.$e."\n";

		# Value.
		while (@{$error_hr->{'msg'}}) {
			my $f = shift @{$error_hr->{'msg'}};
			my $t = shift @{$error_hr->{'msg'}};

			if (! defined $f) {
				last;
			}
			$ret .= 'VALUE: '.$f;
			if ($t) {
				$ret .= ': '.$t;
			}
			$ret .= "\n";
		}

		# Stack trace.
		foreach my $i (0 .. $#{$error_hr->{'stack'}}) {
			my $st = $error_hr->{'stack'}->[$i];
			$ret .= 'STACK: '.$st->{'class'};
			$ret .= $SPACE.$st->{'prog'};
			$ret .= ':'.$st->{'line'};
			$ret .= "\n";
		}

		# Footer.
		my $footer = ('-' x length($title))."\n";
		$ret .= $footer;
	}
	return $ret;
}

1;
