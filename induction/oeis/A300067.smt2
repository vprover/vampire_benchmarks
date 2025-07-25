(define-fun
  v1
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z 0))
(define-fun
  u1
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) y (v1 (- x 1) y z)))
(define-fun
  h1
  ((x Int)) Int (- (mod x (+ 2 (+ 2 2))) 2))
(define-fun
  w1
  ((x Int)) Int (u1 (h1 x) 2 1))
(define-fun
  h0
  ((x Int)) Int (mod x 2))
(define-fun
  g0
  ((x Int)) Int (mod x (+ 1 2)))
(define-fun
  fast
  ((x Int)) Int (- 2 (w1 x)))
(define-fun
  f1
  ((x Int) (y Int)) Int y)
(define-fun
  f0
  ((x Int)) Int (ite (<= x 0) 2 0))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) (h0 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
