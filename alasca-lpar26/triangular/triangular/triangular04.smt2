(set-info :smt-lib-version 2.6)
(set-logic UFLRA)

(declare-fun ab (Real) Real)
(declare-fun ff (Real) Real)
(declare-fun gg (Real) Real)
(declare-fun skx (Real) Real)
(declare-const c Real)

(assert (forall ((x Real)) (= (ab x) (ite (>= x 0) x (- x)))))

; | ff(skx(x)) + gg(skx(x)) | >= 2 c
(assert (forall ((x Real)) (>= (ab (+ (ff (skx x)) (gg (skx x)))) (* 2.0 c)) ))

; ==========================

; | ff(x) | < c
(assert (forall ((x Real)) (< (ab (ff x)) c)) )
; | gg(x) | < c
(assert (forall ((x Real)) (< (ab (gg x)) c)) )
