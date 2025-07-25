(define-fun
  i1
  ((x Int)) Int (div x 2))
(define-fun
  i0
  ((x Int)) Int x)
(define-fun
  h1
  () Int (+ 1 (+ 2 2)))
(define-fun
  h0
  ((x Int)) Int (+ x x))
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f1
  ((x Int) (y Int)) Int (div (- y x) 2))
(define-funs-rec
  ((u1
    ((x Int) (y Int) (z Int)) Int)
   (v1
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z)))
   (ite (<= x 0) z (u1 (- x 1) y z))))
(define-fun
  w1
  ((x Int)) Int (u1 h1 (i1 x) 0))
(define-fun
  fast
  ((x Int)) Int (+ (+ (div (+ (w1 x) x) 2) 1) x))
(define-fun
  f0
  ((x Int) (y Int)) Int (div (- y x) 2))
(define-funs-rec
  ((u0
    ((x Int) (y Int) (z Int)) Int)
   (v0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) z (u0 (- x 1) y z))))
(define-fun
  w0
  ((x Int)) Int (u0 (h0 x) x 0))
(define-fun
  small
  ((x Int)) Int (+ (+ (div (w0 x) 2) 1) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
