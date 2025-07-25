(define-fun
  v0
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z 0))
(define-fun
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y 2))
(define-fun
  j0
  ((x Int)) Int x)
(define-fun
  i0
  ((x Int)) Int (+ 1 x))
(define-fun
  h0
  ((x Int)) Int (div x 2))
(define-fun
  g1
  ((x Int)) Int (- (+ 2 2) x))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) 0))
(define-fun
  fast
  ((x Int)) Int (ite (<= x 0) 1 (* x (v1 x))))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ y y))
(define-fun-rec
  u0
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))
(define-fun
  w0
  ((x Int)) Int (u0 (h0 x) (i0 x) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (w0 c) (fast c)))))
