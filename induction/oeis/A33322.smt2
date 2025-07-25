(define-fun
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y x))
(define-fun
  small
  ((x Int)) Int (div 2 (+ 1 x)))
(define-fun
  g0
  ((x Int)) Int (- 2 x))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 0))
(define-fun
  f0
  ((x Int) (y Int)) Int y)
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (v0 c)))))
