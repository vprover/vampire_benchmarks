(define-fun
  small
  ((x Int)) Int (div (+ 1 (+ (* (div x 2) (div x 2)) x)) 2))
(define-fun
  h0
  ((x Int)) Int (div x 2))
(define-fun
  f0
  ((x Int)) Int (* x x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 1 (h0 x)))
(define-fun
  fast
  ((x Int)) Int (div (+ 1 (+ (v0 x) x)) 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
