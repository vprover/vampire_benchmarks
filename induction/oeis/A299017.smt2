(define-fun
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (+ (u0 (- x 1) y) x)))
(define-fun
  g2
  ((x Int)) Int (- x (* (- x 2) x)))
(define-fun
  g1
  ((x Int)) Int (- x 2))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) 1))
(define-fun
  g0
  ((x Int)) Int (+ (v1 x) x))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 0))
(define-fun
  f2
  ((x Int)) Int (+ x x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) 1))
(define-fun
  fast
  ((x Int)) Int (+ (v2 x) (- (* (- (* x x) x) 2) x)))
(define-fun
  f1
  ((x Int) (y Int)) Int y)
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
