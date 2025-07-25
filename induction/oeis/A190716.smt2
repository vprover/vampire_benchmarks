(define-fun
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y 0))
(define-fun
  small
  ((x Int)) Int (+ 1 (+ (* (ite (<= (mod x 2) 0) x 0) x) x)))
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int (mod x 2))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) x))
(define-fun
  fast
  ((x Int)) Int (+ 1 (+ (* (v0 x) x) x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
