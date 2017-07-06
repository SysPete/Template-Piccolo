package Template::Piccolo::Types;

=head1 NAME

Template::Piccolo::Types - Type::Tiny types for Template::Piccolo

=head1 DESCRIPTION

Extends L<Types::Standard> with extra L<Template::Piccolo> type constraints.

=cut

use strict;
use warnings;

use Sub::Quote qw/quote_sub/;
use Type::Library -base;
use Type::Utils -all;

BEGIN { extends "Types::Standard", "Types::Common::String" }

=head1 TYPES

=head2 HtmlParser

An instance of L<Template::Flute::HTML>.

=head2 Specification

An instance of L<Template::Flute::Specification>.

=head2 URI

An instance of L<URI>.

=cut

declare 'Container',
  as InstanceOf ['Template::Flute::Container'];

declare 'Form',
  as InstanceOf ['Template::Piccolo::Form'];

declare 'HtmlParser',
  as InstanceOf ['Template::Piccolo::HTML'];

declare 'Iterator',
  as InstanceOf ['Template::Piccolo::Iterator'];

declare 'List',
  as InstanceOf ['Template::Piccolo::List'];

declare 'Param',
  as InstanceOf ['Template::Piccolo::Param'];

declare 'ReadableFilePath',
  constraint => quote_sub q{ -e $_ && -r $_ };

declare 'Specification',
  as InstanceOf ['Template::Piccolo::Specification'];

declare 'URI',
  as InstanceOf ['URI'];

1;
