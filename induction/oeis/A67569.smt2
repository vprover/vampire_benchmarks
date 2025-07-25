(define-fun
  small
  ((x Int)) Int (+ (ite (<= (- x 2) 0) (div x 2) (+ 2 x)) x))
(define-fun
  g0
  ((x Int)) Int (- x 2))
(define-fun
  f0
  () Int (- 0 2))
(define-fun
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y f0))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 1))
(define-fun
  fast
  ((x Int)) Int (+ (ite (<= x 0) 0 (- x (v0 x))) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
