(define-fun
  v1
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z 2))
(define-fun-rec
  u1
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (+ (u1 (- x 1) y z) (v1 (- x 1) y z))))
(define-fun
  i1
  ((x Int)) Int (- x 1))
(define-fun
  h1
  ((x Int)) Int (- x 2))
(define-fun
  w1
  ((x Int)) Int (u1 (h1 x) (i1 x) 1))
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int (* 2 (- x 2)))
(define-fun
  fast
  ((x Int)) Int
  (div (+ (+ (* (* (w1 x) x) 2) 1) x) (ite (<= x 0) 1 x)))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (+ y y) y))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) x))
(define-fun
  small
  ((x Int)) Int (+ 1 (v0 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
