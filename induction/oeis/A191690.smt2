(define-fun-rec
  v1
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v1 (- x 1) y z)))
(define-fun-rec
  v0
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v0 (- x 1) y z)))
(define-fun
  j1
  ((x Int)) Int (+ 1 x))
(define-fun
  j0
  ((x Int)) Int x)
(define-fun
  i0
  ((x Int)) Int x)
(define-fun
  h1
  ((x Int)) Int (- x 1))
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int) (y Int)) Int y)
(define-fun
  g0
  ((x Int) (y Int)) Int y)
(define-fun
  f1
  ((x Int) (y Int)) Int (+ 1 (* x y)))
(define-fun-rec
  u1
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z))))
(define-fun
  w1
  ((x Int)) Int (u1 (h1 x) 1 (j1 x)))
(define-fun
  fast
  ((x Int)) Int
  (+ (* (w1 x) (* (- (ite (<= x 0) 1 x) 1) (+ 1 x))) x))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (- (* x y) 1) x))
(define-fun-rec
  u0
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))
(define-fun
  w0
  ((x Int)) Int (u0 x x x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (w0 c) (fast c)))))
