(define-fun-rec
  v5
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v5 (- x 1) y z)))
(define-fun-rec
  v0
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v0 (- x 1) y z)))
(define-fun
  j5
  ((x Int)) Int x)
(define-fun
  j0
  ((x Int)) Int x)
(define-fun
  h9
  () Int (* 2 (+ 2 2)))
(define-fun
  h7
  ((x Int)) Int x)
(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  g8
  ((x Int)) Int (div (- x 1) 2))
(define-fun
  g7
  ((x Int)) Int (- 1 (mod x 2)))
(define-fun
  g6
  ((x Int) (y Int)) Int (+ 1 y))
(define-fun
  g5
  ((x Int) (y Int)) Int y)
(define-fun
  g3
  ((x Int)) Int (div x 2))
(define-fun
  g2
  ((x Int)) Int (- 1 (mod x 2)))
(define-fun
  g1
  ((x Int) (y Int)) Int (+ 1 y))
(define-fun
  g0
  ((x Int) (y Int)) Int y)
(define-fun
  f9
  ((x Int)) Int (* 2 (* x x)))
(define-fun-rec
  u9
  ((x Int) (y Int)) Int (ite (<= x 0) y (f9 (u9 (- x 1) y))))
(define-fun
  v9
  () Int (u9 1 h9))
(define-fun
  f8
  ((x Int)) Int (+ x x))
(define-fun-rec
  u8
  ((x Int) (y Int)) Int (ite (<= x 0) y (f8 (u8 (- x 1) y))))
(define-fun
  v8
  ((x Int)) Int (u8 (g8 x) 2))
(define-fun
  f7
  ((x Int)) Int (mod (- 1 (v8 x)) (+ 1 x)))
(define-fun-rec
  u7
  ((x Int) (y Int)) Int (ite (<= x 0) y (f7 (u7 (- x 1) y))))
(define-fun
  v7
  ((x Int)) Int (u7 (g7 x) x))
(define-fun
  f6
  ((x Int)) Int (- (v7 x) 2))
(define-fun-rec
  t6
  ((x Int)) Int (ite (<= (f6 x) 0) x (t6 (+ x 1))))
(define-fun-rec
  u6
  ((x Int)) Int (ite (<= x 0) (t6 0) (t6 (+ (u6 (- x 1)) 1))))
(define-fun
  v6
  ((x Int) (y Int)) Int (u6 (g6 x y)))
(define-fun
  f5
  ((x Int) (y Int)) Int (* (+ (v6 x y) 1) (* (* (* x x) x) x)))
(define-fun-rec
  u5
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f5 (u5 (- x 1) y z) (v5 (- x 1) y z))))
(define-fun
  w5
  ((x Int)) Int (u5 2 1 x))
(define-fun
  fast
  ((x Int)) Int (- (w5 x) v9))
(define-fun
  f4
  ((x Int)) Int (* 2 (* x x)))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (f4 (u4 (- x 1) y))))
(define-fun
  v4
  () Int (u4 2 2))
(define-fun
  f3
  ((x Int)) Int (+ x x))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int)) Int (u3 (g3 x) 1))
(define-fun
  f2
  ((x Int)) Int (mod (- 1 (v3 x)) (+ 1 x)))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) x))
(define-fun
  f1
  ((x Int)) Int (- (v2 x) 2))
(define-fun-rec
  t1
  ((x Int)) Int (ite (<= (f1 x) 0) x (t1 (+ x 1))))
(define-fun-rec
  u1
  ((x Int)) Int (ite (<= x 0) (t1 0) (t1 (+ (u1 (- x 1)) 1))))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 (g1 x y)))
(define-fun
  f0
  ((x Int) (y Int)) Int (* (+ (v1 x y) 1) (* (* (* x x) x) x)))
(define-fun-rec
  u0
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))
(define-fun
  w0
  ((x Int)) Int (u0 2 1 x))
(define-fun
  small
  ((x Int)) Int (- (w0 x) v4))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
