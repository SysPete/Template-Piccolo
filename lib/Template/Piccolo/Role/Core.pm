package Template::Piccolo::Role::Core;

=head1 NAME

Template::Piccolo::Role::Core

=cut

use Carp qw/croak/;
use HTML::Selector::XPath;
use Template::Piccolo::Types -types;
use Moo::Role;

=head1 ATTRIBUTES

=head2 name

=cut

has name => (
    is       => 'ro',
    isa      => NonEmptySimpleStr,
    required => 1,
);

=head2 xpath

XPath selector.

=cut

has xpath => (
    is      => 'ro',
    isa     => NonEmptySimpleStr,
    lazy    => 1,
    default => sub { HTML::Selector::XPath->new( $_[0]->css )->to_xpath },
);

=head2 css

CSS selector to use instead of L</xpath>.

=cut

has css => (
    is  => 'ro',
    isa => NonEmptySimpleStr,
);

=head1 METHODS

=head2 BUILDARGS

We must have one of L</xpath> or L</css>.

=cut

sub BUILDARGS {
    my $class = shift;
    my %args = @_ == 1 && ref( $_[0] ) eq 'HASH' ? %{ $_[0] } : @_;

    croak "Cannot have both xpath and css" if ( $args{xpath} && $args{css} );
    croak "Must have either xpath or css" unless ( $args{xpath} || $args{css} );

    return \%args;
}

1;
