(define-fun
  small
  ((x Int)) Int (ite (<= x 0) (+ 1 2) 0))
(define-fun
  g0
  ((x Int)) Int (- 1 x))
(define-fun
  f0
  () Int (+ 1 2))
(define-fun
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y f0))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 0))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (v0 c)))))
