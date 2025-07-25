(define-fun
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y 2))
(define-fun
  small
  ((x Int)) Int (ite (<= (- 2 x) 0) x 2))
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int (- 2 x))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (v0 c)))))
