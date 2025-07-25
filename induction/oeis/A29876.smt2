(define-fun-rec
  v0
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v0 (- x 1) y z)))
(define-fun
  small
  ((x Int)) Int (+ (ite (<= (- x 2) 0) 1 (- (* (+ 2 x) x) 1)) x))
(define-fun
  j0
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int (- x 2))
(define-fun
  g0
  ((x Int) (y Int)) Int y)
(define-fun
  f0
  ((x Int) (y Int)) Int (* (+ 2 y) y))
(define-fun-rec
  u0
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))
(define-fun
  w0
  ((x Int)) Int (u0 (h0 x) 2 x))
(define-fun
  fast
  ((x Int)) Int (+ (- (w0 x) 1) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
