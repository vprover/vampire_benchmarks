(define-fun
  small
  ((x Int)) Int (+ 1 (* 2 (ite (<= (- 2 x) 0) (+ 2 2) x))))
(define-fun
  g0
  ((x Int)) Int (- 2 x))
(define-fun
  f0
  ((x Int) (y Int)) Int (- 0 y))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 2))
(define-fun
  fast
  ((x Int)) Int (+ (* 2 (+ (v0 x) 2)) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
