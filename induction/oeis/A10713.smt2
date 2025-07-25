(define-fun
  small
  ((x Int)) Int (* 2 (+ 2 (* 2 (mod x 2)))))
(define-fun
  g0
  ((x Int)) Int (mod x 2))
(define-fun
  f0
  () Int (+ 2 2))
(define-fun
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y f0))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 2))
(define-fun
  fast
  ((x Int)) Int (* 2 (v0 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
