(define-fun
  v2
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z 0))
(define-fun
  v1
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z 0))
(define-fun
  u2
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) y (v2 (- x 1) y z)))
(define-fun
  u1
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) y (v1 (- x 1) y z)))
(define-fun
  j2
  ((x Int)) Int (+ 1 x))
(define-fun
  j1
  ((x Int) (y Int)) Int (+ 1 y))
(define-fun
  w1
  ((x Int) (y Int)) Int (u1 x 1 (j1 x y)))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (w1 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(define-fun
  small
  ((x Int)) Int (+ (v0 x) x))
(define-fun
  h2
  ((x Int)) Int (mod x (+ 1 2)))
(define-fun
  w2
  ((x Int)) Int (u2 (h2 x) 1 (j2 x)))
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int (+ x (w2 x)))
(define-fun
  f2
  ((x Int) (y Int)) Int y)
(define-fun
  f1
  ((x Int) (y Int)) Int y)
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
