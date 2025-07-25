(define-fun
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y 1))
(define-fun
  h5
  () Int (+ 2 2))
(define-fun
  h4
  ((x Int) (y Int)) Int y)
(define-fun
  h3
  ((x Int)) Int x)
(define-fun
  h2
  ((x Int)) Int (+ 1 x))
(define-fun
  h1
  ((x Int) (y Int)) Int (+ 1 y))
(define-fun
  g5
  ((x Int)) Int (- 2 x))
(define-fun
  v5
  ((x Int)) Int (u5 (g5 x) h5))
(define-fun
  g4
  () Int (+ 1 2))
(define-fun
  g3
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int)) Int (+ x x))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f4
  ((x Int)) Int (div x (v5 x)))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (f4 (u4 (- x 1) y))))
(define-fun
  v4
  ((x Int) (y Int)) Int (u4 g4 y))
(define-fun
  f3
  ((x Int) (y Int)) Int (+ (v4 x y) x))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y) x)))
(define-fun
  v3
  ((x Int)) Int (u3 x x))
(define-fun
  f2
  ((x Int)) Int (- (v3 x) x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 1 (h2 x)))
(define-fun
  f1
  ((x Int)) Int (ite (<= x 0) 1 (div x 2)))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 (g1 x) (h1 x y)))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (v1 x y) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (v2 c)))))
