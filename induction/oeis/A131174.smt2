(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (+ (u0 (- x 1) y) x)))
(define-fun
  h2
  ((x Int)) Int (div x 2))
(define-fun
  g1
  ((x Int)) Int (mod x 2))
(define-fun
  g0
  ((x Int)) Int (div x 2))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 0))
(define-fun
  small
  ((x Int)) Int (* (- 2 (mod x 2)) (v0 x)))
(define-fun
  f2
  ((x Int)) Int (+ (* x x) x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 1 (h2 x)))
(define-fun
  f1
  ((x Int)) Int (div x 2))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) (v2 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (v1 c)))))
