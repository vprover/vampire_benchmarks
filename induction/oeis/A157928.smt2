(define-fun
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y 0))
(define-fun
  small
  ((x Int)) Int (mod 1 (ite (<= x 0) 1 x)))
(define-fun
  g0
  ((x Int)) Int (- 2 x))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (v0 c)))))
