%------------------------------------------------------------------------------
% File     : CSR148^1 : TPTP v6.2.0. Released v4.1.0.
% Domain   : Commonsense Reasoning
% Problem  : Is there a year in which Sue liked somebody?
% Version  : Especial * Reduced > Especial.
% English  : What holds that holds at all times. Mary likes Bill. During 2009 
%            Sue liked whoever Mary liked. Is there a year in which Sue liked 
%            somebody?

% Refs     : [PS07]  Pease & Sutcliffe (2007), First Order Reasoning on a L
%          : [BP10]  Benzmueller & Pease (2010), Progress in Automating Hig
%          : [Ben10] Benzmueller (2010), Email to Geoff Sutcliffe
% Source   : [Ben10]
% Names    : paar_4.tq_SUMO_local [Ben10]

% Status   : Theorem
% Rating   : 0.17 v6.2.0, 0.00 v6.1.0, 0.50 v6.0.0, 0.00 v5.4.0, 0.25 v5.3.0, 0.50 v5.1.0, 0.75 v5.0.0, 0.50 v4.1.0
% Syntax   : Number of formulae    :   12 (   5 unit;   8 type;   0 defn)
%            Number of atoms       :   35 (   0 equality;   7 variable)
%            Maximal formula depth :    6 (   4 average)
%            Number of connectives :   18 (   0   ~;   0   |;   0   &;  16    )
%                                         (   0 <=>;   2  =>;   0  <=;   0 <~>)
%                                         (   0  ~|;   0  ~&;   0  !!;   0  ??)
%            Number of type conns  :    5 (   5   >;   0   *;   0   +;   0  <<)
%            Number of symbols     :   11 (   8   :)
%            Number of variables   :    5 (   0 sgn;   3   !;   2   ?;   0   ^)
%                                         (   5   :;   0  !>;   0  ?*)
%                                         (   0   -;   0   +)
% SPC      : TH0_THM_NEQ

% Comments : This is a simple test problem for reasoning in/about SUMO.
%            Initally the problem has been hand generated in KIF syntax in
%            SigmaKEE and then automatically translated by Benzmueller's
%            KIF2TH0 translator into THF syntax.
%          : The translation has been applied in two modes: local and SInE.
%            The local mode only translates the local assumptions and the
%            query. The SInE mode additionally translates the SInE-extract
%            of the loaded knowledge base (usually SUMO).
%          : The examples are selected to illustrate the benefits of
%            higher-order reasoning in ontology reasoning.
%------------------------------------------------------------------------------
%----The extracted Signature
tff(numbers,type,(
    num: $tType )).

tff(holdsDuring_THFTYPE_IiooI,type,(
    holdsDuring_THFTYPE_IiooI: $i * $o > $o )).

tff(lBill_THFTYPE_i,type,(
    lBill_THFTYPE_i: $i )).

tff(lMary_THFTYPE_i,type,(
    lMary_THFTYPE_i: $i )).

tff(lSue_THFTYPE_i,type,(
    lSue_THFTYPE_i: $i )).

tff(lYearFn_THFTYPE_IiiI,type,(
    lYearFn_THFTYPE_IiiI: $i > $i )).

tff(likes_THFTYPE_IiioI,type,(
    likes_THFTYPE_IiioI: $i * $i > $o )).

tff(n2009_THFTYPE_i,type,(
    n2009_THFTYPE_i: $i )).

%----The translated axioms
tff(ax,axiom,
    likes_THFTYPE_IiioI(lMary_THFTYPE_i,lBill_THFTYPE_i)).

tff(ax_001,axiom,
    holdsDuring_THFTYPE_IiooI ( lYearFn_THFTYPE_IiiI(n2009_THFTYPE_i) , ! [X: $i] : ( likes_THFTYPE_IiioI(lMary_THFTYPE_i,X) => likes_THFTYPE_IiioI(lSue_THFTYPE_i,X) ) )).

tff(ax_002,axiom,(
    ! [P: $o,Y: $i] :
      ( P
     => holdsDuring_THFTYPE_IiooI(Y,P) ) )).

%----The translated conjectures
tff(con,conjecture,(
    ? [X: $i,Y: $i] :
      holdsDuring_THFTYPE_IiooI(lYearFn_THFTYPE_IiiI(Y),likes_THFTYPE_IiioI(lSue_THFTYPE_i,X)) )).

%------------------------------------------------------------------------------
