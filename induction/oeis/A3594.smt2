(define-fun-rec
  v5
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v5 (- x 1) y z)))
(define-fun
  j5
  ((x Int)) Int x)
(define-fun
  h8
  () Int (+ 1 (* 2 (+ 2 (* 2 (+ 2 2))))))
(define-fun
  h4
  ((x Int)) Int x)
(define-fun
  h3
  () Int (+ 1 2))
(define-fun
  g6
  ((x Int) (y Int)) Int y)
(define-fun
  g5
  ((x Int) (y Int)) Int y)
(define-fun
  g2
  () Int (+ 1 2))
(define-fun
  g1
  ((x Int) (y Int)) Int y)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f8
  ((x Int)) Int (* x x))
(define-fun-rec
  u8
  ((x Int) (y Int)) Int (ite (<= x 0) y (f8 (u8 (- x 1) y))))
(define-fun
  v8
  () Int (u8 2 h8))
(define-fun
  f7
  ((x Int)) Int (* (* x x) x))
(define-fun-rec
  u7
  ((x Int) (y Int)) Int (ite (<= x 0) y (f7 (u7 (- x 1) y))))
(define-fun
  v7
  () Int (u7 1 v8))
(define-fun
  f6
  ((x Int)) Int (mod v7 (+ 1 x)))
(define-fun-rec
  t6
  ((x Int)) Int (ite (<= (f6 x) 0) x (t6 (+ x 1))))
(define-fun-rec
  u6
  ((x Int)) Int (ite (<= x 0) (t6 0) (t6 (+ (u6 (- x 1)) 1))))
(define-fun
  v6
  ((x Int) (y Int)) Int (u6 y))
(define-fun
  f5
  ((x Int) (y Int)) Int (+ (v6 x y) x))
(define-fun-rec
  u5
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f5 (u5 (- x 1) y z) (v5 (- x 1) y z))))
(define-fun
  w5
  ((x Int)) Int (u5 2 2 x))
(define-fun
  fast
  ((x Int)) Int (div (w5 x) 2))
(define-fun
  f4
  ((x Int)) Int (+ 1 (+ x x)))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (f4 (u4 (- x 1) y))))
(define-fun
  v4
  ((x Int)) Int (u4 2 x))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (v4 (u3 (- x 1) y))))
(define-fun
  v3
  () Int (u3 2 h3))
(define-fun
  f2
  ((x Int)) Int (* x x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  () Int (u2 g2 v3))
(define-fun
  f1
  ((x Int)) Int (mod v2 (+ 1 x)))
(define-fun-rec
  t1
  ((x Int)) Int (ite (<= (f1 x) 0) x (t1 (+ x 1))))
(define-fun-rec
  u1
  ((x Int)) Int (ite (<= x 0) (t1 0) (t1 (+ (u1 (- x 1)) 1))))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 y))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (v1 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 0))
(define-fun
  small
  ((x Int)) Int (+ (v0 x) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
