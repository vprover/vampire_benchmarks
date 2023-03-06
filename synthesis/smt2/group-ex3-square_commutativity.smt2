(set-logic UF)

(declare-sort s 0)

(declare-fun inv (s) s)
(declare-fun op (s s) s)

(declare-const e s)

; Left inverse
(assert (forall ((x s)) (= (op (inv x) x) e)))
; Left identity
(assert (forall ((x s)) (= (op e x) x)))
; Right identity
(assert (forall ((x s)) (= (op x e) x)))
; Associativity
(assert (forall ((x s) (y s) (z s)) (= (op x (op y z)) (op (op x y) z))))
; NOTE: original problem also had the symmetric axioms

; Conjecture as a synthesis problem: if a group is not commutative, there exists an element A such that (op A A)!=e
(assert-not (forall ((x s) (y s)) (exists ((z s)) (=> (not (= (op x y) (op y x))) (not (= (op z z) e))))))

(set-option :uncomputable (e))

(check-sat)
