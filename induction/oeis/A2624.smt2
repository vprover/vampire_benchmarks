(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (+ (u4 (- x 1) y) x)))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (+ (u2 (- x 1) y) x)))
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
  g5
  ((x Int)) Int x)
(define-fun
  g4
  ((x Int) (y Int)) Int (+ 1 y))
(define-fun
  v4
  ((x Int) (y Int)) Int (u4 (g4 x y) x))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (v4 (u3 (- x 1) y) x)))
(define-fun
  g3
  ((x Int)) Int (div x 2))
(define-fun
  v3
  ((x Int)) Int (u3 (g3 x) 1))
(define-fun
  g2
  ((x Int) (y Int)) Int (div y 2))
(define-fun
  v2
  ((x Int) (y Int)) Int (u2 (g2 x y) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (v2 (u1 (- x 1) y) x)))
(define-fun
  g1
  ((x Int) (y Int)) Int (+ 2 y))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 (g1 x y) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (v1 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f5
  ((x Int) (y Int)) Int (+ 1 y))
(define-funs-rec
  ((u5
    ((x Int) (y Int) (z Int)) Int)
   (v5
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f5 (u5 (- x 1) y z) (v5 (- x 1) y z)))
   (ite (<= x 0) z (u5 (- x 1) y z))))
(define-fun
  w5
  ((x Int)) Int (u5 x 1 2))
(define-fun
  fast
  ((x Int)) Int (* (v3 x) (w5 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
