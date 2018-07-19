%------------------------------------------------------------------------------
% File     : SYN988^1 : TPTP v6.2.0. Released v3.7.0.
% Domain   : Syntactic
% Problem  : All things are false
% Version  : Especial.
% English  :

% Refs     : [Kos97] Kossey (1997), A Note on the Completeness of Higher Or
%          : [Kos08] Kossey (2008), Email to Geoff Sutcliffe
% Source   : [Kos08]
% Names    :

% Status   : CounterSatisfiable
% Rating   : 0.00 v3.7.0
% Syntax   : Number of formulae    :    1 (   1 unit;   0 type;   0 defn)
%            Number of atoms       :    1 (   0 equality;   1 variable)
%            Maximal formula depth :    3 (   3 average)
%            Number of connectives :    1 (   1   ~;   0   |;   0   &;   0    )
%                                         (   0 <=>;   0  =>;   0  <=;   0 <~>)
%                                         (   0  ~|;   0  ~&;   0  !!;   0  ??)
%            Number of type conns  :    0 (   0   >;   0   *;   0   +;   0  <<)
%            Number of symbols     :    2 (   0   :)
%            Number of variables   :    1 (   0 sgn;   1   !;   0   ?;   0   ^)
%                                         (   1   :;   0  !>;   0  ?*)
%                                         (   0   -;   0   +)
% SPC      : TH0_CSA_NEQ

% Comments : 
%------------------------------------------------------------------------------
tff(thm,conjecture,(
    ! [X: $o] : ~ ( X ) )).

%------------------------------------------------------------------------------
