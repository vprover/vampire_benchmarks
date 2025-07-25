(define-fun
  h2
  ((x Int)) Int (+ x x))
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int (+ x x))
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f2
  ((x Int) (y Int)) Int (- x (ite (<= x 0) 0 (+ 1 y))))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y) x)))
(define-fun
  v2
  ((x Int)) Int (u2 x (h2 x)))
(define-fun
  fast
  ((x Int)) Int (div 2 (- 2 (v2 x))))
(define-fun
  f1
  ((x Int) (y Int)) Int (- y 1))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 (- x y) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (v1 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x (h0 x)))
(define-fun
  small
  ((x Int)) Int (ite (<= (v0 x) 0) 1 0))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
