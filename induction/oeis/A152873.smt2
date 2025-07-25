(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u3 (- x 1) y) x)))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u2 (- x 1) y) x)))
(define-fun
  h1
  ((x Int) (y Int)) Int y)
(define-fun
  g3
  ((x Int)) Int (+ 2 (div (+ 1 x) 2)))
(define-fun
  v3
  ((x Int)) Int (u3 (g3 x) 1))
(define-fun
  g2
  ((x Int)) Int (+ 1 (div x 2)))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) 1))
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int (* (v2 x) (v3 x)))
(define-fun
  f1
  ((x Int) (y Int)) Int (+ 1 y))
(define-funs-rec
  ((u1
    ((x Int) (y Int) (z Int)) Int)
   (v1
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z)))
   (ite (<= x 0) z (u1 (- x 1) y z))))
(define-fun
  w1
  ((x Int) (y Int)) Int (u1 y 1 2))
(define-fun
  f0
  ((x Int) (y Int)) Int (* x (w1 x y)))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
