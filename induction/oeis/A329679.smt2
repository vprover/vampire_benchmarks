(define-fun
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y x))
(define-fun
  g0
  ((x Int)) Int (- x 2))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 2))
(define-fun
  small
  ((x Int)) Int (div 2 (v0 x)))
(define-fun
  fast
  ((x Int)) Int (div 2 (ite (<= (- x 2) 0) 2 (- x 2))))
(define-fun
  f0
  ((x Int) (y Int)) Int y)
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
