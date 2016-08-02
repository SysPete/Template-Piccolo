package Template::Piccolo::Specification;

=head2 NAME

Template::Piccolo::Specification

=cut

use v5.10;
use Carp;
use Template::Piccolo::Types -types;
use Type::Params qw/compile/;
use Type::Utils;
use XML::LibXML '1.70';

use Moo;
with 'Template::Piccolo::Role::Core';
use namespace::clean;
use MooX::StrictConstructor;

=head1 ATTRIBUTES

=head2 containers

See L<Template::Piccolo::Container>.

=cut

has containers => (
    is  => 'ro',
    isa => Map [ Str, Container ],
    default => sub { +{} },
);

=head2 lists

See L<Template::Piccolo::List>.

=cut

has lists => (
    is  => 'ro',
    isa => Map [ Str, List ],
    default => sub { +{} },
);

=head2 parser

Defaults to an instance of L<XML::LibXML::Parser>.

=cut

has parser => (
    is => 'ro',
    isa => Object,
    lazy => 1,
    default => sub { XML::LibXML->new($_[0]->parser_options) },
);

=head2 parser_options

Hash reference of options for L</parser>.

Defaults to:

    {
        expand_xinclude   => 1,
        no_xinclude_nodes => 1,
        no_network        => 1,
    }

=cut

has parser_options => (
    is      => 'ro',
    isa     => HashRef,
    default => sub {
        +{
            expand_xinclude   => 1,
            no_xinclude_nodes => 1,
            no_network        => 1,
        };
    },
);

=head1 METHODS

=head2 add_container

=cut

sub add_container {
    state $check = compile( $Invocant, Container );
    my ( $self, $container ) = $check->(@_);
    croak "Container with name ", $container->name, " already exists."
      if exists $self->containers->{ $container->name };
    push @{ $self->containers }, +{ $container->name => $container };
}

=head2 add_list

=cut

sub add_container {
    state $check = compile( $Invocant, Container );
    my ( $self, $container ) = $check->(@_);
    croak "Container with name ", $container->name, " already exists."
      if exists $self->containers->{ $container->name };
    push @{ $self->containers }, +{ $container->name => $container };
}

sub _self_or_new {
    ref( $_[0] ) ? $_[0] : $_[0]->new;
}

=head2 from_file

=cut

sub from_file {
    my $self = shift->_self_or_new;
    my $filename = shift;

    ...
}

=head2 from_xml

=cut

sub from_xml {
    ...
}

1;
