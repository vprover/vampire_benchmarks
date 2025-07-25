(define-fun
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y 1))
(define-fun
  small
  ((x Int)) Int
  (ite (<= (- (- (div x 2) 2) 2) 0) (ite (<= x 0) 0 1) 2))
(define-fun
  g0
  ((x Int)) Int (+ 2 (- (* 2 (+ 2 2)) x)))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 2))
(define-fun
  fast
  ((x Int)) Int (ite (<= x 0) x (v0 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
