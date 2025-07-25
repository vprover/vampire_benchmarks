(define-fun-rec
  v9
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v9 (- x 1) y z)))
(define-fun-rec
  v4
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v4 (- x 1) y z)))
(define-fun-rec
  u9
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u9 (- x 1) y z) (v9 (- x 1) y z))))
(define-fun-rec
  u4
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u4 (- x 1) y z) (v4 (- x 1) y z))))
(define-fun
  j9
  () Int (+ 1 (* 2 (+ 2 2))))
(define-fun
  h9
  ((x Int)) Int (div x 2))
(define-fun
  h6
  () Int (+ 1 (+ 2 2)))
(define-fun
  h4
  ((x Int)) Int (div x 2))
(define-fun
  g9
  ((x Int) (y Int)) Int y)
(define-fun
  g8
  ((x Int)) Int x)
(define-fun
  g5
  ((x Int)) Int (mod x 2))
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
  ((x Int)) Int (mod x 2))
(define-fun
  g0
  ((x Int)) Int x)
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
  f7
  ((x Int)) Int (+ (* x x) x))
(define-fun-rec
  u7
  ((x Int) (y Int)) Int (ite (<= x 0) y (f7 (u7 (- x 1) y))))
(define-fun
  v7
  ((x Int)) Int (u7 1 (v8 x)))
(define-fun
  f6
  ((x Int)) Int (* x x))
(define-fun-rec
  u6
  ((x Int) (y Int)) Int (ite (<= x 0) y (f6 (u6 (- x 1) y))))
(define-fun
  v6
  () Int (u6 1 h6))
(define-fun
  f5
  () Int (+ 1 (+ 2 2)))
(define-fun
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y f5))
(define-fun
  v5
  ((x Int)) Int (u5 (g5 x) 1))
(define-fun
  w4
  ((x Int)) Int (u4 (h4 x) (v5 x) v6))
(define-fun
  f3
  ((x Int)) Int (+ (+ x x) x))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int)) Int (u3 x 1))
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
  f10
  () Int (+ 1 2))
(define-fun
  u10
  ((x Int) (y Int)) Int (ite (<= x 0) y f10))
(define-fun
  v10
  ((x Int)) Int (u10 (g10 x) 1))
(define-fun
  w9
  ((x Int)) Int (u9 (h9 x) (v10 x) j9))
(define-fun
  fast
  ((x Int)) Int (- (- (- (w4 x) (v7 x)) (w9 x)) 1))
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
  f0
  ((x Int)) Int (+ (* 2 (+ x x)) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(define-fun
  small
  ((x Int)) Int (- (- (- (v0 x) (v1 x)) (v3 x)) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
