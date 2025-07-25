(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u4 (- x 1) y) x)))
(define-fun
  v4
  ((x Int)) Int (u4 x 1))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u2 (- x 1) y) x)))
(define-fun
  v2
  ((x Int)) Int (u2 x 1))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u1 (- x 1) y) x)))
(define-fun
  j3
  ((x Int)) Int (- x 1))
(define-fun
  h3
  ((x Int)) Int (div x 2))
(define-fun
  g4
  ((x Int)) Int x)
(define-fun
  g3
  ((x Int) (y Int)) Int (- y 2))
(define-funs-rec
  ((v3
    ((x Int) (y Int) (z Int)) Int)
   (u3
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g3 (u3 (- x 1) y z) (v3 (- x 1) y z)))
   (ite (<= x 0) y (* (u3 (- x 1) y z) (v3 (- x 1) y z)))))
(define-fun
  w3
  ((x Int)) Int (u3 (h3 x) 1 (j3 x)))
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int) (y Int)) Int (- y 1))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 (g1 x y) 1))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int (+ (* x (w3 x)) (v4 x)))
(define-fun
  f0
  ((x Int) (y Int)) Int (div (v1 x y) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(define-fun
  small
  ((x Int)) Int (+ (* (v0 x) x) (v2 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
