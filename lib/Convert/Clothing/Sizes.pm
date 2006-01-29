package Convert::Clothing::Sizes;

###############################################################################
# Modules

use strict;
use warnings;
use English;
use Carp qw(croak cluck confess);



###############################################################################
# Globals and constants

use constant DEBUG => $ENV{DEBUG} ? 1 : 0;
use vars qw($VERSION $AUTOLOAD);
$VERSION = sprintf('%d.%02d', q$Revision: 1.2 $ =~ /(\d+)/g);



###############################################################################
# Public methods

sub new {
	# Check we're being called correctly with a class name
	ref(my $class = shift) && croak 'Class name required';

	# Check we've got something sane passed
	croak 'Odd number of elements passed when even number was expected' if @_ % 2;
	my %args = @_;

	# Double check the key pairs for stuff we recognise
	while (my ($k,$v) = each %args) {
		unless (grep(/^$k$/i, qw(gender clothing))) {
			croak "Unrecognised paramater '$k' passed to module $class";
		}
	}

	# Default object building
	my $self = { %args };

	# Information
	$self->{software} = {
			Caller => [ caller ],
			Package => __PACKAGE__,
			Version => $VERSION,
			Author => '$Author: nicolaw $',
			Revision => '$Revision: 1.2 $',
			Id => '$Id: Sizes.pm,v 1.2 2005/01/14 01:51:45 nicolaw Exp $',
		};

	# Debug
	DUMP('$self',$self);

	# Bless and return
	bless($self,$class);
	return $self;
}

sub _clothingType {
	my $self = shift;
	my $in = shift;

	my $types = {
			Blouses => qw(top tops sweater sweaters blouse blouses),
			Shoes => qw(shoe trainer trainers kicks shoes),
			JuniorDresses => qw(juniordresses),
			PetiteDresses => qw(petitedresses),
			WomensDresses => qw(womensdresses dress dresses womensdress),
		};

	unless (defined $in) {
		return $types;
	} else {
		for my $type (keys %{$types}) {
			return $type if grep(/^\s*$in\s*$/i, @{$types->{$type}});
		}
	}

	return undef;
}

sub _sizeMaths {
	my $self = shift;

	my $sizeMaths = {
			Blouses => {
				'US->Europe' => '+6',
				'Europe->US' => '-6',
			},
			Shoes => {
				'US->Europe' => '',
				'US->UK' => '',
				'US->Japan' => '',
				'Europe->US' => '',
				'Europe->UK' => '',
				'Europe->Japan' => '',
				'UK->US' => '',
				'UK->Europe' => '',
				'UK->Japan' => '',
				'Japan->US' => '',
				'Japan->Europe' => '',
				'Japan->UK' => '',
			},
			JuniorDresses => {
				'US->Europe' => '',
				'US->UK' => '',
				'US->Japan' => '',
				'Europe->US' => '',
				'Europe->UK' => '',
				'Europe->Japan' => '',
				'UK->US' => '',
				'UK->Europe' => '',
				'UK->Japan' => '',
				'Japan->US' => '',
				'Japan->Europe' => '',
				'Japan->UK' => '',
			},
			PetiteDresses => {
				'US->Europe' => '',
				'US->UK' => '',
				'US->Japan' => '',
				'Europe->US' => '',
				'Europe->UK' => '',
				'Europe->Japan' => '',
				'UK->US' => '',
				'UK->Europe' => '',
				'UK->Japan' => '',
				'Japan->US' => '',
				'Japan->Europe' => '',
				'Japan->UK' => '',
			},
			WomensDresses => {
				'US->Europe' => '',
				'US->UK' => '',
				'US->Japan' => '',
				'Europe->US' => '',
				'Europe->UK' => '',
				'Europe->Japan' => '',
				'UK->US' => '',
				'UK->Europe' => '',
				'UK->Japan' => '',
				'Japan->US' => '',
				'Japan->Europe' => '',
				'Japan->UK' => '',
			},
		};
}

sub _sizeIndex {
	my $self = shift;

	my $sizeIndex = {
			Blouses => {
				US => qw(32 34 36 38 40 42 44 46),
				Europe => qw(38 40 42 44 46 48 50 52),
			},
			Shoes => {
				US => qw(3 4 5 6 7 8 9 10),
				Europe => qw(35 36 37 38 39 40 41 42),
				UK => qw(1.5 2.5 3.5 4.5 5.5 6.5 7.5 8.5),
				Japan => qw(20 21 22 23 24 25 26 27),
			},
			JuniorDresses => {
				US => qw(3 5 7 9 11 13 15),
				Europe => qw(30 32 34 36 38 40 42),
				UK => qw(5 7 9 11 13 15 17),
				Japan => qw(2 4 6 8 10 12 14),
			},
			PetiteDresses => {
				US => qw(4 6 8 10 12 14 16 18),
				Europe => qw(34 36 38 40 42 44 46 48),
				UK => qw(6 8 10 12 14 16 18 20),
				Japan => qw(3 5 7 9 11 13 15 17),
			},
			WomensDresses => {
				US => qw(32 34 36 38 40 42 44 46),
				Europe => qw(42 44 46 48 50 52 54 56),
				UK => qw(34 36 38 40 42 44 46 48),
				Japan => qw(31 33 35 37 39 41 43 45),
			},
		};

	return $sizeIndex;
}

sub foo_method {
	my $self = shift;
	unless(ref $self eq __PACKAGE__ || UNIVERSAL::isa($self, __PACKAGE__)) {
		unshift @_, $self;
		$self = new __PACKAGE__;
	}

	# Check we've got something sane passed
	croak 'Odd number of elements passed when even number was expected' if @_ % 2;
	my $params = { @_ };

}

sub DESTROY {}

sub AUTOLOAD {
	my $self = shift;
	my $type = ref($self) || croak "$self is not an object";
	(my $name = $AUTOLOAD) =~ s/.*://;

}



###############################################################################
# Private methods

sub TRACE {
	return unless DEBUG;
	warn(shift());
}
sub DUMP {
	return unless DEBUG;
	eval {
		require Data::Dumper;
		warn(shift().': '.Data::Dumper::Dumper(shift()));
	}
}



1;



###############################################################################
# POD

=pod

=head1 NAME

Convert::Clothing::Sizes - Clothing size conversion

=head1 VERSION

$Revision: 1.2 $

=head1 SYNOPSIS

    use strict;
    use warnings;
    use Convert::Clothing::Sizes ();
    
    my $ccs = new Convert::Clothing::Sizes;

=head1 DESCRIPTION

Convert::Clothing::Sizes is an attempt to allow easy convertion betwen
US, UK and European clothing and shoe sizes for both men and (mainly,
because lets face it, men aren't important) women.

=head1 METHODS

=over 4

item *

=back

=back

=head1 ACKNOWLEDGEMENTS

http://www.csgnetwork.com/clothingwomenconv.html
http://www.promdressshop.com/size.html

=head1 TODO

Lots.

=head1 BUGS

Probably. Please email me a patch if you find something ghastly.

=head1 AUTHOR

Nicola Worthington <nicolaworthington@msn.com>

http://www.nicolaworthington.com/

$Author: nicolaw $

=head1 CHANGES

    $Log: Sizes.pm,v $
    Revision 1.2  2005/01/14 01:51:45  nicolaw
    Adding a chunk of code

    Revision 1.1  2004/10/06 19:43:37  nicolaw
    Adding base shell to start working from


=cut

