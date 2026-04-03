(set-info :smt-lib-version 2.6)
(set-logic UFLRA)

(declare-fun ab (Real) Real)
(declare-const a Real)
(declare-const b Real)
(declare-const c Real)

(assert (forall ((x Real)) (= (ab x) (ite (>= x 0) x (- x)))))


; | a + b | > c
(assert (> (ab (+ a b)) c))

; ==========================

; |a| + |b| > c
(assert (not (> (+ (ab a) (ab b)) c)))
