%------------------------------------------------------------------------------
% File     : SYO500^1.004 : TPTP v6.2.0. Released v4.1.0.
% Domain   : Syntactic
% Problem  : Four function variant of the Kaminski equation
% Version  : Especial.
% English  :

% Refs     : [Bro09] Brown E. (2009), Email to Geoff Sutcliffe
%          : [Hoe09] Hoeschele (2009), Towards a Semi-Automatic Higher-Orde
% Source   : [Bro09]
% Names    : basic12 [Bro09]

% Status   : Theorem
% Rating   : 0.57 v5.5.0, 0.50 v5.4.0, 0.80 v4.1.0
% Syntax   : Number of formulae    :    6 (   1 unit;   5 type;   0 defn)
%            Number of atoms       :   28 (   1 equality;   0 variable)
%            Maximal formula depth :   10 (   4 average)
%            Number of connectives :   16 (   0   ~;   0   |;   0   &;  16    )
%                                         (   0 <=>;   0  =>;   0  <=;   0 <~>)
%                                         (   0  ~|;   0  ~&;   0  !!;   0  ??)
%            Number of type conns  :    4 (   4   >;   0   *;   0   +;   0  <<)
%            Number of symbols     :    6 (   5   :)
%            Number of variables   :    0 (   0 sgn;   0   !;   0   ?;   0   ^)
%                                         (   0   :;   0  !>;   0  ?*)
%                                         (   0   -;   0   +)
% SPC      : TH0_THM_EQU

% Comments : 
%------------------------------------------------------------------------------
tff(x,type,(
    x: $o )).

tff(f0,type,(
    f0: $o > $o )).

tff(f1,type,(
    f1: $o > $o )).

tff(f2,type,(
    f2: $o > $o )).

tff(f3,type,(
    f3: $o > $o )).

tff(kaminski4,conjecture,
    ( f0(f0(f0(f1(f2(f2(f2(f3(x))))))))
    = f0(f1(f1(f1(f2(f3(f3(f3(x)))))))) )).

%------------------------------------------------------------------------------
