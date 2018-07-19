%------------------------------------------------------------------------------
% File     : SYO040^1 : TPTP v6.2.0. Released v4.0.0.
% Domain   : Syntactic
% Problem  : Unsatisfiable basic formula 2
% Version  : Especial.
% English  : 

% Refs     : [BS09a] Brown E. & Smolka (2009), Terminating Tableaux for the
%          : [BS09b] Brown E. & Smolka (2009), Extended First-Order Logic
% Source   : [BS09a]
% Names    : 

% Status   : Unsatisfiable
% Rating   : 0.00 v6.0.0, 0.33 v5.3.0, 0.67 v5.0.0, 0.33 v4.1.0, 0.67 v4.0.1, 1.00 v4.0.0
% Syntax   : Number of formulae    :    4 (   1 unit;   3 type;   0 defn)
%            Number of atoms       :   14 (   1 equality;   0 variable)
%            Maximal formula depth :    7 (   4 average)
%            Number of connectives :    7 (   1   ~;   0   |;   0   &;   6    )
%                                         (   0 <=>;   0  =>;   0  <=;   0 <~>)
%                                         (   0  ~|;   0  ~&;   0  !!;   0  ??)
%            Number of type conns  :    2 (   2   >;   0   *;   0   +;   0  <<)
%            Number of symbols     :    5 (   3   :)
%            Number of variables   :    0 (   0 sgn;   0   !;   0   ?;   0   ^)
%                                         (   0   :;   0  !>;   0  ?*)
%                                         (   0   -;   0   +)
% SPC      : TH0_UNS_EQU

% Comments : The fragment of simple type theory that restricts equations to 
%            base types and disallows lambda abstraction and quantification is
%            decidable. This is an example.
%------------------------------------------------------------------------------
tff(f,type,(
    f: $o > $o )).

tff(h,type,(
    h: $o > $i )).

tff(x,type,(
    x: $o )).

tff(2,axiom,(
    h(f(f(f(x))))
 != h(f(x)) )).

%------------------------------------------------------------------------------
