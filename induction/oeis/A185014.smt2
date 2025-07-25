(define-fun
  v1
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z 0))
(define-fun
  u1
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) y (v1 (- x 1) y z)))
(define-fun
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y x))
(define-fun
  h1
  ((x Int)) Int (+ 1 (+ 2 (- 2 x))))
(define-fun
  w1
  ((x Int)) Int (u1 (h1 x) 0 1))
(define-fun
  g0
  ((x Int)) Int (- (- x 1) 2))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 2))
(define-fun
  small
  ((x Int)) Int (div 1 (v0 x)))
(define-fun
  f1
  ((x Int) (y Int)) Int y)
(define-fun
  f0
  ((x Int) (y Int)) Int y)
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (w1 c)))))
