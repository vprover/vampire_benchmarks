(set-info :smt-lib-version 2.6)
(set-logic UFLRA)

(declare-const a Real)
(declare-const delta Real)
(declare-fun ab (Real) Real)
(declare-fun ff (Real) Real)
(declare-fun gg (Real) Real)
(declare-fun skx (Real) Real)
(declare-const c Real)

(declare-fun h (Real) Real)

; |x| = if x >= 0 { x } else { -x }
(assert (forall ((x Real)) (= (ab x) (ite (>= x 0) x (- x)))))

; |2 skx(x)| > delta
(assert (forall ((x Real)) (> (ab (h (skx x))) delta) ))

; | ff(skx(x)) + gg(skx(x)) | >= 2 c
(assert (forall ((x Real)) (>= (ab (+ (ff (skx x)) (gg (skx x)))) (* 2.0 c)) ))

; ==========================

; |2 x| > delta -> | ff(x) | < c
(assert (forall ((x Real)) (=> (> (ab (h x)) delta) (< (ab (ff x)) c))  ))
; |2 x| > delta -> | gg(x) | < c
(assert (forall ((x Real)) (=> (> (ab (h x)) delta) (< (ab (gg x)) c))  ))
