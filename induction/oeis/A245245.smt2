(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u5 (- x 1) y) x)))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u2 (- x 1) y) x)))
(define-fun
  v2
  ((x Int)) Int (u2 x 1))
(define-fun
  j4
  ((x Int)) Int (+ 1 (+ x x)))
(define-fun
  j1
  ((x Int)) Int (+ x x))
(define-fun
  h4
  ((x Int)) Int (- x 1))
(define-fun
  h3
  ((x Int)) Int (* x x))
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int (* x x))
(define-fun
  g5
  ((x Int)) Int (- x 1))
(define-fun
  v5
  ((x Int)) Int (u5 (g5 x) 1))
(define-fun
  g4
  ((x Int) (y Int)) Int (+ 1 y))
(define-funs-rec
  ((v4
    ((x Int) (y Int) (z Int)) Int)
   (u4
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g4 (u4 (- x 1) y z) (v4 (- x 1) y z)))
   (ite (<= x 0) y (* (u4 (- x 1) y z) (v4 (- x 1) y z)))))
(define-fun
  w4
  ((x Int)) Int (u4 (h4 x) 1 (j4 x)))
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int) (y Int)) Int (+ 1 y))
(define-fun
  f3
  ((x Int)) Int (* (div (w4 x) (v5 x)) (ite (<= x 0) 1 (+ 1 2))))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int)) Int (u3 1 (h3 x)))
(define-fun
  f1
  ((x Int) (y Int)) Int (+ (* x y) x))
(define-funs-rec
  ((u1
    ((x Int) (y Int) (z Int)) Int)
   (v1
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z)))
   (ite (<= x 0) z (g1 (u1 (- x 1) y z) (v1 (- x 1) y z)))))
(define-fun
  w1
  ((x Int)) Int (u1 x 1 (j1 x)))
(define-fun
  f0
  ((x Int)) Int (div (w1 x) (v2 x)))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 1 (h0 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (v3 c)))))
