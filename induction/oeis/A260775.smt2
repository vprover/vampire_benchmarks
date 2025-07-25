(define-fun
  g1
  ((x Int)) Int (+ x x))
(define-fun
  g0
  ((x Int)) Int (+ x x))
(define-fun
  f1
  ((x Int) (y Int)) Int (div (* (- (* 2 (+ y y)) 2) x) (+ 1 y)))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) 1))
(define-fun
  fast
  ((x Int)) Int (* (v1 x) (ite (<= x 0) 1 2)))
(define-fun
  f0
  ((x Int) (y Int)) Int
  (div (* 2 (- (* 2 (* x y)) (- x 1))) (+ 1 y)))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
