(define-funs-rec
  ((u3
    ((x Int) (y Int) (z Int)) Int)
   (v3
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (+ (u3 (- x 1) y z) (v3 (- x 1) y z)))
   (ite (<= x 0) z (u3 (- x 1) y z))))
(define-fun
  i8
  () Int (+ 1 (+ 2 2)))
(define-fun
  h8
  ((x Int)) Int x)
(define-fun
  h7
  ((x Int) (y Int)) Int y)
(define-fun
  h5
  ((x Int) (y Int)) Int y)
(define-fun
  h3
  ((x Int)) Int (+ 2 (+ x x)))
(define-fun
  w3
  ((x Int)) Int (u3 (h3 x) 2 1))
(define-fun
  h2
  ((x Int) (y Int)) Int y)
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  g8
  ((x Int)) Int x)
(define-fun
  g6
  ((x Int)) Int x)
(define-fun
  g4
  ((x Int)) Int x)
(define-fun
  g3
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int) (y Int)) Int y)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f8
  ((x Int) (y Int)) Int (+ (+ (- x y) x) x))
(define-funs-rec
  ((u8
    ((x Int) (y Int) (z Int)) Int)
   (v8
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f8 (u8 (- x 1) y z) (v8 (- x 1) y z)))
   (ite (<= x 0) z (u8 (- x 1) y z))))
(define-fun
  w8
  ((x Int)) Int (u8 x i8 2))
(define-fun
  f7
  ((x Int)) Int
  (- (- (- (- (- (w8 x) 2) 2) (div (+ (* x x) x) 2)) x) x))
(define-fun-rec
  u7
  ((x Int) (y Int)) Int (ite (<= x 0) y (f7 (u7 (- x 1) y))))
(define-fun
  v7
  ((x Int) (y Int)) Int (u7 1 y))
(define-fun
  f6
  ((x Int) (y Int)) Int (+ (v7 x y) x))
(define-fun-rec
  u6
  ((x Int) (y Int)) Int (ite (<= x 0) y (f6 (u6 (- x 1) y) x)))
(define-fun
  v6
  ((x Int)) Int (u6 x 1))
(define-fun
  f5
  ((x Int)) Int (- (- (- (* (+ (v6 x) x) 2) 1) x) x))
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
  ((x Int)) Int (u4 x 2))
(define-fun
  fast
  ((x Int)) Int (div (+ (v4 x) x) 2))
(define-fun
  f2
  ((x Int)) Int
  (- (- (- (- (- (w3 x) 2) 2) (div (+ (* x x) x) 2)) x) x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int) (y Int)) Int (u2 1 y))
(define-fun
  f1
  ((x Int) (y Int)) Int (+ (v2 x y) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 y x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (v1 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(define-fun
  small
  ((x Int)) Int (+ (v0 x) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
