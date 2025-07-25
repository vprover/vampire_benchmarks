(define-fun-rec
  v6
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v6 (- x 1) y z)))
(define-fun-rec
  v4
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v4 (- x 1) y z)))
(define-fun-rec
  v1
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v1 (- x 1) y z)))
(define-fun-rec
  u6
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u6 (- x 1) y z) (v6 (- x 1) y z))))
(define-fun-rec
  u1
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u1 (- x 1) y z) (v1 (- x 1) y z))))
(define-fun
  j6
  ((x Int)) Int x)
(define-fun
  j4
  ((x Int)) Int x)
(define-fun
  j2
  ((x Int)) Int x)
(define-fun
  j1
  ((x Int) (y Int)) Int y)
(define-fun
  j0
  ((x Int)) Int x)
(define-fun
  h6
  () Int (+ 1 (+ 2 (* 2 (+ 2 2)))))
(define-fun
  w6
  ((x Int)) Int (u6 h6 1 x))
(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (w6 (u5 (- x 1) y))))
(define-fun
  v5
  ((x Int) (y Int)) Int (u5 1 y))
(define-fun
  h5
  ((x Int) (y Int)) Int y)
(define-fun
  h3
  ((x Int) (y Int)) Int y)
(define-fun
  h1
  () Int (+ 2 (* 2 (+ 2 (* 2 (+ 2 2))))))
(define-fun
  w1
  ((x Int) (y Int)) Int (u1 h1 1 y))
(define-fun
  g6
  ((x Int) (y Int)) Int y)
(define-fun
  g4
  ((x Int) (y Int)) Int y)
(define-fun
  g2
  ((x Int) (y Int)) Int (+ 1 y))
(define-fun
  g1
  ((x Int) (y Int)) Int y)
(define-fun
  g0
  ((x Int) (y Int)) Int (+ 1 y))
(define-fun
  f4
  ((x Int) (y Int)) Int (* (v5 x y) x))
(define-fun-rec
  u4
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f4 (u4 (- x 1) y z) (v4 (- x 1) y z))))
(define-fun
  w4
  ((x Int)) Int (u4 2 1 x))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (w4 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int) (y Int)) Int (u3 1 y))
(define-fun
  f2
  ((x Int) (y Int)) Int (+ (v3 x y) x))
(define-funs-rec
  ((u2
    ((x Int) (y Int) (z Int)) Int)
   (v2
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f2 (u2 (- x 1) y z) (v2 (- x 1) y z)))
   (ite (<= x 0) z (g2 (u2 (- x 1) y z) (v2 (- x 1) y z)))))
(define-fun
  w2
  ((x Int)) Int (u2 2 0 x))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (w1 x y) x))
(define-funs-rec
  ((u0
    ((x Int) (y Int) (z Int)) Int)
   (v0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z)))))
(define-fun
  w0
  ((x Int)) Int (u0 2 0 x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (w0 c) (w2 c)))))
