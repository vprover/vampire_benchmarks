(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (u2 (- x 1) y)))
(define-fun
  j1
  ((x Int)) Int x)
(define-fun
  j0
  ((x Int)) Int x)
(define-fun
  h2
  () Int (+ (* 2 2) 1))
(define-fun
  v2
  () Int (u2 1 h2))
(define-fun
  h0
  () Int (+ 2 (* 2 (+ 2 2))))
(define-fun
  g1
  ((x Int) (y Int)) Int (+ 2 y))
(define-fun
  g0
  ((x Int) (y Int)) Int (+ 1 y))
(define-fun
  f2
  ((x Int)) Int x)
(define-fun
  f1
  ((x Int) (y Int)) Int (* (+ 1 y) (* (+ 2 y) x)))
(define-funs-rec
  ((u1
    ((x Int) (y Int) (z Int)) Int)
   (v1
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z)))
   (ite (<= x 0) z (g1 (u1 (- x 1) y z) (v1 (- x 1) y z)))))
(define-fun
  w1
  ((x Int)) Int (u1 v2 1 x))
(define-fun
  fast
  ((x Int)) Int (- (w1 x) 1))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (* x y) x))
(define-funs-rec
  ((u0
    ((x Int) (y Int) (z Int)) Int)
   (v0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z)))))
(define-fun
  w0
  ((x Int)) Int (u0 h0 1 x))
(define-fun
  small
  ((x Int)) Int (- (w0 x) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
