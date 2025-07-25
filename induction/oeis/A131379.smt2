(define-fun
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y x))
(define-fun
  small
  ((x Int)) Int (- 1 (mod (mod x (+ 2 2)) (+ 1 2))))
(define-fun
  g0
  ((x Int)) Int (mod (+ 1 x) (+ 2 2)))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 1))
(define-fun
  fast
  ((x Int)) Int (- 2 (v0 x)))
(define-fun
  f0
  ((x Int) (y Int)) Int y)
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
