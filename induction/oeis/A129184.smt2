(define-fun
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y x))
(define-fun
  h3
  ((x Int)) Int x)
(define-fun
  h2
  ((x Int)) Int (+ 2 x))
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int (+ 2 x))
(define-fun
  g3
  ((x Int)) Int (+ 2 (div x (+ 2 2))))
(define-fun
  g1
  ((x Int) (y Int)) Int (- (- x y) 1))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 (g1 x y) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (v1 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x (h0 x)))
(define-fun
  small
  ((x Int)) Int (div 1 (v0 x)))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f3
  ((x Int) (y Int)) Int (- x (ite (<= (- y x) 0) y 0)))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y) x)))
(define-fun
  v3
  ((x Int)) Int (u3 (g3 x) x))
(define-fun
  f2
  ((x Int)) Int (ite (<= (v3 x) 0) 1 0))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 1 (h2 x)))
(define-fun
  f1
  ((x Int) (y Int)) Int y)
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (v2 c)))))
