(define-fun
  j1
  () Int (- 0 1))
(define-fun
  h2
  () Int (+ 2 2))
(define-fun
  h1
  ((x Int)) Int x)
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
  f2
  ((x Int)) Int (* (+ 2 x) (* x x)))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  () Int (u2 1 h2))
(define-fun
  f1
  ((x Int) (y Int)) Int (- (* (+ 2 v2) x) y))
(define-funs-rec
  ((u1
    ((x Int) (y Int) (z Int)) Int)
   (v1
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z)))
   (ite (<= x 0) z (u1 (- x 1) y z))))
(define-fun
  w1
  ((x Int)) Int (u1 x 1 j1))
(define-fun
  f0
  ((x Int) (y Int)) Int (- (* 2 (+ (* 2 (+ x x)) x)) y))
(define-funs-rec
  ((u0
    ((x Int) (y Int) (z Int)) Int)
   (v0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) z (u0 (- x 1) y z))))
(define-fun
  w0
  ((x Int)) Int (u0 (h0 x) 1 0))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (w0 c) (w1 c)))))
