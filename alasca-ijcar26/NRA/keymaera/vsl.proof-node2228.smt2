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

 KeYmaera example: vsl.proof, node 2228 For more info see: No further information available.
|)
(set-info :category "industrial")
(set-info :status unknown)
(declare-fun t10uscore0dollarskuscore1 () Real)
(declare-fun A () Real)
(declare-fun a1uscore4dollarskuscore1 () Real)
(declare-fun B () Real)
(declare-fun ts2uscore1 () Real)
(declare-fun ep () Real)
(declare-fun v1uscore3dollarskuscore5 () Real)
(declare-fun vsluscore6dollarskuscore5 () Real)
(declare-fun xsluscore6dollarskuscore2 () Real)
(declare-fun x1uscore3dollarskuscore4 () Real)
(assert (not (exists ((ts2uscore1 Real)) (let ((?v_2 (* 2 B)) (?v_1 (* vsluscore6dollarskuscore5 vsluscore6dollarskuscore5)) (?v_0 (+ (* a1uscore4dollarskuscore1 t10uscore0dollarskuscore1) v1uscore3dollarskuscore5))) (=> (and (and (and (and (and (and (and (and (and (and (=> (and (<= 0 ts2uscore1) (<= ts2uscore1 t10uscore0dollarskuscore1)) (and (>= (+ (* a1uscore4dollarskuscore1 ts2uscore1) v1uscore3dollarskuscore5) 0) (<= ts2uscore1 ep))) (>= t10uscore0dollarskuscore1 0)) (<= (- B) a1uscore4dollarskuscore1)) (<= a1uscore4dollarskuscore1 A)) (>= xsluscore6dollarskuscore2 (+ (+ x1uscore3dollarskuscore4 (/ (- (* v1uscore3dollarskuscore5 v1uscore3dollarskuscore5) ?v_1) ?v_2)) (* (+ (/ A B) 1) (+ (* (/ A 2) (* ep ep)) (* ep v1uscore3dollarskuscore5)))))) (>= v1uscore3dollarskuscore5 0)) (>= vsluscore6dollarskuscore5 0)) (<= v1uscore3dollarskuscore5 vsluscore6dollarskuscore5)) (>= A 0)) (> B 0)) (> ep 0)) (or (<= ?v_0 vsluscore6dollarskuscore5) (>= xsluscore6dollarskuscore2 (+ (* (/ 1 2) (+ (+ (* a1uscore4dollarskuscore1 (* t10uscore0dollarskuscore1 t10uscore0dollarskuscore1)) (* (* 2 t10uscore0dollarskuscore1) v1uscore3dollarskuscore5)) (* 2 x1uscore3dollarskuscore4))) (/ (- (* ?v_0 ?v_0) ?v_1) ?v_2)))))))))
(check-sat)
(exit)
