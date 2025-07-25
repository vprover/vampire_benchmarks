(define-fun
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y 0))
(define-fun
  small
  ((x Int)) Int (div (+ (ite (<= (- (- (div x 2) 2) 2) 0) 1 0) x) 2))
(define-fun
  g0
  ((x Int)) Int (- (- x 2) (* 2 (+ 2 2))))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 1))
(define-fun
  fast
  ((x Int)) Int (div (+ (v0 x) x) 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
