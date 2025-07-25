(define-fun
  h4
  ((x Int)) Int x)
(define-fun
  h3
  ((x Int)) Int x)
(define-fun
  h2
  ((x Int)) Int (div x 2))
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  g5
  ((x Int)) Int (mod (div (- x 1) 2) 2))
(define-fun
  g4
  ((x Int)) Int (mod x 2))
(define-fun
  g1
  ((x Int)) Int (mod x 2))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f5
  () Int (+ 2 2))
(define-fun
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y f5))
(define-fun
  v5
  ((x Int)) Int (u5 (g5 x) 0))
(define-fun
  f4
  ((x Int)) Int (div x 2))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (f4 (u4 (- x 1) y))))
(define-fun
  v4
  ((x Int)) Int (u4 (g4 x) x))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (v4 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int)) Int (u3 (v5 x) x))
(define-fun
  f2
  ((x Int)) Int (+ 1 (v3 x)))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 1 (h2 x)))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (v2 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) x))
(define-fun
  fast
  ((x Int)) Int (mod (- (v1 x) 1) 2))
(define-fun
  f0
  ((x Int) (y Int)) Int (* (- 2 (div x 2)) y))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 0))
(define-fun
  small
  ((x Int)) Int (mod (+ (+ (v0 x) 1) x) 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
