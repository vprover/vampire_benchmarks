(define-fun-rec
  v4
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v4 (- x 1) y z)))
(define-fun-rec
  v0
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v0 (- x 1) y z)))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u3 (- x 1) y) x)))
(define-fun
  v3
  ((x Int)) Int (u3 x x))
(define-fun
  j4
  ((x Int)) Int x)
(define-fun
  j0
  ((x Int)) Int x)
(define-fun
  h5
  ((x Int) (y Int)) Int y)
(define-fun
  h3
  ((x Int)) Int x)
(define-fun
  h1
  ((x Int) (y Int)) Int y)
(define-fun
  g7
  ((x Int)) Int x)
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
  g0
  ((x Int) (y Int)) Int y)
(define-fun
  f7
  ((x Int)) Int (* (+ 1 (mod (div x 2) 2)) (+ 1 x)))
(define-fun-rec
  u7
  ((x Int) (y Int)) Int (ite (<= x 0) y (f7 (u7 (- x 1) y))))
(define-fun
  v7
  ((x Int)) Int (u7 x 1))
(define-fun
  f6
  ((x Int)) Int (mod (ite (<= (mod (v7 x) (+ 1 x)) 0) 1 0) (+ 1 x)))
(define-fun-rec
  t6
  ((x Int)) Int (ite (<= (f6 x) 0) x (t6 (+ x 1))))
(define-fun-rec
  u6
  ((x Int)) Int (ite (<= x 0) (t6 0) (t6 (+ (u6 (- x 1)) 1))))
(define-fun
  f5
  ((x Int)) Int (+ (u6 x) 1))
(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (f5 (u5 (- x 1) y))))
(define-fun
  v5
  ((x Int) (y Int)) Int (u5 1 y))
(define-fun
  f4
  ((x Int) (y Int)) Int (- (* (v5 x y) x) 1))
(define-fun-rec
  u4
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f4 (u4 (- x 1) y z) (v4 (- x 1) y z))))
(define-fun
  w4
  ((x Int)) Int (u4 2 1 x))
(define-fun
  fast
  ((x Int)) Int (* (div (+ (w4 x) 1) 2) (+ 1 2)))
(define-fun
  f2
  ((x Int)) Int (mod (mod (v3 x) (+ 1 x)) 2))
(define-fun-rec
  t2
  ((x Int)) Int (ite (<= (f2 x) 0) x (t2 (+ x 1))))
(define-fun-rec
  u2
  ((x Int)) Int (ite (<= x 0) (t2 0) (t2 (+ (u2 (- x 1)) 1))))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (u2 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 1 y))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (* (v1 x y) x) 1))
(define-fun-rec
  u0
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))
(define-fun
  w0
  ((x Int)) Int (u0 2 1 x))
(define-fun
  small
  ((x Int)) Int (* (div (w0 x) 2) (+ 1 2)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
