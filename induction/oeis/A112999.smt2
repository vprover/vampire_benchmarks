(define-fun-rec
  v6
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v6 (- x 1) y z)))
(define-fun-rec
  v2
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v2 (- x 1) y z)))
(define-fun-rec
  v10
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v10 (- x 1) y z)))
(define-fun-rec
  u9
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u9 (- x 1) y) x)))
(define-fun
  v9
  ((x Int)) Int (u9 x 1))
(define-fun-rec
  u7
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u7 (- x 1) y) x)))
(define-fun-rec
  u6
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u6 (- x 1) y z) (v6 (- x 1) y z))))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u3 (- x 1) y) x)))
(define-fun
  v3
  ((x Int) (y Int)) Int (u3 y x))
(define-fun-rec
  u2
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (v3 (u2 (- x 1) y z) (v2 (- x 1) y z))))
(define-fun
  w2
  ((x Int)) Int (u2 x 1 x))
(define-fun-rec
  u10
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u10 (- x 1) y z) (v10 (- x 1) y z))))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (w2 (u1 (- x 1) y))))
(define-fun
  j2
  ((x Int)) Int x)
(define-fun
  j10
  ((x Int)) Int (+ 1 x))
(define-fun
  i10
  ((x Int)) Int (+ 1 x))
(define-fun
  w10
  ((x Int)) Int (u10 x (i10 x) (j10 x)))
(define-fun
  h7
  ((x Int)) Int x)
(define-fun
  h6
  ((x Int)) Int (- x 2))
(define-fun
  h5
  ((x Int) (y Int)) Int y)
(define-fun
  h3
  ((x Int)) Int x)
(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  h10
  ((x Int)) Int x)
(define-fun
  h1
  ((x Int) (y Int)) Int (+ 1 y))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 1 (h1 x y)))
(define-fun
  g9
  ((x Int)) Int x)
(define-fun
  g7
  ((x Int)) Int (- x 1))
(define-fun
  v7
  ((x Int)) Int (u7 (g7 x) x))
(define-fun
  w6
  ((x Int)) Int (u6 (h6 x) 1 (v7 x)))
(define-fun
  g6
  ((x Int) (y Int)) Int y)
(define-fun
  g4
  ((x Int)) Int x)
(define-fun
  g3
  ((x Int) (y Int)) Int y)
(define-fun
  g2
  ((x Int) (y Int)) Int y)
(define-fun
  g10
  ((x Int) (y Int)) Int y)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f8
  ((x Int)) Int (* (* x x) x))
(define-fun-rec
  u8
  ((x Int) (y Int)) Int (ite (<= x 0) y (f8 (u8 (- x 1) y))))
(define-fun
  v8
  ((x Int)) Int (u8 1 (v9 x)))
(define-fun
  f5
  ((x Int)) Int (* (* (w6 x) (v8 x)) (w10 x)))
(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (f5 (u5 (- x 1) y))))
(define-fun
  v5
  ((x Int) (y Int)) Int (u5 1 y))
(define-fun
  f4
  ((x Int) (y Int)) Int (+ (v5 x y) x))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (f4 (u4 (- x 1) y) x)))
(define-fun
  v4
  ((x Int)) Int (u4 x 1))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (v1 x y) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (v4 c)))))
