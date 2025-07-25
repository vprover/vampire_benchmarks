(define-fun-rec
  v7
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v7 (- x 1) y z)))
(define-fun-rec
  v2
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v2 (- x 1) y z)))
(define-fun-rec
  u8
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u8 (- x 1) y) x)))
(define-fun-rec
  u7
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u7 (- x 1) y z) (v7 (- x 1) y z))))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u3 (- x 1) y) x)))
(define-fun
  v3
  ((x Int) (y Int)) Int (u3 y 1))
(define-fun-rec
  u2
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u2 (- x 1) y z) (v2 (- x 1) y z))))
(define-fun
  w2
  ((x Int)) Int (u2 x 1 x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (w2 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 1 (v3 x y)))
(define-fun
  j7
  ((x Int)) Int x)
(define-fun
  j2
  ((x Int)) Int x)
(define-fun
  h8
  ((x Int)) Int x)
(define-fun
  h7
  ((x Int) (y Int)) Int (- y 1))
(define-fun
  w7
  ((x Int) (y Int)) Int (u7 (h7 x y) 1 x))
(define-fun
  h5
  ((x Int) (y Int)) Int y)
(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  g8
  ((x Int)) Int (- x 1))
(define-fun
  v8
  ((x Int)) Int (u8 (g8 x) x))
(define-fun
  g7
  ((x Int) (y Int)) Int y)
(define-fun
  g6
  ((x Int)) Int (- x 1))
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
  g0
  ((x Int)) Int x)
(define-fun
  f6
  ((x Int) (y Int)) Int (* (w7 x y) (* x x)))
(define-fun-rec
  u6
  ((x Int) (y Int)) Int (ite (<= x 0) y (f6 (u6 (- x 1) y) x)))
(define-fun
  v6
  ((x Int)) Int (u6 (g6 x) (v8 x)))
(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (v6 (u5 (- x 1) y))))
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
(define-fun
  f0
  ((x Int) (y Int)) Int (* (v1 x y) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (v4 c)))))
