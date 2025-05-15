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

; Conjecture: right inverse

(assert-synth ((x0 s) (x1 s) (x2 s) (x3 s) (x4 s) (x5 s) (x6 s) (x7 s) (x8 s) (x9 s) (x10 s) (x11 s) (x12 s) (x13 s) (x14 s)) 
              ((y s))
                (= (op( op( op( op( op( op( op (op (op (op (op (op (op (op (op x0 x1) x2) x3) x4) x5) x6) x7) x8) x9) x10) x11) x12) x13) x14) y) e))
