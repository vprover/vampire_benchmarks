(define-fun-rec
  v6
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v6 (- x 1) y z)))
(define-fun-rec
  u7
  ((x Int) (y Int)) Int (ite (<= x 0) y (+ (u7 (- x 1) y) x)))
(define-fun
  j6
  ((x Int)) Int x)
(define-fun
  i6
  () Int (+ 2 2))
(define-fun
  h7
  ((x Int) (y Int)) Int y)
(define-fun
  h6
  () Int (+ 1 2))
(define-fun
  h5
  ((x Int) (y Int)) Int y)
(define-fun
  h3
  ((x Int)) Int x)
(define-fun
  g7
  ((x Int)) Int x)
(define-fun
  g6
  ((x Int) (y Int)) Int y)
(define-fun
  g4
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int) (y Int)) Int y)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f6
  ((x Int) (y Int)) Int (div (u7 x y) x))
(define-fun-rec
  u6
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f6 (u6 (- x 1) y z) (v6 (- x 1) y z))))
(define-fun
  w6
  ((x Int)) Int (u6 h6 i6 x))
(define-fun
  f5
  ((x Int)) Int (- (- (- (w6 x) 1) x) x))
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
  ((x Int)) Int (u4 x 0))
(define-fun
  f3
  ((x Int)) Int (- (v4 x) x))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int)) Int (u3 2 x))
(define-fun
  fast
  ((x Int)) Int (+ (v3 x) 1))
(define-fun
  f2
  ((x Int) (y Int)) Int (+ (div (- y 1) (* x x)) x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y) x)))
(define-fun
  v2
  ((x Int)) Int (u2 x 1))
(define-fun
  f1
  ((x Int)) Int (mod (+ (v2 x) x) 2))
(define-fun-rec
  t1
  ((x Int)) Int (ite (<= (f1 x) 0) x (t1 (+ x 1))))
(define-fun-rec
  u1
  ((x Int)) Int (ite (<= x 0) (t1 0) (t1 (+ (u1 (- x 1)) 1))))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 y))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (v1 x y) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
