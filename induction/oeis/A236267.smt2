(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (+ (u0 (- x 1) y) x)))
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int (* 2 (+ x x)))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) x))
(define-fun
  small
  ((x Int)) Int (+ 1 (v0 x)))
(define-fun
  fast
  ((x Int)) Int (+ 1 (+ (* 2 (+ (* 2 (* 2 (* x x))) x)) x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
