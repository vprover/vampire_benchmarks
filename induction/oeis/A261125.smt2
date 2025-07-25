(define-fun-rec
  u6
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u6 (- x 1) y) x)))
(define-fun
  v6
  ((x Int)) Int (u6 x 1))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 y x))
(define-fun
  j5
  ((x Int)) Int (+ 1 x))
(define-fun
  h8
  ((x Int)) Int x)
(define-fun
  h5
  ((x Int)) Int (- x 1))
(define-fun
  h3
  ((x Int) (y Int)) Int y)
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g8
  ((x Int) (y Int)) Int (+ y y))
(define-funs-rec
  ((v8
    ((x Int) (y Int) (z Int)) Int)
   (u8
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g8 (u8 (- x 1) y z) (v8 (- x 1) y z)))
   (ite (<= x 0) y (* (u8 (- x 1) y z) (v8 (- x 1) y z)))))
(define-fun
  w8
  ((x Int)) Int (u8 x 1 2))
(define-fun
  g7
  ((x Int)) Int x)
(define-fun
  g6
  ((x Int)) Int x)
(define-fun
  g5
  ((x Int) (y Int)) Int (+ 1 y))
(define-funs-rec
  ((v5
    ((x Int) (y Int) (z Int)) Int)
   (u5
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g5 (u5 (- x 1) y z) (v5 (- x 1) y z)))
   (ite (<= x 0) y (* (u5 (- x 1) y z) (v5 (- x 1) y z)))))
(define-fun
  w5
  ((x Int)) Int (u5 (h5 x) 1 (j5 x)))
(define-fun
  g2
  ((x Int)) Int (- x 1))
(define-fun
  g1
  ((x Int) (y Int)) Int y)
(define-fun
  g0
  ((x Int) (y Int)) Int (+ y y))
(define-funs-rec
  ((v0
    ((x Int) (y Int) (z Int)) Int)
   (u0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) y (v1 (u0 (- x 1) y z) (v0 (- x 1) y z)))))
(define-fun
  w0
  ((x Int)) Int (u0 x 1 2))
(define-fun
  f7
  ((x Int)) Int (+ x x))
(define-fun-rec
  u7
  ((x Int) (y Int)) Int (ite (<= x 0) y (f7 (u7 (- x 1) y))))
(define-fun
  v7
  ((x Int)) Int (u7 x 1))
(define-fun
  f4
  ((x Int)) Int (* (w5 x) (v6 x)))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (f4 (u4 (- x 1) y))))
(define-fun
  v4
  ((x Int)) Int (u4 1 (v7 x)))
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
(define-fun
  fast
  ((x Int)) Int (* (v2 x) (w8 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (w0 c) (fast c)))))
