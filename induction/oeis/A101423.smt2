(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (+ (u0 (- x 1) y) x)))
(define-fun
  h0
  ((x Int)) Int (+ (div x 2) (div (* x x) (+ 1 2))))
(define-fun
  g0
  ((x Int)) Int (+ 2 x))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) (h0 x)))
(define-fun
  fast
  ((x Int)) Int
  (- (* (+ 1 x) (+ 2 x)) (div (- (* x x) 1) (+ 2 (+ 2 2)))))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
