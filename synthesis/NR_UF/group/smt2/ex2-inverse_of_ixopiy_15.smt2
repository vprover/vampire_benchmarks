(set-logic UF)

(declare-sort s 0)

(declare-fun inv (s) s)
(declare-fun op (s s) s)

(declare-const e s)

; Left inverse
(assert (forall ((x s)) (= (op (inv x) x) e)))
; Left identity
(assert (forall ((x s)) (= (op e x) x)))
; Associativity
(assert (forall ((x s) (y s) (z s)) (= (op x (op y z)) (op (op x y) z))))

; Conjecture: inverse of products equals the product of the inverse, in opposite order

(assert-synth ((x0 s) (x1 s) (x2 s) (x3 s) (x4 s) (x5 s) (x6 s) (x7 s) (x8 s) (x9 s) (x10 s) (x11 s) (x12 s) (x13 s) (x14 s)) ((z s))
    (= (op z (op (op (op (op (op (op (op (op (op (op( op (op (op ( op (inv x0) (inv x1))
     (inv x2)) (inv x3)) (inv x4)) (inv x5)) (inv x6)) (inv x7)) (inv x8)) (inv x9)) (inv x10)) (inv x11)) (inv x12)) (inv x13)) (inv x14))) e))

(set-option :uncomputable (inv))


