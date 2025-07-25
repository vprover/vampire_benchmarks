(define-fun
  v1
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z 2))
(define-fun
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y x))
(define-fun
  j1
  ((x Int)) Int x)
(define-fun
  h1
  ((x Int)) Int (+ 2 (- 2 x)))
(define-fun
  h0
  ((x Int)) Int (+ 1 x))
(define-fun
  g0
  ((x Int)) Int (- x 2))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) (h0 x)))
(define-fun
  small
  ((x Int)) Int (div 1 (v0 x)))
(define-fun
  f1
  ((x Int) (y Int)) Int (div (- y x) 2))
(define-fun-rec
  u1
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z))))
(define-fun
  w1
  ((x Int)) Int (u1 (h1 x) 0 x))
(define-fun
  f0
  ((x Int) (y Int)) Int y)
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (w1 c)))))
