(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (+ (u5 (- x 1) y) x)))
(define-fun
  v5
  ((x Int) (y Int)) Int (u5 y x))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (v5 (u4 (- x 1) y) x)))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (+ (u2 (- x 1) y) x)))
(define-fun
  v2
  ((x Int) (y Int)) Int (u2 y x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (v2 (u1 (- x 1) y) x)))
(define-fun
  h5
  ((x Int)) Int x)
(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  g5
  ((x Int) (y Int)) Int y)
(define-fun
  g4
  ((x Int)) Int (div x 2))
(define-fun
  v4
  ((x Int)) Int (u4 (g4 x) 1))
(define-fun
  g3
  ((x Int)) Int (+ 1 x))
(define-fun
  g2
  ((x Int) (y Int)) Int y)
(define-fun
  g1
  ((x Int)) Int (div x 2))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) 1))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f3
  ((x Int) (y Int)) Int (+ (div y (v4 x)) x))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y) x)))
(define-fun
  v3
  ((x Int)) Int (u3 (g3 x) 0))
(define-fun
  fast
  ((x Int)) Int (mod (+ (v3 x) 1) 2))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (div (+ 1 y) (v1 x)) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(define-fun
  small
  ((x Int)) Int (mod (+ (v0 x) 1) 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
