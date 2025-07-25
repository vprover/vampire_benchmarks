(define-fun
  h2
  () Int (+ 2 2))
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int (+ x x))
(define-fun
  f2
  ((x Int)) Int (* x x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  () Int (u2 1 h2))
(define-fun
  g1
  () Int (+ 2 v2))
(define-fun
  f1
  ((x Int) (y Int)) Int (- (ite (<= (- y x) 0) y 0) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int)) Int (u1 g1 x))
(define-fun
  f0
  ((x Int) (y Int)) Int (- (ite (<= (- y x) 0) y 0) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (v1 c)))))
