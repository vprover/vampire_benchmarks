(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u1 (- x 1) y) x)))
(define-fun
  j6
  ((x Int)) Int (+ 1 (* x x)))
(define-fun
  h6
  ((x Int)) Int x)
(define-fun
  h5
  ((x Int) (y Int)) Int y)
(define-fun
  h3
  ((x Int) (y Int)) Int y)
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  g6
  ((x Int) (y Int)) Int (+ 2 y))
(define-fun
  g4
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int)) Int (- x 1))
(define-fun
  g1
  ((x Int) (y Int)) Int (* y y))
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
  f6
  ((x Int) (y Int)) Int (* (+ (* y y) y) x))
(define-funs-rec
  ((u6
    ((x Int) (y Int) (z Int)) Int)
   (v6
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f6 (u6 (- x 1) y z) (v6 (- x 1) y z)))
   (ite (<= x 0) z (g6 (u6 (- x 1) y z) (v6 (- x 1) y z)))))
(define-fun
  w6
  ((x Int)) Int (u6 x 1 (j6 x)))
(define-fun
  f5
  ((x Int)) Int (* (* (w6 x) (+ 1 x)) (+ 1 x)))
(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (f5 (u5 (- x 1) y))))
(define-fun
  v5
  ((x Int) (y Int)) Int (u5 1 y))
(define-fun
  f4
  ((x Int) (y Int)) Int (* (v5 x y) x))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (f4 (u4 (- x 1) y) x)))
(define-fun
  v4
  ((x Int)) Int (u4 x 1))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (v4 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int) (y Int)) Int (u3 1 y))
(define-fun
  f2
  ((x Int) (y Int)) Int (* (v3 x y) x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y) x)))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (v2 c)))))
