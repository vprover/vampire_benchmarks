(define-fun
  h1
  () Int (+ 1 2))
(define-fun
  h0
  ((x Int)) Int (ite (<= x 0) 1 2))
(define-fun
  g1
  ((x Int)) Int (- 1 (mod x 2)))
(define-fun
  g0
  ((x Int)) Int (- 2 (mod x 2)))
(define-fun
  f1
  ((x Int)) Int (+ (* 2 (* x x)) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) h1))
(define-fun
  fast
  ((x Int)) Int (* (v1 x) (ite (<= x 0) 1 2)))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (* (+ 1 y) (* x y)) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) (h0 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
