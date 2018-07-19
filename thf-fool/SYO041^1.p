%------------------------------------------------------------------------------
% File     : SYO041^1 : TPTP v6.2.0. Released v4.0.0.
% Domain   : Syntactic
% Problem  : Unsatisfiable basic formula 3
% Version  : Especial.
% English  : 

% Refs     : [BS09a] Brown E. & Smolka (2009), Terminating Tableaux for the
%          : [BS09b] Brown E. & Smolka (2009), Extended First-Order Logic
% Source   : [BS09a]
% Names    : 

% Status   : Unsatisfiable
% Rating   : 0.00 v5.4.0, 0.33 v5.3.0, 0.67 v4.1.0, 1.00 v4.0.0
% Syntax   : Number of formulae    :    6 (   3 unit;   5 type;   0 defn)
%            Number of atoms       :   26 (   4 equality;   0 variable)
%            Maximal formula depth :    8 (   3 average)
%            Number of connectives :   11 (   1   ~;   0   |;   3   &;   7    )
%                                         (   0 <=>;   0  =>;   0  <=;   0 <~>)
%                                         (   0  ~|;   0  ~&;   0  !!;   0  ??)
%            Number of type conns  :    2 (   2   >;   0   *;   0   +;   0  <<)
%            Number of symbols     :    6 (   5   :)
%            Number of variables   :    0 (   0 sgn;   0   !;   0   ?;   0   ^)
%                                         (   0   :;   0  !>;   0  ?*)
%                                         (   0   -;   0   +)
% SPC      : TH0_UNS_EQU

% Comments : The fragment of simple type theory that restricts equations to 
%            base types and disallows lambda abstraction and quantification is
%            decidable. This is an example.
%------------------------------------------------------------------------------
tff(a,type,(
    a: $o )).

tff(f,type,(
    f: $o > $o )).

tff(g,type,(
    g: $o > $o )).

tff(x,type,(
    x: $o )).

tff(y,type,(
    y: $o )).

tff(3,axiom,
    ( ( x != y )
    & ( g(x)
      = y )
    & ( g(y)
      = x )
    & ( f(f(f(x)))
      = g(f(x)) ) )).

%------------------------------------------------------------------------------
