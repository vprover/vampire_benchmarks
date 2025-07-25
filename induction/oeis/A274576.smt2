(define-fun
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y 1))
(define-fun
  h5
  ((x Int)) Int (div x 2))
(define-fun
  h4
  ((x Int)) Int (div x 2))
(define-fun
  h3
  ((x Int)) Int (div x 2))
(define-fun
  h2
  ((x Int)) Int (div x 2))
(define-fun
  h1
  ((x Int)) Int (div x 2))
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g5
  ((x Int)) Int (mod x 2))
(define-fun
  v5
  ((x Int)) Int (u5 (g5 x) (h5 x)))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (v5 (u4 (- x 1) y))))
(define-fun
  g4
  ((x Int)) Int (mod x 2))
(define-fun
  v4
  ((x Int)) Int (u4 (g4 x) (h4 x)))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (v4 (u3 (- x 1) y))))
(define-fun
  g3
  ((x Int)) Int (mod x 2))
(define-fun
  v3
  ((x Int)) Int (u3 (g3 x) (h3 x)))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (v3 (u2 (- x 1) y))))
(define-fun
  g2
  ((x Int)) Int (mod x 2))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) (h2 x)))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (v2 (u1 (- x 1) y))))
(define-fun
  g1
  ((x Int)) Int (mod x 2))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) (h1 x)))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int (div (v1 x) 2))
(define-fun
  f0
  ((x Int)) Int (div x (+ 1 (mod x 2))))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 x x))
(define-fun
  small
  ((x Int)) Int (div (div (v0 x) 2) 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
