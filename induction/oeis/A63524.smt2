(define-fun
  small
  ((x Int)) Int (div 1 (ite (<= x 0) 2 x)))
(define-fun
  g0
  ((x Int)) Int (- 2 x))
(define-fun
  f0
  ((x Int)) Int (- 1 x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 0))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (v0 c)))))
