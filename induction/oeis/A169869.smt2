(define-fun
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y 0))
(define-fun
  g0
  ((x Int)) Int (- (div x 2) 2))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 1))
(define-fun
  small
  ((x Int)) Int (+ 2 (+ 2 (+ (v0 x) x))))
(define-fun
  fast
  ((x Int)) Int
  (+ (+ 1 2) (+ (ite (<= (- (- (- x 2) 2) 1) 0) 2 1) x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
