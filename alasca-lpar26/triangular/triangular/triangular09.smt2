(set-info :smt-lib-version 2.6)
(set-logic UFLRA)

(declare-const a Real)
(declare-const delta Real)
(declare-fun ab (Real) Real)
(declare-fun ff (Real) Real)
(declare-fun gg (Real) Real)
(declare-fun skx (Real) Real)
(declare-const c Real)

; |x| = if x >= 0 { x } else { -x }
(assert (forall ((x Real)) (= (ab x) (ite (>= x 0) x (- x)))))

; |skx(x) + 1| > delta
(assert (forall ((x Real)) (> (ab (+ (skx x) 1)) delta) ))

; | ff(skx(x)) + gg(skx(x)) | >= 2 c
(assert (forall ((x Real)) (>= (ab (+ (ff (skx x)) (gg (skx x)))) (* 2.0 c)) ))

; ==========================

; |x + 1| > delta -> | ff(x) | < c
(assert (forall ((x Real)) (=> (> (ab (+ x 1)) delta) (< (ab (ff x)) c))  ))
; |x + 1| > delta -> | gg(x) | < c
(assert (forall ((x Real)) (=> (> (ab (+ x 1)) delta) (< (ab (gg x)) c))  ))
