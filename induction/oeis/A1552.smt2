(define-fun-rec
  v8
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v8 (- x 1) y z)))
(define-fun-rec
  v6
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v6 (- x 1) y z)))
(define-fun-rec
  u8
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u8 (- x 1) y z) (v8 (- x 1) y z))))
(define-fun-rec
  u6
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u6 (- x 1) y z) (v6 (- x 1) y z))))
(define-fun
  j6
  () Int (+ 1 (* 2 (+ 2 2))))
(define-fun
  h8
  ((x Int)) Int (div x 2))
(define-fun
  h6
  ((x Int)) Int (div x 2))
(define-fun
  h10
  () Int (+ 1 (+ 2 2)))
(define-fun
  g9
  ((x Int)) Int (mod x 2))
(define-fun
  g8
  ((x Int) (y Int)) Int y)
(define-fun
  g7
  ((x Int)) Int (mod x 2))
(define-fun
  g6
  ((x Int) (y Int)) Int y)
(define-fun
  g5
  ((x Int)) Int x)
(define-fun
  g3
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f9
  () Int (+ 1 (+ 2 2)))
(define-fun
  u9
  ((x Int) (y Int)) Int (ite (<= x 0) y f9))
(define-fun
  v9
  ((x Int)) Int (u9 (g9 x) 1))
(define-fun
  f7
  () Int (+ 1 2))
(define-fun
  u7
  ((x Int) (y Int)) Int (ite (<= x 0) y f7))
(define-fun
  v7
  ((x Int)) Int (u7 (g7 x) 1))
(define-fun
  w6
  ((x Int)) Int (u6 (h6 x) (v7 x) j6))
(define-fun
  f5
  ((x Int)) Int (+ x x))
(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (f5 (u5 (- x 1) y))))
(define-fun
  v5
  ((x Int)) Int (u5 x 1))
(define-fun
  f4
  ((x Int)) Int (+ (* x x) x))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (f4 (u4 (- x 1) y))))
(define-fun
  v4
  ((x Int)) Int (u4 1 (v5 x)))
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
  f2
  ((x Int)) Int (* (+ 1 x) x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 1 (v3 x)))
(define-fun
  f10
  ((x Int)) Int (* x x))
(define-fun-rec
  u10
  ((x Int) (y Int)) Int (ite (<= x 0) y (f10 (u10 (- x 1) y))))
(define-fun
  v10
  () Int (u10 1 h10))
(define-fun
  w8
  ((x Int)) Int (u8 (h8 x) (v9 x) v10))
(define-fun
  fast
  ((x Int)) Int (+ (+ (+ 1 (v4 x)) (w6 x)) (w8 x)))
(define-fun
  f1
  ((x Int)) Int (+ (* 2 (+ x x)) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 x 1))
(define-fun
  f0
  ((x Int)) Int (+ (+ x x) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(define-fun
  small
  ((x Int)) Int (+ (+ (+ 1 (v0 x)) (v1 x)) (v2 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
