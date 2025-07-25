(define-fun
  g0
  ((x Int)) Int (+ x x))
(define-fun
  fast
  ((x Int)) Int
  (+ (+ (+ (div (- 1 x) (+ 1 2)) (ite (<= x 0) 1 x)) x) x))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (div (div x 2) 2) y))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 0))
(define-fun
  small
  ((x Int)) Int (+ 1 (v0 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
