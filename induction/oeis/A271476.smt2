(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int (+ 1 x))
(define-fun
  f1
  ((x Int) (y Int)) Int (* (+ 2 x) (+ y y)))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int)) Int (u1 x 0))
(define-fun
  fast
  ((x Int)) Int (* (+ (v1 x) 1) (+ 1 x)))
(define-fun
  f0
  ((x Int) (y Int)) Int (- (* y (* 2 (+ x y))) y))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 0))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
