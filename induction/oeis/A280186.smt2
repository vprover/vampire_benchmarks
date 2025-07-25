(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int
  (div (* (- x 1) (div (* (- x 2) x) (+ 2 2))) (+ 1 2)))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (* (- (div y 2) 1) (div y 2)) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 0))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
