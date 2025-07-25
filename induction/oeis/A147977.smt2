(define-fun-rec
  v8
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v8 (- x 1) y z)))
(define-fun-rec
  v5
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v5 (- x 1) y z)))
(define-fun-rec
  v4
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v4 (- x 1) y z)))
(define-fun-rec
  v3
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v3 (- x 1) y z)))
(define-fun-rec
  v10
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v10 (- x 1) y z)))
(define-fun-rec
  v0
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v0 (- x 1) y z)))
(define-fun-rec
  u8
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u8 (- x 1) y z) (v8 (- x 1) y z))))
(define-fun-rec
  u5
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u5 (- x 1) y z) (v5 (- x 1) y z))))
(define-fun-rec
  u4
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u4 (- x 1) y z) (v4 (- x 1) y z))))
(define-fun-rec
  u3
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u3 (- x 1) y z) (v3 (- x 1) y z))))
(define-fun-rec
  u10
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u10 (- x 1) y z) (v10 (- x 1) y z))))
(define-fun-rec
  u0
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u0 (- x 1) y z) (v0 (- x 1) y z))))
(define-fun
  j8
  () Int (+ 1 (* 2 (+ 2 2))))
(define-fun
  j5
  () Int (+ 2 (+ 2 2)))
(define-fun
  w5
  ((x Int)) Int (u5 x 1 j5))
(define-fun
  j4
  () Int (+ 1 (+ 2 2)))
(define-fun
  w4
  ((x Int)) Int (u4 x 1 j4))
(define-fun
  j3
  () Int (+ 1 2))
(define-fun
  w3
  ((x Int)) Int (u3 x 1 j3))
(define-fun
  j10
  () Int (+ 1 (+ 2 2)))
(define-fun
  w10
  ((x Int)) Int (u10 x 1 j10))
(define-fun
  j0
  () Int (+ 2 (+ 2 2)))
(define-fun
  w0
  ((x Int)) Int (u0 x 1 j0))
(define-fun
  h8
  ((x Int)) Int (div x 2))
(define-fun
  h5
  ((x Int)) Int x)
(define-fun
  h4
  ((x Int)) Int x)
(define-fun
  h3
  ((x Int)) Int x)
(define-fun
  h10
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g9
  ((x Int)) Int (mod x 2))
(define-fun
  g8
  ((x Int) (y Int)) Int y)
(define-fun
  g7
  ((x Int)) Int x)
(define-fun
  g5
  ((x Int) (y Int)) Int y)
(define-fun
  g4
  ((x Int) (y Int)) Int y)
(define-fun
  g3
  ((x Int) (y Int)) Int y)
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g10
  ((x Int) (y Int)) Int y)
(define-fun
  g0
  ((x Int) (y Int)) Int y)
(define-fun
  f9
  () Int (+ 1 2))
(define-fun
  u9
  ((x Int) (y Int)) Int (ite (<= x 0) y f9))
(define-fun
  v9
  ((x Int)) Int (u9 (g9 x) 1))
(define-fun
  w8
  ((x Int)) Int (u8 (h8 x) (v9 x) j8))
(define-fun
  f7
  ((x Int)) Int (+ x x))
(define-fun-rec
  u7
  ((x Int) (y Int)) Int (ite (<= x 0) y (f7 (u7 (- x 1) y))))
(define-fun
  v7
  ((x Int)) Int (u7 x 1))
(define-fun
  f6
  ((x Int)) Int (+ (* x x) x))
(define-fun-rec
  u6
  ((x Int) (y Int)) Int (ite (<= x 0) y (f6 (u6 (- x 1) y))))
(define-fun
  v6
  ((x Int)) Int (u6 1 (v7 x)))
(define-fun
  fast
  ((x Int)) Int (- (- (- (- (w5 x) (v6 x)) (w8 x)) (w10 x)) 1))
(define-fun
  f2
  ((x Int)) Int (+ x x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 x 1))
(define-fun
  f1
  ((x Int)) Int (+ (* x x) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 1 (v2 x)))
(define-fun
  small
  ((x Int)) Int (- (- (+ (- (- (w0 x) (v1 x)) (w3 x)) 1) (w4 x)) 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
