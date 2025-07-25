(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u2 (- x 1) y) x)))
(define-fun
  v2
  ((x Int)) Int (u2 x 1))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u0 (- x 1) y) x)))
(define-fun
  j1
  ((x Int)) Int (+ 1 x))
(define-fun
  h1
  ((x Int)) Int (+ (+ x x) x))
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int) (y Int)) Int (+ 2 y))
(define-fun
  g0
  ((x Int)) Int (+ (* 2 (+ (+ x x) x)) x))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 1))
(define-fun
  f1
  ((x Int) (y Int)) Int (* (+ (* y y) y) x))
(define-funs-rec
  ((u1
    ((x Int) (y Int) (z Int)) Int)
   (v1
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z)))
   (ite (<= x 0) z (g1 (u1 (- x 1) y z) (v1 (- x 1) y z)))))
(define-fun
  w1
  ((x Int)) Int (u1 (h1 x) 1 (j1 x)))
(define-fun
  fast
  ((x Int)) Int (* (w1 x) (v2 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
