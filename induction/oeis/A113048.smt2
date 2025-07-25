(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u2 (- x 1) y) x)))
(define-fun
  j1
  ((x Int)) Int (+ 2 (+ (+ x x) x)))
(define-fun
  h1
  ((x Int)) Int (- x 1))
(define-fun
  g2
  ((x Int)) Int (- x 1))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) 1))
(define-fun
  g1
  ((x Int) (y Int)) Int (+ 1 y))
(define-funs-rec
  ((v1
    ((x Int) (y Int) (z Int)) Int)
   (u1
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g1 (u1 (- x 1) y z) (v1 (- x 1) y z)))
   (ite (<= x 0) y (* (u1 (- x 1) y z) (v1 (- x 1) y z)))))
(define-fun
  w1
  ((x Int)) Int (u1 (h1 x) 1 (j1 x)))
(define-fun
  g0
  ((x Int)) Int (+ (+ x x) x))
(define-fun
  fast
  ((x Int)) Int (mod (div (w1 x) (v2 x)) (+ 2 2)))
(define-fun
  f0
  ((x Int) (y Int)) Int (div (* 2 (- (* 2 (* x y)) x)) (+ 1 y)))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 1))
(define-fun
  small
  ((x Int)) Int (mod (v0 x) (+ 2 2)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
