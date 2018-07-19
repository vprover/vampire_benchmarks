%------------------------------------------------------------------------------
% File     : NUM761^1 : TPTP v6.2.0. Released v3.7.0.
% Domain   : Number Theory
% Problem  : Landau theorem 65a
% Version  : Especial.
% English  : moref (pf x z) (pf y u)

% Refs     : [Lan30] Landau (1930), Grundlagen der Analysis
%          : [vBJ79] van Benthem Jutting (1979), Checking Landau's "Grundla
%          : [Bro09] Brown (2009), Email to Geoff Sutcliffe
% Source   : [Bro09]
% Names    : satz65a [Lan30]
%          : satz75a [Lan30]

% Status   : Theorem
%          : Without extensionality : Theorem
% Rating   : 0.17 v6.2.0, 0.00 v6.1.0, 0.17 v6.0.0, 0.00 v5.3.0, 0.25 v5.2.0, 0.00 v5.1.0, 0.25 v5.0.0, 0.00 v3.7.0
% Syntax   : Number of formulae    :   14 (   5 unit;   8 type;   0 defn)
%            Number of atoms       :   58 (   0 equality;  18 variable)
%            Maximal formula depth :   11 (   4 average)
%            Number of connectives :   41 (   3   ~;   0   |;   0   &;  32    )
%                                         (   0 <=>;   6  =>;   0  <=;   0 <~>)
%                                         (   0  ~|;   0  ~&;   0  !!;   0  ??)
%            Number of type conns  :    6 (   6   >;   0   *;   0   +;   0  <<)
%            Number of symbols     :   11 (   8   :)
%            Number of variables   :    9 (   0 sgn;   9   !;   0   ?;   0   ^)
%                                         (   9   :;   0  !>;   0  ?*)
%                                         (   0   -;   0   +)
% SPC      : TH0_THM_NEQ

% Comments : 
%------------------------------------------------------------------------------
tff(frac_type,type,(
    frac: $tType )).

tff(x,type,(
    x: frac )).

tff(y,type,(
    y: frac )).

tff(z,type,(
    z: frac )).

tff(u,type,(
    u: frac )).

tff(moref,type,(
    moref: frac * frac > $o )).

tff(eq,type,(
    eq: frac * frac > $o )).

tff(m,axiom,
    ( ~ moref(x,y)
   => eq(x,y) )).

tff(n,axiom,
    moref(z,u)).

tff(pf,type,(
    pf: frac * frac > frac )).

tff(et,axiom,(
    ! [Xa: $o] :
      ( ~ ( ~ ( Xa ) )
     => Xa ) )).

tff(satz62g,axiom,(
    ! [Xx: frac,Xy: frac,Xz: frac,Xu: frac] :
      ( eq(Xx,Xy)
     => ( moref(Xz,Xu)
       => moref(pf(Xx,Xz),pf(Xy,Xu)) ) ) )).

tff(satz64,axiom,(
    ! [Xx: frac,Xy: frac,Xz: frac,Xu: frac] :
      ( moref(Xx,Xy)
     => ( moref(Xz,Xu)
       => moref(pf(Xx,Xz),pf(Xy,Xu)) ) ) )).

tff(satz65a,conjecture,
    moref(pf(x,z),pf(y,u))).

%------------------------------------------------------------------------------
