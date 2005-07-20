#: Template/Plugin/POSIX.pm
#: Implementation for the POSIX Plugin module
#: Template-Plugin-POSIX v0.02
#: Copyright (c) 2005 Agent Zhang
#: 2005-07-17 2005-07-20

package Template::Plugin::POSIX;

use strict;
use POSIX ();
use Template::Plugin;
use base qw( Template::Plugin );
use vars qw( $AUTOLOAD );

our $VERSION = '0.01';
*throw = \&Template::Plugin::POSIX::throw;

sub new {
    my ($class, $context, $params) = @_;
    bless {
	    _context => $context,
    }, $class;
}

sub AUTOLOAD {
    my $self = shift;
    my $method = $AUTOLOAD;
    #warn "$method";
    
    $method =~ s/.*:://;
    return if $method eq 'DESTROY';

    #warn "\@_ = @_\n";
    my $sub = \&{"POSIX::$method"};
    unless ($sub) {
        $self->throw("$method not found\n");
    }
    return &$sub(@_);
}

sub throw {
    my $self = shift;
    die (Template::Exception->new('Plugin POSIX', join(', ', @_)));
}

sub pow {
    shift;
    return $_[0] ** $_[1];
}

1;
__END__

=head1 NAME

Template::Plugin::POSIX - Plugin to Import POSIX Functions Provided by Perl

=head1 SYNOPSIS

  [% USE POSIX %]

  [% POSIX.log(100) %]
  [% POSIX.rand(1) %]
  [% POSIX.exp(2) %]
  [% POSIX.sprintf("%.0f", 3.5) %]
  [% POSIX.pow(2, 3) %]
  [% POSIX.ceil(3.8) %]
  [% POSIX.floor(3.8) %]
  [% POSIX.sin(3.14) %]
  [% POSIX.cos(0) %]

=head1 DESCRIPTION

As a TT programmer, I found it quite inflexible to use the Template Toolkit's
presentation language Language due to the very limited vocabulary. So I wrote 
this little plugin in order to open a window for the template file to the full
richness of most POSIX functions, making the Template language a 
"programming language" in a much more serious sense.

Arguments of all POSIX.* functions are passed by values, and returned in 
scalar context, so some functions for list data, like B<map> and B<grep>, 
make little sense in this context.

Please keep in mind I just used AUTOLOAD and Perl's L<POSIX> module to do the
magic here.

If you're looking for smart Perl built-in functions, I suggest you take a 
look at the L<Template::Plugin::Perl> module which exports the excellent 
POSIX repertoire.

=head1 SEE ALSO

L<Template>,
L<POSIX>,
L<Template::Plugin::Perl>

=head1 AUTHOR

Agent Zhang, E<lt>agent2002@126.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (c) 2005 Agent Zhang.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.1 or,
at your option, any later version of Perl 5 you may have available.

=cut
