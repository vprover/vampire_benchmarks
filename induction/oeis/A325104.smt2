(define-fun
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y 1))
(define-fun
  v5
  ((x Int)) Int (u5 x x))
(define-fun
  u11
  ((x Int) (y Int)) Int (ite (<= x 0) y x))
(define-fun
  j9
  ((x Int)) Int x)
(define-fun
  j3
  ((x Int)) Int x)
(define-fun
  h9
  () Int (+ 2 (+ 2 2)))
(define-fun
  h8
  ((x Int) (y Int)) Int y)
(define-fun
  h6
  ((x Int)) Int x)
(define-fun
  h5
  ((x Int)) Int x)
(define-fun
  h4
  ((x Int) (y Int)) Int y)
(define-fun
  h3
  ((x Int)) Int x)
(define-fun
  h2
  ((x Int) (y Int)) Int y)
(define-fun
  h10
  ((x Int) (y Int)) Int y)
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g9
  ((x Int) (y Int)) Int (div y 2))
(define-fun
  g7
  ((x Int)) Int x)
(define-fun
  g5
  ((x Int)) Int x)
(define-fun
  g3
  ((x Int) (y Int)) Int (div y 2))
(define-fun
  g11
  ((x Int)) Int (mod x 2))
(define-fun
  v11
  ((x Int)) Int (u11 (g11 x) 2))
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  f4
  ((x Int)) Int (mod (+ (v5 x) x) 2))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (f4 (u4 (- x 1) y))))
(define-fun
  v4
  ((x Int) (y Int)) Int (u4 1 y))
(define-fun
  f3
  ((x Int) (y Int)) Int (+ (* (v4 x y) x) x))
(define-funs-rec
  ((u3
    ((x Int) (y Int) (z Int)) Int)
   (v3
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f3 (u3 (- x 1) y z) (v3 (- x 1) y z)))
   (ite (<= x 0) z (g3 (u3 (- x 1) y z) (v3 (- x 1) y z)))))
(define-fun
  w3
  ((x Int)) Int (u3 x 1 x))
(define-fun
  f2
  ((x Int)) Int (- (w3 x) x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int) (y Int)) Int (u2 1 y))
(define-fun
  f11
  ((x Int) (y Int)) Int y)
(define-fun
  f10
  ((x Int)) Int (mod (+ (v11 x) x) (+ 1 x)))
(define-fun-rec
  u10
  ((x Int) (y Int)) Int (ite (<= x 0) y (f10 (u10 (- x 1) y))))
(define-fun
  v10
  ((x Int) (y Int)) Int (u10 1 y))
(define-fun
  f9
  ((x Int) (y Int)) Int (+ (* (v10 x y) x) x))
(define-funs-rec
  ((u9
    ((x Int) (y Int) (z Int)) Int)
   (v9
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f9 (u9 (- x 1) y z) (v9 (- x 1) y z)))
   (ite (<= x 0) z (g9 (u9 (- x 1) y z) (v9 (- x 1) y z)))))
(define-fun
  w9
  ((x Int)) Int (u9 h9 1 x))
(define-fun
  f8
  ((x Int)) Int (- (w9 x) x))
(define-fun-rec
  u8
  ((x Int) (y Int)) Int (ite (<= x 0) y (f8 (u8 (- x 1) y))))
(define-fun
  v8
  ((x Int) (y Int)) Int (u8 1 y))
(define-fun
  f7
  ((x Int) (y Int)) Int (+ (v8 x y) x))
(define-fun-rec
  u7
  ((x Int) (y Int)) Int (ite (<= x 0) y (f7 (u7 (- x 1) y) x)))
(define-fun
  v7
  ((x Int)) Int (u7 x 0))
(define-fun
  f6
  ((x Int)) Int (- (v7 x) x))
(define-fun-rec
  u6
  ((x Int) (y Int)) Int (ite (<= x 0) y (f6 (u6 (- x 1) y))))
(define-fun
  v6
  ((x Int)) Int (u6 2 x))
(define-fun
  fast
  ((x Int)) Int (- (v6 x) x))
(define-fun
  f1
  ((x Int) (y Int)) Int (+ (v2 x y) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int)) Int (u1 x 0))
(define-fun
  f0
  ((x Int)) Int (- (v1 x) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 2 x))
(define-fun
  small
  ((x Int)) Int (- (v0 x) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
