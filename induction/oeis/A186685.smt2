(define-fun
  small
  ((x Int)) Int (- (* (ite (<= (- x 2) 0) (* 2 x) 1) x) x))
(define-fun
  g0
  ((x Int)) Int (ite (<= (- x 2) 0) x 0))
(define-fun
  f0
  ((x Int) (y Int)) Int (* (+ y x) y))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 0))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (v0 c)))))
