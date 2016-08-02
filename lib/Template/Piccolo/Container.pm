package Template::Piccolo::Container;

=head1 NAME

Template::Piccolo::Container

=cut

use Template::Piccolo::Types -types;
use Type::Params qw/compile/;
use Type::Utils;

use Moo;
with 'Template::Piccolo::Role::Core';
use namespace::clean;
use MooX::StrictConstructor;

=head1 ATTRIBUTES

=head2 parent

Every container must have a parent object which could be either a
L<Template::Piccolo::Specification> or a L<Template::Piccolo::List>.

=cut

has parent => (
    is       => 'ro',
    isa      => List | Specification,
    required => 1,
    weak_ref => 1,
);

=head2 
1;
