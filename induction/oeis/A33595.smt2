(define-fun
  g0
  ((x Int)) Int (* 2 (* x x)))
(define-fun
  fast
  ((x Int)) Int (* (- 1 (* 2 (* x x))) (- 1 (* x x))))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (- x 2) y))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
