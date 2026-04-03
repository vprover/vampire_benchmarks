(set-info :smt-lib-version 2.6)
(set-logic NRA)
(set-info :source |
These benchmarks used in the paper:

  Dejan Jovanovic and Leonardo de Moura.  Solving Non-Linear Arithmetic.
  In IJCAR 2012, published as LNCS volume 7364, pp. 339--354.

The keymaera family contains VCs from Keymaera verification, see:

  A. Platzer, J.-D. Quesel, and P. Rummer.  Real world verification.
  In CADE 2009, pages 485-501. Springer, 2009.

Submitted by Dejan Jovanovic for SMT-LIB.

 KeYmaera example: safety-lemma, node 9082 For more info see: @see "Andre Platzer and Jan-David Quesel. European Train Control System: A case study in formal verification. In Karin Breitman and Ana Cavalcanti, editors, 11th International Conference on Formal Engineering Methods, ICFEM, Rio de Janeiro, Brasil, Proceedings, volume 5885 of LNCS, pages 246-265. Springer, 2009."
|)
(set-info :category "industrial")
(set-info :status unsat)
(declare-fun duscore2dollarskuscore2 () Real)
(declare-fun d () Real)
(declare-fun b () Real)
(declare-fun A () Real)
(declare-fun vuscore2dollarskuscore2 () Real)
(declare-fun ts3uscore0 () Real)
(declare-fun vdesuscore2dollarskuscore1 () Real)
(declare-fun stateuscore2dollarskuscore1 () Real)
(declare-fun m () Real)
(declare-fun auscore2dollarskuscore1 () Real)
(declare-fun v () Real)
(declare-fun ep () Real)
(declare-fun muscore2dollarskuscore2 () Real)
(declare-fun z () Real)
(declare-fun zuscore2dollarskuscore2 () Real)
(declare-fun t3uscore0dollarskuscore0 () Real)
(assert (not (exists ((ts3uscore0 Real)) (let ((?v_0 (* 2 b)) (?v_1 (- muscore2dollarskuscore2 zuscore2dollarskuscore2)) (?v_4 (* duscore2dollarskuscore2 duscore2dollarskuscore2))) (let ((?v_2 (- (* vuscore2dollarskuscore2 vuscore2dollarskuscore2) ?v_4)) (?v_3 (+ (* auscore2dollarskuscore1 t3uscore0dollarskuscore0) vuscore2dollarskuscore2))) (=> (and (and (and (and (and (and (and (and (and (and (and (=> (and (<= 0 ts3uscore0) (<= ts3uscore0 t3uscore0dollarskuscore0)) (and (>= (+ (* auscore2dollarskuscore1 ts3uscore0) vuscore2dollarskuscore2) 0) (<= ts3uscore0 ep))) (>= t3uscore0dollarskuscore0 0)) (>= auscore2dollarskuscore1 (- b))) (<= auscore2dollarskuscore1 A)) (<= vuscore2dollarskuscore2 vdesuscore2dollarskuscore1)) (<= ?v_2 (* ?v_0 ?v_1))) (>= duscore2dollarskuscore2 0)) (<= (- (* v v) (* d d)) (* ?v_0 (- m z)))) (>= d 0)) (> b 0)) (>= A 0)) (>= ep 0)) (or (or (<= ?v_1 (+ (/ ?v_2 ?v_0) (* (+ (/ A b) 1) (+ (* (/ A 2) (* ep ep)) (* ep vuscore2dollarskuscore2))))) (= stateuscore2dollarskuscore1 1)) (<= (- (* ?v_3 ?v_3) ?v_4) (* ?v_0 (- muscore2dollarskuscore2 (* (/ 1 2) (+ (+ (* auscore2dollarskuscore1 (* t3uscore0dollarskuscore0 t3uscore0dollarskuscore0)) (* (* 2 t3uscore0dollarskuscore0) vuscore2dollarskuscore2)) (* 2 zuscore2dollarskuscore2)))))))))))))
(check-sat)
(exit)
