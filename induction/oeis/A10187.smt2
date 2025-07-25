(define-fun
  h1
  ((x Int)) Int (mod x 2))
(define-fun
  h0
  () Int (+ 2 (* 2 (+ 2 2))))
(define-fun
  g1
  ((x Int)) Int (- 1 (mod x (+ 2 2))))
(define-fun
  g0
  ((x Int)) Int (mod x (+ 2 2)))
(define-fun
  f1
  () Int (+ 2 (* 2 (+ 2 2))))
(define-fun
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y f1))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) (h1 x)))
(define-fun
  fast
  ((x Int)) Int (* (+ 1 (v1 x)) (ite (<= x 0) 1 2)))
(define-fun
  f0
  ((x Int) (y Int)) Int (mod y 2))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) h0))
(define-fun
  small
  ((x Int)) Int (* (+ 1 (v0 x)) (ite (<= x 0) 1 2)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
