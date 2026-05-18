(set-info :smt-lib-version 2.6)
(set-logic UFLRA)

(declare-fun ab (Real) Real)
(declare-const a Real)
(declare-const b Real)
(declare-const c Real)

(assert (forall ((x Real)) (= (ab x) (ite (>= x 0) x (- x)))))



; | a + b | >= 2 c
(assert (>= (ab (+ a b)) (* 2.0 c)))

; ==========================

; | a | < c
(assert (< (ab a) c))

; | b | < c
(assert (< (ab b) c))
