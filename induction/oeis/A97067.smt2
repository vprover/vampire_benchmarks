(define-fun
  j0
  ((x Int)) Int x)
(define-fun
  h1
  ((x Int)) Int (- x 1))
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int)) Int (- x 2))
(define-fun
  g0
  ((x Int) (y Int)) Int (+ (- y 1) y))
(define-funs-rec
  ((v0
    ((x Int) (y Int) (z Int)) Int)
   (u0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) y (v0 (- x 1) y z))))
(define-fun
  w0
  ((x Int)) Int (u0 x 2 x))
(define-fun
  small
  ((x Int)) Int (div (w0 x) 2))
(define-fun
  f1
  ((x Int)) Int (+ x x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) (h1 x)))
(define-fun
  fast
  ((x Int)) Int (ite (<= x 0) 1 (v1 x)))
(define-fun
  f0
  ((x Int) (y Int)) Int y)
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
