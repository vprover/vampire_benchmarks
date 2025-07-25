(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u1 (- x 1) y) x)))
(define-fun
  h0
  ((x Int)) Int (+ 1 (mod x 2)))
(define-fun
  g1
  ((x Int)) Int (+ 1 (+ 2 x)))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) 1))
(define-fun
  g0
  ((x Int)) Int (+ 1 x))
(define-fun
  fast
  ((x Int)) Int (div (v1 x) (- 2 (mod x 2))))
(define-fun
  f0
  ((x Int) (y Int)) Int (* (+ 2 y) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) (h0 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
