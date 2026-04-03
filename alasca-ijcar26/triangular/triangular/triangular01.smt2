(set-info :smt-lib-version 2.6)
(set-logic UFLRA)

(declare-fun ab (Real) Real)
(declare-const a Real)
(declare-const b Real)

(assert (forall ((x Real)) (= (ab x) (ite (>= x 0) x (- x)))))


; | a + b | > 0
(assert (> (ab (+ a b)) 0))

; ==========================

; |a| + |b| > 0
(assert (not (> (+ (ab a) (ab b)) 0)))
