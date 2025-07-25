(define-fun
  g1
  ((x Int)) Int (+ 1 x))
(define-fun
  g0
  ((x Int)) Int (+ 2 x))
(define-fun
  f1
  ((x Int) (y Int)) Int (* (- x y) (- x y)))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) 1))
(define-fun
  fast
  ((x Int)) Int (- (v1 x) x))
(define-fun
  f0
  ((x Int) (y Int)) Int (- (* x x) y))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 1))
(define-fun
  small
  ((x Int)) Int (+ 2 (v0 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
