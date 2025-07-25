(define-fun
  u6
  ((x Int) (y Int)) Int (ite (<= x 0) y 1))
(define-fun
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y x))
(define-fun
  h5
  ((x Int)) Int x)
(define-fun
  h4
  ((x Int)) Int x)
(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  g6
  ((x Int)) Int (+ 2 (- 2 x)))
(define-fun
  v6
  ((x Int)) Int (u6 (g6 x) 2))
(define-fun
  g5
  () Int (+ 1 (+ 2 2)))
(define-fun
  g4
  ((x Int)) Int (mod (+ 1 x) 2))
(define-fun
  g3
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int)) Int (- x 2))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) x))
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f5
  ((x Int)) Int (div x (v6 x)))
(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (f5 (u5 (- x 1) y))))
(define-fun
  v5
  ((x Int)) Int (u5 g5 x))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (v5 (u4 (- x 1) y))))
(define-fun
  v4
  ((x Int)) Int (u4 (g4 x) x))
(define-fun
  f3
  ((x Int)) Int (+ (+ (mod (+ (v4 x) 1) 2) 1) x))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int)) Int (u3 x 1))
(define-fun
  f2
  ((x Int) (y Int)) Int y)
(define-fun
  f1
  ((x Int)) Int (+ 1 (div (v2 x) 2)))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 x x))
(define-fun
  f0
  ((x Int)) Int (+ (v1 x) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (v3 c)))))
