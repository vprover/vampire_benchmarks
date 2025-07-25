(define-fun-rec
  v4
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v4 (- x 1) y z)))
(define-fun-rec
  v10
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v10 (- x 1) y z)))
(define-fun-rec
  u4
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u4 (- x 1) y z) (v4 (- x 1) y z))))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u3 (- x 1) y) x)))
(define-fun
  v3
  ((x Int)) Int (u3 x 1))
(define-fun-rec
  u10
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u10 (- x 1) y z) (v10 (- x 1) y z))))
(define-fun
  j4
  () Int (+ 2 (* 2 (+ 2 2))))
(define-fun
  w4
  ((x Int)) Int (u4 x 1 j4))
(define-fun
  j10
  () Int (+ 2 (* 2 (+ 2 2))))
(define-fun
  w10
  ((x Int)) Int (u10 x 1 j10))
(define-fun
  h8
  ((x Int)) Int x)
(define-fun
  h6
  ((x Int) (y Int)) Int y)
(define-fun
  h4
  ((x Int)) Int x)
(define-fun
  h10
  ((x Int)) Int x)
(define-fun
  h1
  ((x Int) (y Int)) Int y)
(define-fun
  g9
  ((x Int)) Int (div (- x 1) 2))
(define-fun
  g8
  ((x Int)) Int (- 1 (mod x 2)))
(define-fun
  g7
  ((x Int)) Int x)
(define-fun
  g5
  ((x Int)) Int x)
(define-fun
  g4
  ((x Int) (y Int)) Int y)
(define-fun
  g3
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g10
  ((x Int) (y Int)) Int y)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f9
  ((x Int)) Int (+ x x))
(define-fun-rec
  u9
  ((x Int) (y Int)) Int (ite (<= x 0) y (f9 (u9 (- x 1) y))))
(define-fun
  v9
  ((x Int)) Int (u9 (g9 x) 2))
(define-fun
  f8
  ((x Int)) Int (mod (- 1 (v9 x)) (+ 1 x)))
(define-fun-rec
  u8
  ((x Int) (y Int)) Int (ite (<= x 0) y (f8 (u8 (- x 1) y))))
(define-fun
  v8
  ((x Int)) Int (u8 (g8 x) x))
(define-fun
  f7
  ((x Int)) Int (- (v8 x) 2))
(define-fun-rec
  t7
  ((x Int)) Int (ite (<= (f7 x) 0) x (t7 (+ x 1))))
(define-fun-rec
  u7
  ((x Int)) Int (ite (<= x 0) (t7 0) (t7 (+ (u7 (- x 1)) 1))))
(define-fun
  f6
  ((x Int)) Int (* (+ (u7 x) 1) (w10 x)))
(define-fun-rec
  u6
  ((x Int) (y Int)) Int (ite (<= x 0) y (f6 (u6 (- x 1) y))))
(define-fun
  v6
  ((x Int) (y Int)) Int (u6 1 y))
(define-fun
  f5
  ((x Int) (y Int)) Int (+ (v6 x y) x))
(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (f5 (u5 (- x 1) y) x)))
(define-fun
  v5
  ((x Int)) Int (u5 x 0))
(define-fun
  f2
  ((x Int)) Int (mod (+ 1 (v3 x)) (+ 1 x)))
(define-fun-rec
  t2
  ((x Int)) Int (ite (<= (f2 x) 0) x (t2 (+ x 1))))
(define-fun-rec
  u2
  ((x Int)) Int (ite (<= x 0) (t2 0) (t2 (+ (u2 (- x 1)) 1))))
(define-fun
  f1
  ((x Int)) Int (* (+ (u2 x) 1) (w4 x)))
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
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (v5 c)))))
