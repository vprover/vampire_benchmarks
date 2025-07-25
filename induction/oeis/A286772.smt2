(define-funs-rec
  ((u9
    ((x Int) (y Int) (z Int)) Int)
   (v9
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (* (u9 (- x 1) y z) (v9 (- x 1) y z)))
   (ite (<= x 0) z (u9 (- x 1) y z))))
(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u5 (- x 1) y) x)))
(define-fun
  v5
  ((x Int)) Int (u5 x 1))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u3 (- x 1) y) x)))
(define-fun
  v3
  ((x Int)) Int (u3 x 1))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u2 (- x 1) y) x)))
(define-fun
  v2
  ((x Int)) Int (u2 x 1))
(define-fun-rec
  u11
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u11 (- x 1) y) x)))
(define-fun
  v11
  ((x Int)) Int (u11 x 1))
(define-fun
  i9
  ((x Int)) Int (mod x 2))
(define-fun
  h9
  ((x Int)) Int (- x 2))
(define-fun
  w9
  ((x Int)) Int (u9 (h9 x) (i9 x) 1))
(define-fun
  h8
  ((x Int) (y Int)) Int y)
(define-fun
  h1
  ((x Int) (y Int)) Int y)
(define-fun
  g9
  ((x Int)) Int x)
(define-fun
  g7
  ((x Int)) Int x)
(define-fun
  g6
  ((x Int)) Int x)
(define-fun
  g5
  ((x Int)) Int x)
(define-fun
  g4
  ((x Int)) Int x)
(define-fun
  g3
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g12
  ((x Int)) Int x)
(define-fun
  g11
  ((x Int)) Int x)
(define-fun
  g10
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f6
  ((x Int)) Int (* 2 x))
(define-fun-rec
  u6
  ((x Int) (y Int)) Int (ite (<= x 0) y (f6 (u6 (- x 1) y))))
(define-fun
  v6
  ((x Int)) Int (u6 x 2))
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
  f12
  ((x Int)) Int (* 2 x))
(define-fun-rec
  u12
  ((x Int) (y Int)) Int (ite (<= x 0) y (f12 (u12 (- x 1) y))))
(define-fun
  v12
  ((x Int)) Int (u12 x 2))
(define-fun
  f10
  ((x Int)) Int (+ x x))
(define-fun-rec
  u10
  ((x Int) (y Int)) Int (ite (<= x 0) y (f10 (u10 (- x 1) y))))
(define-fun
  v10
  ((x Int)) Int (u10 x 1))
(define-fun
  f8
  ((x Int)) Int
  (div (- (+ (- (- (* (w9 x) 2) (mod x 2)) (mod x 2)) 1) (v10 x))
    (v11 x)))
(define-fun-rec
  u8
  ((x Int) (y Int)) Int (ite (<= x 0) y (f8 (u8 (- x 1) y))))
(define-fun
  v8
  ((x Int) (y Int)) Int (u8 1 y))
(define-fun
  f7
  ((x Int) (y Int)) Int (- (v8 x y) x))
(define-fun-rec
  u7
  ((x Int) (y Int)) Int (ite (<= x 0) y (f7 (u7 (- x 1) y) x)))
(define-fun
  v7
  ((x Int)) Int (u7 x 1))
(define-fun
  fast
  ((x Int)) Int (mod (v7 x) (v12 x)))
(define-fun
  f1
  ((x Int)) Int (div (- (+ (- (v2 x) (v3 x)) 1) (v4 x)) (v5 x)))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 1 y))
(define-fun
  f0
  ((x Int) (y Int)) Int (- (v1 x y) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(define-fun
  small
  ((x Int)) Int (mod (v0 x) (v6 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
