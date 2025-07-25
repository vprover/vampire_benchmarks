(define-fun
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y 0))
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int)) Int (- 2 x))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) x))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int (+ 1 (div (+ 2 (v1 x)) (+ 1 2))))
(define-fun
  f0
  ((x Int) (y Int)) Int (- 0 (div (- x y) 2)))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x x))
(define-fun
  small
  ((x Int)) Int (+ 1 (v0 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
