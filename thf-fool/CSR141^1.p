%------------------------------------------------------------------------------
% File     : CSR141^1 : TPTP v6.2.0. Released v4.1.0.
% Domain   : Commonsense Reasoning
% Problem  : Reiner and MariaPaola are not connected at the CADE meeting
% Version  : Especial.
% English  : CADE_BM is a Meeting. One agent of this meeting is MariaPaola and
%            one is Reiner. It holds that both agents are not connected during
%            the meeting.

% Refs     : [Ben10] Benzmueller (2010), Email to Geoff Sutcliffe
% Source   : [Ben10]
% Names    : re_1.tq_SUMO_handselected [Ben10]

% Status   : Theorem
% Rating   : 0.17 v6.2.0, 0.00 v6.1.0, 0.50 v6.0.0, 0.00 v5.3.0, 0.25 v5.2.0, 0.50 v4.1.0
% Syntax   : Number of formulae    :   19 (   6 unit;  12 type;   0 defn)
%            Number of atoms       :   68 (   0 equality;  12 variable)
%            Maximal formula depth :    9 (   4 average)
%            Number of connectives :   37 (   0   ~;   0   |;   2   &;  33    )
%                                         (   0 <=>;   2  =>;   0  <=;   0 <~>)
%                                         (   0  ~|;   0  ~&;   0  !!;   0  ??)
%            Number of type conns  :   12 (  12   >;   0   *;   0   +;   0  <<)
%            Number of symbols     :   17 (  12   :)
%            Number of variables   :    5 (   0 sgn;   5   !;   0   ?;   0   ^)
%                                         (   5   :;   0  !>;   0  ?*)
%                                         (   0   -;   0   +)
% SPC      : TH0_THM_NEQ

% Comments : This is a simple test problem for reasoning in/about SUMO.
%            Initally the problem has been hand generated in KIF syntax in
%            SigmaKEE and then automatically translated by Benzmueller's
%            KIF2TH0 translator into THF syntax.
%          : The translation has been applied in three modes: handselected, 
%            SInE, and local. The local mode only translates the local 
%            assumptions and the query. The SInE mode additionally translates 
%            the SInE extract of the loaded knowledge base (usually SUMO). The 
%            handselected mode contains a hand-selected relevant axioms.
%          : The examples are selected to illustrate the benefits of
%            higher-order reasoning in ontology reasoning.
%------------------------------------------------------------------------------
%----The extracted signature
tff(numbers,type,(
    num: $tType )).

tff(agent_THFTYPE_IiioI,type,(
    agent_THFTYPE_IiioI: $i * $i > $o )).

tff(connected_THFTYPE_IiioI,type,(
    connected_THFTYPE_IiioI: $i * $i > $o )).

tff(holdsDuring_THFTYPE_IiooI,type,(
    holdsDuring_THFTYPE_IiooI: $i * $o > $o )).

tff(instance_THFTYPE_IiioI,type,(
    instance_THFTYPE_IiioI: $i * $i > $o )).

tff(lCADE_BM_THFTYPE_i,type,(
    lCADE_BM_THFTYPE_i: $i )).

tff(lMariaPaola_THFTYPE_i,type,(
    lMariaPaola_THFTYPE_i: $i )).

tff(lMeeting_THFTYPE_i,type,(
    lMeeting_THFTYPE_i: $i )).

tff(lReiner_THFTYPE_i,type,(
    lReiner_THFTYPE_i: $i )).

tff(lWhenFn_THFTYPE_IiiI,type,(
    lWhenFn_THFTYPE_IiiI: $i > $i )).

tff(lNear_THFTYPE_i,type,(
    lNear_THFTYPE_i: $i )).

tff(orientation_THFTYPE_IiiioI,type,(
    orientation_THFTYPE_IiiioI: $i * $i * $i > $o )).

%----The translated axioms
tff(ax,axiom,
    agent_THFTYPE_IiioI(lCADE_BM_THFTYPE_i,lReiner_THFTYPE_i)).

tff(ax_001,axiom,
    agent_THFTYPE_IiioI(lCADE_BM_THFTYPE_i,lMariaPaola_THFTYPE_i)).

tff(ax_002,axiom,
    instance_THFTYPE_IiioI(lCADE_BM_THFTYPE_i,lMeeting_THFTYPE_i)).

tff(ax_003,axiom,
    holdsDuring_THFTYPE_IiooI(lWhenFn_THFTYPE_IiiI(lCADE_BM_THFTYPE_i),$true)).

%----The relevant handselected axioms from SUMO
tff(ax_004,axiom,(
    ! [MEET: $i,AGENT2: $i,AGENT1: $i] :
      ( ( instance_THFTYPE_IiioI(MEET,lMeeting_THFTYPE_i)
        & agent_THFTYPE_IiioI(MEET,AGENT1)
        & agent_THFTYPE_IiioI(MEET,AGENT2) )
     => holdsDuring_THFTYPE_IiooI(lWhenFn_THFTYPE_IiiI(MEET),orientation_THFTYPE_IiiioI(AGENT1,AGENT2,lNear_THFTYPE_i)) ) )).

tff(ax_005,axiom,(
    ! [OBJ1: $i,OBJ2: $i] :
      ( orientation_THFTYPE_IiiioI(OBJ1,OBJ2,lNear_THFTYPE_i)
     => ~connected_THFTYPE_IiioI(OBJ1,OBJ2) ) )).

%----The translated conjectures
tff(con,conjecture,
    holdsDuring_THFTYPE_IiooI ( lWhenFn_THFTYPE_IiiI(lCADE_BM_THFTYPE_i) , ~connected_THFTYPE_IiioI(lMariaPaola_THFTYPE_i,lReiner_THFTYPE_i) )).

%------------------------------------------------------------------------------
