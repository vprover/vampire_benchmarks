(define-fun
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y 0))
(define-funs-rec
  ((u1
    ((x Int) (y Int) (z Int)) Int)
   (v1
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (v1 (- x 1) y z))
   (ite (<= x 0) z (+ (u1 (- x 1) y z) (v1 (- x 1) y z)))))
(define-funs-rec
  ((u0
    ((x Int) (y Int) (z Int)) Int)
   (v0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (v0 (- x 1) y z))
   (ite (<= x 0) z (+ (u0 (- x 1) y z) (v0 (- x 1) y z)))))
(define-fun
  i0
  ((x Int)) Int (ite (<= (mod x 2) 0) 2 0))
(define-fun
  h1
  ((x Int)) Int (div x 2))
(define-fun
  h0
  ((x Int)) Int (div x 2))
(define-fun
  w0
  ((x Int)) Int (u0 (h0 x) (i0 x) 1))
(define-fun
  g2
  ((x Int)) Int (mod x 2))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) 2))
(define-fun
  w1
  ((x Int)) Int (u1 (h1 x) (v2 x) 1))
(define-fun
  f1
  ((x Int) (y Int)) Int y)
(define-fun
  f0
  ((x Int) (y Int)) Int y)
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (w0 c) (w1 c)))))
