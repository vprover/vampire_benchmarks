(define-fun-rec
  v0
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v0 (- x 1) y z)))
(define-fun
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y 1))
(define-fun
  j0
  ((x Int)) Int (- x 1))
(define-fun
  h1
  () Int (+ 2 2))
(define-fun
  h0
  () Int (+ 1 2))
(define-fun
  g1
  ((x Int)) Int (mod x (+ 2 2)))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) h1))
(define-fun
  g0
  ((x Int) (y Int)) Int y)
(define-fun
  fast
  ((x Int)) Int (+ (mod (+ 1 (+ 2 (+ 2 (+ 2 x)))) (* (v1 x) 2)) 1))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ 1 (mod y (+ x x))))
(define-fun-rec
  u0
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))
(define-fun
  w0
  ((x Int)) Int (u0 h0 1 (j0 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (w0 c) (fast c)))))
