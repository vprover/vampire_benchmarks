(define-fun
  j1
  ((x Int)) Int (+ 1 (mod x 2)))
(define-fun
  j0
  ((x Int)) Int (mod x 2))
(define-fun
  i1
  ((x Int)) Int (- 1 (mod x 2)))
(define-fun
  i0
  ((x Int)) Int (- 1 (mod x 2)))
(define-fun
  h1
  ((x Int)) Int (div x 2))
(define-fun
  h0
  ((x Int)) Int (div x 2))
(define-fun
  g1
  ((x Int) (y Int)) Int (+ (+ x y) y))
(define-funs-rec
  ((v1
    ((x Int) (y Int) (z Int)) Int)
   (u1
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g1 (u1 (- x 1) y z) (v1 (- x 1) y z)))
   (ite (<= x 0) y (v1 (- x 1) y z))))
(define-fun
  w1
  ((x Int)) Int (u1 (h1 x) (i1 x) (j1 x)))
(define-fun
  f1
  ((x Int) (y Int)) Int y)
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (+ x y) y))
(define-funs-rec
  ((u0
    ((x Int) (y Int) (z Int)) Int)
   (v0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) z (+ (u0 (- x 1) y z) (v0 (- x 1) y z)))))
(define-fun
  w0
  ((x Int)) Int (u0 (h0 x) (i0 x) (j0 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (w0 c) (w1 c)))))
