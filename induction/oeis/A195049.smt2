(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int (* x x))
(define-fun
  g1
  ((x Int) (y Int)) Int y)
(define-fun
  fast
  ((x Int)) Int
  (+ (* (+ 1 (* 2 (* 2 (+ 2 2)))) (div (* x x) (+ 2 2))) (* x x)))
(define-fun
  f1
  ((x Int) (y Int)) Int (+ (* (div (* x y) (+ 1 y)) y) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 y x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (v1 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 2 (h0 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
