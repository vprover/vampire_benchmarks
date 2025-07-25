(define-fun
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y x))
(define-fun
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y x))
(define-fun
  g1
  ((x Int)) Int (- (* 2 (+ 2 2)) x))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) 0))
(define-fun
  g0
  ((x Int)) Int (- x (* 2 (+ 2 2))))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 0))
(define-fun
  small
  ((x Int)) Int (+ 1 (- x (v0 x))))
(define-fun
  fast
  ((x Int)) Int (+ (- 1 (v1 x)) (* (+ 2 2) 2)))
(define-fun
  f1
  ((x Int) (y Int)) Int y)
(define-fun
  f0
  ((x Int) (y Int)) Int y)
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
