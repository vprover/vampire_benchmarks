(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u5 (- x 1) y) x)))
(define-fun
  v5
  ((x Int)) Int (u5 x 1))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u2 (- x 1) y) x)))
(define-fun
  v2
  ((x Int)) Int (u2 x 1))
(define-fun
  j6
  ((x Int)) Int (+ 2 x))
(define-fun
  h6
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g6
  ((x Int) (y Int)) Int (+ 1 y))
(define-funs-rec
  ((v6
    ((x Int) (y Int) (z Int)) Int)
   (u6
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g6 (u6 (- x 1) y z) (v6 (- x 1) y z)))
   (ite (<= x 0) y (* (u6 (- x 1) y z) (v6 (- x 1) y z)))))
(define-fun
  w6
  ((x Int)) Int (u6 x 1 (j6 x)))
(define-fun
  g5
  ((x Int)) Int x)
(define-fun
  g4
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int) (y Int)) Int (+ 2 y))
(define-fun
  f4
  ((x Int)) Int (+ x x))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (f4 (u4 (- x 1) y))))
(define-fun
  v4
  ((x Int)) Int (u4 x 1))
(define-fun
  f3
  ((x Int)) Int (* x x))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int)) Int (u3 1 (v4 x)))
(define-fun
  f1
  ((x Int)) Int (* x x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 1 (v2 x)))
(define-fun
  fast
  ((x Int)) Int (* (* (* (v1 x) (v3 x)) (v5 x)) (w6 x)))
(define-fun
  f0
  ((x Int) (y Int)) Int (* (* (+ 1 y) (* (* y y) y)) x))
(define-funs-rec
  ((u0
    ((x Int) (y Int) (z Int)) Int)
   (v0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z)))))
(define-fun
  w0
  ((x Int)) Int (u0 x 1 2))
(define-fun
  small
  ((x Int)) Int (div (w0 x) (+ 1 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
