(define-fun
  small
  ((x Int)) Int (- 1 (ite (<= x 0) 2 0)))
(define-fun
  g0
  ((x Int)) Int (- 1 x))
(define-fun
  f0
  () Int (- 0 1))
(define-fun
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y f0))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (v0 c)))))
