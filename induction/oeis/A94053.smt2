(define-fun-rec
  v8
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v8 (- x 1) y z)))
(define-fun-rec
  v6
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v6 (- x 1) y z)))
(define-fun-rec
  u9
  ((x Int) (y Int)) Int (ite (<= x 0) y (+ (u9 (- x 1) y) x)))
(define-fun
  j8
  ((x Int)) Int x)
(define-fun
  j6
  ((x Int)) Int x)
(define-fun
  i8
  () Int (+ 2 (+ 2 2)))
(define-fun
  h9
  ((x Int) (y Int)) Int y)
(define-fun
  h8
  () Int (+ 1 2))
(define-fun
  h7
  ((x Int) (y Int)) Int y)
(define-fun
  h5
  ((x Int) (y Int)) Int y)
(define-fun
  h3
  ((x Int)) Int x)
(define-fun
  h2
  ((x Int)) Int (+ 1 (+ x x)))
(define-fun
  h1
  ((x Int) (y Int)) Int y)
(define-fun
  g9
  ((x Int)) Int x)
(define-fun
  g8
  ((x Int) (y Int)) Int y)
(define-fun
  g6
  ((x Int) (y Int)) Int y)
(define-fun
  g4
  ((x Int)) Int x)
(define-fun
  g3
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f8
  ((x Int) (y Int)) Int (div (u9 x y) x))
(define-fun-rec
  u8
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f8 (u8 (- x 1) y z) (v8 (- x 1) y z))))
(define-fun
  w8
  ((x Int)) Int (u8 h8 i8 x))
(define-fun-rec
  u7
  ((x Int) (y Int)) Int (ite (<= x 0) y (w8 (u7 (- x 1) y))))
(define-fun
  v7
  ((x Int) (y Int)) Int (u7 1 y))
(define-fun
  f6
  ((x Int) (y Int)) Int (* (v7 x y) x))
(define-fun-rec
  u6
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f6 (u6 (- x 1) y z) (v6 (- x 1) y z))))
(define-fun
  w6
  ((x Int)) Int (u6 2 1 x))
(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (w6 (u5 (- x 1) y))))
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
  ((x Int)) Int (u4 x 0))
(define-fun
  fast
  ((x Int)) Int (mod (v4 x) (+ 2 x)))
(define-fun
  f3
  ((x Int) (y Int)) Int (- (ite (<= x 0) 0 (+ 1 y)) x))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y) x)))
(define-fun
  v3
  ((x Int)) Int (u3 x x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (v3 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 1 (h2 x)))
(define-fun
  f1
  ((x Int)) Int (- (v2 x) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 1 y))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (v1 x y) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 0))
(define-fun
  small
  ((x Int)) Int (- (v0 x) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
