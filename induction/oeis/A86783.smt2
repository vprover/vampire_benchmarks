(define-fun-rec
  v1
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v1 (- x 1) y z)))
(define-fun-rec
  u1
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u1 (- x 1) y z) (v1 (- x 1) y z))))
(define-fun
  j1
  ((x Int)) Int (+ 1 x))
(define-fun
  j0
  ((x Int)) Int (+ 1 x))
(define-fun
  i0
  ((x Int)) Int (+ 1 x))
(define-fun
  h1
  ((x Int)) Int (- x 1))
(define-fun
  w1
  ((x Int)) Int (u1 (h1 x) 1 (j1 x)))
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int)) Int (div x 2))
(define-fun
  g1
  ((x Int) (y Int)) Int y)
(define-fun
  g0
  ((x Int) (y Int)) Int (- 0 y))
(define-funs-rec
  ((v0
    ((x Int) (y Int) (z Int)) Int)
   (u0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) y (* (u0 (- x 1) y z) (v0 (- x 1) y z)))))
(define-fun
  w0
  ((x Int)) Int (u0 x (i0 x) (j0 x)))
(define-fun
  f2
  ((x Int)) Int (- 0 x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) 1))
(define-fun
  fast
  ((x Int)) Int (* (w1 x) (* (+ (* (+ 2 x) x) 1) (v2 x))))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (w0 c) (fast c)))))
