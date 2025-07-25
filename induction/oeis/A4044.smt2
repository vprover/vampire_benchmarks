(define-fun
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y 1))
(define-fun
  small
  ((x Int)) Int (div (+ 2 (* x x)) (ite (<= (- (- x 2) 2) 0) 2 1)))
(define-fun
  g0
  ((x Int)) Int (- (- x 2) 2))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 2))
(define-fun
  fast
  ((x Int)) Int (div (+ 2 (* x x)) (v0 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
