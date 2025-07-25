(define-fun-rec
  v7
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v7 (- x 1) y z)))
(define-fun-rec
  v4
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v4 (- x 1) y z)))
(define-fun-rec
  v0
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v0 (- x 1) y z)))
(define-fun-rec
  u7
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u7 (- x 1) y z) (v7 (- x 1) y z))))
(define-fun-rec
  u4
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u4 (- x 1) y z) (v4 (- x 1) y z))))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (- (u2 (- x 1) y) x)))
(define-fun
  v2
  ((x Int)) Int (u2 x x))
(define-fun-rec
  u0
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u0 (- x 1) y z) (v0 (- x 1) y z))))
(define-fun
  j7
  () Int (+ 1 2))
(define-fun
  w7
  ((x Int)) Int (u7 x 1 j7))
(define-fun
  j4
  () Int (+ 2 2))
(define-fun
  w4
  ((x Int)) Int (u4 x 1 j4))
(define-fun
  j0
  () Int (+ 2 (+ 2 2)))
(define-fun
  w0
  ((x Int)) Int (u0 x 1 j0))
(define-fun
  h7
  ((x Int)) Int x)
(define-fun
  h4
  ((x Int)) Int x)
(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g9
  ((x Int)) Int x)
(define-fun
  g8
  ((x Int)) Int x)
(define-fun
  g7
  ((x Int) (y Int)) Int y)
(define-fun
  g6
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
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int) (y Int)) Int y)
(define-fun
  f9
  ((x Int)) Int (+ x x))
(define-fun-rec
  u9
  ((x Int) (y Int)) Int (ite (<= x 0) y (f9 (u9 (- x 1) y))))
(define-fun
  v9
  ((x Int)) Int (u9 x 1))
(define-fun
  f8
  ((x Int)) Int (+ x x))
(define-fun-rec
  u8
  ((x Int) (y Int)) Int (ite (<= x 0) y (f8 (u8 (- x 1) y))))
(define-fun
  v8
  ((x Int)) Int (u8 x 1))
(define-fun
  f6
  ((x Int)) Int (+ x x))
(define-fun-rec
  u6
  ((x Int) (y Int)) Int (ite (<= x 0) y (f6 (u6 (- x 1) y))))
(define-fun
  v6
  ((x Int)) Int (u6 x 1))
(define-fun
  f5
  ((x Int)) Int (+ (* x x) x))
(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (f5 (u5 (- x 1) y))))
(define-fun
  v5
  ((x Int)) Int (u5 1 (v6 x)))
(define-fun
  f3
  ((x Int)) Int (+ x x))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int)) Int (u3 x 1))
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
  fast
  ((x Int)) Int
  (* (- (- (+ (- (+ (div (v5 x) 2) (w7 x)) (v8 x)) 1) (v9 x)) 1)
    (v10 x)))
(define-fun
  f1
  ((x Int)) Int (* x (v2 x)))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 1 (v3 x)))
(define-fun
  small
  ((x Int)) Int (- (- (w0 x) (v1 x)) (w4 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
