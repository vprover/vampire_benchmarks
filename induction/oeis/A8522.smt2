(define-fun
  j0
  ((x Int)) Int x)
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int (div x 2))
(define-fun
  g1
  () Int (+ 1 2))
(define-fun
  g0
  () Int (+ 2 2))
(define-fun
  v0
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z g0))
(define-fun
  f1
  ((x Int)) Int (+ (ite (<= (- (- x 1) 2) 0) (div x 2) 2) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 g1 x))
(define-fun
  fast
  ((x Int)) Int (+ (v1 x) 2))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ 2 y))
(define-fun-rec
  u0
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))
(define-fun
  w0
  ((x Int)) Int (u0 (h0 x) 0 x))
(define-fun
  small
  ((x Int)) Int (+ (+ 2 (w0 x)) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
