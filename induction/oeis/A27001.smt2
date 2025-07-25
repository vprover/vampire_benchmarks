(define-funs-rec
  ((u5
    ((x Int) (y Int) (z Int)) Int)
   (v5
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (+ (u5 (- x 1) y z) (v5 (- x 1) y z)))
   (ite (<= x 0) z (u5 (- x 1) y z))))
(define-funs-rec
  ((u11
    ((x Int) (y Int) (z Int)) Int)
   (v11
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (+ (u11 (- x 1) y z) (v11 (- x 1) y z)))
   (ite (<= x 0) z (u11 (- x 1) y z))))
(define-fun
  j5
  () Int (+ 1 2))
(define-fun
  j11
  () Int (+ 1 2))
(define-fun
  i5
  () Int (+ 2 2))
(define-fun
  w5
  ((x Int)) Int (u5 x i5 j5))
(define-fun
  i11
  () Int (+ 2 2))
(define-fun
  w11
  ((x Int)) Int (u11 x i11 j11))
(define-fun
  h8
  ((x Int) (y Int)) Int y)
(define-fun
  h6
  ((x Int)) Int (+ x x))
(define-fun
  h5
  ((x Int)) Int x)
(define-fun
  h4
  ((x Int) (y Int)) Int y)
(define-fun
  h2
  ((x Int) (y Int)) Int y)
(define-fun
  h11
  ((x Int)) Int x)
(define-fun
  h10
  ((x Int) (y Int)) Int (+ 2 y))
(define-fun
  h0
  ((x Int)) Int (+ 2 (+ x x)))
(define-fun
  g9
  ((x Int)) Int x)
(define-fun
  g7
  ((x Int)) Int x)
(define-fun
  g5
  ((x Int)) Int x)
(define-fun
  g3
  ((x Int)) Int x)
(define-fun
  g11
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  f4
  ((x Int)) Int (- (- (- (- (w5 x) 2) x) x) x))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (f4 (u4 (- x 1) y))))
(define-fun
  v4
  ((x Int) (y Int)) Int (u4 1 y))
(define-fun
  f3
  ((x Int) (y Int)) Int (+ (v4 x y) x))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y) x)))
(define-fun
  v3
  ((x Int)) Int (u3 x 1))
(define-fun
  f2
  ((x Int)) Int (- (- (v3 x) x) x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int) (y Int)) Int (u2 1 y))
(define-fun
  f10
  ((x Int)) Int (- (- (- (- (w11 x) 2) x) x) x))
(define-fun-rec
  u10
  ((x Int) (y Int)) Int (ite (<= x 0) y (f10 (u10 (- x 1) y))))
(define-fun
  v10
  ((x Int) (y Int)) Int (u10 1 (h10 x y)))
(define-fun
  f9
  ((x Int) (y Int)) Int (+ (v10 x y) x))
(define-fun-rec
  u9
  ((x Int) (y Int)) Int (ite (<= x 0) y (f9 (u9 (- x 1) y) x)))
(define-fun
  v9
  ((x Int)) Int (u9 x 1))
(define-fun
  f8
  ((x Int)) Int (- (- (v9 x) x) x))
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
  ((x Int)) Int (u7 x 1))
(define-fun
  f6
  ((x Int)) Int (- (- (- (* (+ (v7 x) x) 2) 1) x) x))
(define-fun-rec
  u6
  ((x Int) (y Int)) Int (ite (<= x 0) y (f6 (u6 (- x 1) y))))
(define-fun
  v6
  ((x Int)) Int (u6 1 (h6 x)))
(define-fun
  fast
  ((x Int)) Int (div (+ (v6 x) 1) 2))
(define-fun
  f1
  ((x Int) (y Int)) Int (+ (v2 x y) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int)) Int (u1 x 1))
(define-fun
  f0
  ((x Int)) Int (- (- (v1 x) x) 1))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 1 (h0 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
