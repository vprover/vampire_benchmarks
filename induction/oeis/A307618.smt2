(define-fun-rec
  u9
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u9 (- x 1) y) x)))
(define-fun
  v9
  ((x Int)) Int (u9 x 1))
(define-fun-rec
  u7
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u7 (- x 1) y) x)))
(define-fun
  v7
  ((x Int)) Int (u7 x 1))
(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u5 (- x 1) y) x)))
(define-fun
  v5
  ((x Int)) Int (u5 x 1))
(define-fun-rec
  u11
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u11 (- x 1) y) x)))
(define-fun
  v11
  ((x Int)) Int (u11 x 1))
(define-fun
  j8
  ((x Int)) Int (+ 1 (+ (+ x x) x)))
(define-fun
  j6
  ((x Int)) Int (+ 1 x))
(define-fun
  j4
  ((x Int)) Int (+ 1 x))
(define-fun
  j2
  ((x Int)) Int (+ 1 x))
(define-fun
  j10
  ((x Int)) Int (+ 1 (+ x x)))
(define-fun
  j0
  ((x Int)) Int x)
(define-fun
  h8
  ((x Int)) Int x)
(define-fun
  h6
  ((x Int)) Int x)
(define-fun
  h4
  ((x Int)) Int x)
(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  h10
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int (+ (+ x x) x))
(define-fun
  g9
  ((x Int)) Int x)
(define-fun
  g8
  ((x Int) (y Int)) Int (+ 1 y))
(define-funs-rec
  ((v8
    ((x Int) (y Int) (z Int)) Int)
   (u8
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g8 (u8 (- x 1) y z) (v8 (- x 1) y z)))
   (ite (<= x 0) y (* (u8 (- x 1) y z) (v8 (- x 1) y z)))))
(define-fun
  w8
  ((x Int)) Int (u8 x 1 (j8 x)))
(define-fun
  g7
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
  ((x Int)) Int (u4 x 1 (j4 x)))
(define-fun
  g3
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int) (y Int)) Int (+ 1 y))
(define-funs-rec
  ((v2
    ((x Int) (y Int) (z Int)) Int)
   (u2
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g2 (u2 (- x 1) y z) (v2 (- x 1) y z)))
   (ite (<= x 0) y (* (u2 (- x 1) y z) (v2 (- x 1) y z)))))
(define-fun
  w2
  ((x Int)) Int (u2 x 1 (j2 x)))
(define-fun
  g11
  ((x Int)) Int x)
(define-fun
  g10
  ((x Int) (y Int)) Int (+ 1 y))
(define-funs-rec
  ((v10
    ((x Int) (y Int) (z Int)) Int)
   (u10
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g10 (u10 (- x 1) y z) (v10 (- x 1) y z)))
   (ite (<= x 0) y (* (u10 (- x 1) y z) (v10 (- x 1) y z)))))
(define-fun
  w10
  ((x Int)) Int (u10 x 1 (j10 x)))
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int) (y Int)) Int (+ 1 y))
(define-fun
  fast
  ((x Int)) Int
  (div
    (*
      (div (* (div (* (div (w4 x) (v5 x)) (w6 x)) (v7 x)) (w8 x)) (v9 x))
      (w10 x))
    (v11 x)))
(define-fun
  f3
  ((x Int) (y Int)) Int (* (* x y) y))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y) x)))
(define-fun
  v3
  ((x Int)) Int (u3 x 1))
(define-fun
  f1
  ((x Int) (y Int)) Int (* (* y y) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int)) Int (u1 x 1))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (* x y) x))
(define-funs-rec
  ((u0
    ((x Int) (y Int) (z Int)) Int)
   (v0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z)))))
(define-fun
  w0
  ((x Int)) Int (u0 (h0 x) 1 x))
(define-fun
  small
  ((x Int)) Int (div (* (div (w0 x) (v1 x)) (w2 x)) (v3 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
