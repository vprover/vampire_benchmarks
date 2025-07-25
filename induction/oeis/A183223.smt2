(define-fun-rec
  v1
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v1 (- x 1) y z)))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (+ (u2 (- x 1) y) x)))
(define-fun
  j1
  ((x Int)) Int (div x (+ 1 (* 2 (+ 2 2)))))
(define-fun
  i1
  () Int (+ 2 2))
(define-fun
  h2
  ((x Int) (y Int)) Int y)
(define-fun
  h1
  () Int (+ 1 1))
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int) (y Int)) Int y)
(define-fun
  g0
  ((x Int)) Int (+ (+ x 2) x))
(define-fun
  f1
  ((x Int) (y Int)) Int (div (u2 x y) x))
(define-fun-rec
  u1
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z))))
(define-fun
  w1
  ((x Int)) Int (u1 h1 i1 (j1 x)))
(define-fun
  fast
  ((x Int)) Int (+ (+ (w1 x) 1) x))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ 2 (div y x)))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 2))
(define-fun
  small
  ((x Int)) Int (+ (+ (div (v0 x) (+ 1 2)) 1) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
