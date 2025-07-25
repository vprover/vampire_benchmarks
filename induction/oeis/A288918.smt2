(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int
  (- (* (* (+ (+ (- x 1) x) x) (+ (- x 1) x)) (ite (<= x 0) 1 2)) 1))
(define-fun
  f0
  ((x Int) (y Int)) Int (- (* (+ 2 y) x) 2))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 2 x))
(define-fun
  small
  ((x Int)) Int (+ (* (v0 x) x) (ite (<= x 0) 0 1)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
