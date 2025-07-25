(define-fun-rec
  v8
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v8 (- x 1) y z)))
(define-fun-rec
  v7
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v7 (- x 1) y z)))
(define-fun-rec
  v3
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v3 (- x 1) y z)))
(define-fun-rec
  u8
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u8 (- x 1) y z) (v8 (- x 1) y z))))
(define-fun-rec
  u7
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u7 (- x 1) y z) (v7 (- x 1) y z))))
(define-fun-rec
  u3
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u3 (- x 1) y z) (v3 (- x 1) y z))))
(define-fun
  j8
  () Int (+ 1 (* 2 (+ 2 2))))
(define-fun
  j7
  () Int (+ 1 (+ 2 (+ 2 2))))
(define-fun
  w7
  ((x Int)) Int (u7 x 1 j7))
(define-fun
  h8
  ((x Int)) Int (div x 2))
(define-fun
  h7
  ((x Int)) Int x)
(define-fun
  h5
  () Int (+ 1 (+ 2 2)))
(define-fun
  h3
  ((x Int)) Int (div x 2))
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
  ((x Int) (y Int)) Int y)
(define-fun
  g6
  ((x Int)) Int x)
(define-fun
  g4
  ((x Int)) Int (mod x 2))
(define-fun
  g3
  ((x Int) (y Int)) Int y)
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int) (y Int)) Int (+ (* 2 (+ (+ y y) y)) y))
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
  ((x Int)) Int (* x x))
(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (f5 (u5 (- x 1) y))))
(define-fun
  v5
  () Int (u5 1 h5))
(define-fun
  f4
  () Int (+ 1 (+ 2 2)))
(define-fun
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y f4))
(define-fun
  v4
  ((x Int)) Int (u4 (g4 x) 1))
(define-fun
  w3
  ((x Int)) Int (u3 (h3 x) (v4 x) v5))
(define-fun
  fast
  ((x Int)) Int (- (+ (- (w3 x) (v6 x)) (w7 x)) (w8 x)))
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
  ((x Int)) Int (+ (+ x x) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 x 1))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (+ (* 2 (+ x x)) x) y))
(define-funs-rec
  ((u0
    ((x Int) (y Int) (z Int)) Int)
   (v0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z)))))
(define-fun
  w0
  ((x Int)) Int (u0 x 2 2))
(define-fun
  small
  ((x Int)) Int (- (- (w0 x) (v1 x)) (v2 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
