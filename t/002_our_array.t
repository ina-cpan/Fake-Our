use 5.00503;
use strict;
BEGIN { $|=1; print "1..4\n"; my $testno=1; sub ok { print $_[0]?'ok ':'not ok ',$testno++,$_[1]?" - $_[1]\n":"\n" }}
use FindBin;
use lib "$FindBin::Bin/../lib";
use Fake::Our;

# avoid: Use of reserved word "our" is deprecated
BEGIN {
    $SIG{__WARN__} = sub {
        if ($_[0] =~ /^Use of reserved word "our" is deprecated at/) {
            # ignore message
        }
        else {
            warn @_;
        }
    }
}

our @var1;
ok((scalar(@var1) == 0), q{our @var1});

our @var2 = (1,2,3);
ok((scalar(@var2) == 3), q{our @var2 = (1,2,3)});

our(@var3);
ok((scalar(@var3) == 0), q{our(@var3)});

our(@var4,@var5);
ok(((scalar(@var4) == 0) and (scalar(@var5) == 0)), q{our(@var4,@var5)});

__END__
