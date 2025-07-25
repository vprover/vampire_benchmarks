(define-fun
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y 0))
(define-fun
  small
  ((x Int)) Int
  (+ 1 (+ (div (+ (+ (div x 2) x) x) (+ 1 (+ 2 x))) x)))
(define-fun
  g0
  ((x Int)) Int (- 2 x))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 1))
(define-fun
  fast
  ((x Int)) Int
  (+ (+ (ite (<= (- (* 2 (+ 2 (+ 2 2))) x) 0) 2 1) (v0 x)) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
