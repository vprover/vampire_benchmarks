(set-logic UF)

(declare-sort s 0)

(declare-fun inv1 (s) s)
(declare-fun inv2 (s) s)
(declare-fun op1 (s s) s)
(declare-fun op2 (s s) s)

(declare-const e1 s)
(declare-const e2 s)

; Inverse
(assert (forall ((x s)) (= (op1 (inv1 x) x) e1)))
(assert (forall ((x s)) (= (op1 x (inv1 x)) e1)))
; Identity
(assert (forall ((x s)) (= (op1 e1 x) x)))
(assert (forall ((x s)) (= x (op1 e1 x))))
; Associativity
(assert (forall ((x s) (y s) (z s)) (= (op1 x (op1 y z)) (op1 (op1 x y) z))))
; Commutativity
(assert (forall ((x s) (y s)) (= (op1 x y) (op1 y x))))

; Inverse
(assert (forall ((x s)) (=> (distinct x e1) (= (op2 (inv2 x) x) e2))))
(assert (forall ((x s)) (=> (distinct x e1) (= (op2 x (inv2 x)) e2))))
; Identity
(assert (forall ((x s)) (=> (distinct x e1) (= (op2 e2 x) x))))
(assert (forall ((x s)) (=> (distinct x e1) (= x (op2 e2 x)))))
; Associativity
(assert (forall ((x s) (y s) (z s)) (=> (and (distinct x e1) (distinct y e1) (distinct z e1)) (= (op2 x (op2 y z)) (op2 (op2 x y) z)))))
; Commutativity
(assert (forall ((x s) (y s)) (=> (and (distinct x e1) (distinct y e1)) (= (op2 x y) (op2 y x)))))

; Distributivity
(assert (forall ((a s) (b s) (c s) (d s)) (= (op2 a (op1 b c)) (op1 (op2 a b) (op2 a c)))))
(assert (forall ((a s) (b s) (c s) (d s)) (= (op2 (op1 a b) c) (op1 (op2 a c) (op2 b c)))))

; (−a).b = −a.b
(assert-synth ((a s) (b s)) ((z s)) (= (op2 (inv1 a) b) (inv1 z)))
(set-option :uncomputable (inv1))


