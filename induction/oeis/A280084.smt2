(define-funs-rec
  ((u7
    ((x Int) (y Int) (z Int)) Int)
   (v7
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (+ (u7 (- x 1) y z) (v7 (- x 1) y z)))
   (ite (<= x 0) z (u7 (- x 1) y z))))
(define-fun
  w7
  ((x Int)) Int (u7 x 1 2))
(define-funs-rec
  ((u2
    ((x Int) (y Int) (z Int)) Int)
   (v2
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (+ (u2 (- x 1) y z) (v2 (- x 1) y z)))
   (ite (<= x 0) z (u2 (- x 1) y z))))
(define-fun
  w2
  ((x Int)) Int (u2 x 1 2))
(define-fun
  h7
  ((x Int)) Int x)
(define-fun
  h6
  ((x Int)) Int x)
(define-fun
  h5
  ((x Int)) Int x)
(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  g7
  ((x Int)) Int x)
(define-fun
  g6
  ((x Int)) Int (- 1 (mod x 2)))
(define-fun
  g5
  ((x Int)) Int (- 1 (mod x (+ 2 2))))
(define-fun
  g4
  ((x Int)) Int x)
(define-fun
  g3
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int (+ 1 x))
(define-fun
  f6
  ((x Int)) Int (mod (w7 x) (+ 1 x)))
(define-fun-rec
  u6
  ((x Int) (y Int)) Int (ite (<= x 0) y (f6 (u6 (- x 1) y))))
(define-fun
  v6
  ((x Int)) Int (u6 (g6 x) x))
(define-fun
  f5
  ((x Int)) Int (mod (- (v6 x) 1) (+ 1 x)))
(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (f5 (u5 (- x 1) y))))
(define-fun
  v5
  ((x Int)) Int (u5 (g5 x) x))
(define-fun-rec
  t4
  ((x Int)) Int (ite (<= (v5 x) 0) x (t4 (+ x 1))))
(define-fun-rec
  u4
  ((x Int)) Int (ite (<= x 0) (t4 0) (t4 (+ (u4 (- x 1)) 1))))
(define-fun
  fast
  ((x Int)) Int (div (+ (u4 x) 1) 1))
(define-fun
  f3
  ((x Int) (y Int)) Int (- y x))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y) x)))
(define-fun
  v3
  ((x Int)) Int (u3 x 1))
(define-fun
  g1
  ((x Int)) Int (mod (v3 x) 2))
(define-fun
  f1
  ((x Int)) Int (mod (w2 x) (+ 1 x)))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) x))
(define-fun
  f0
  ((x Int)) Int (- (v1 x) 1))
(define-fun-rec
  t0
  ((x Int)) Int (ite (<= (f0 x) 0) x (t0 (+ x 1))))
(define-fun-rec
  u0
  ((x Int)) Int (ite (<= x 0) (t0 0) (t0 (+ (u0 (- x 1)) 1))))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x)))
(define-fun
  small
  ((x Int)) Int (+ (* (div (v0 x) 2) 2) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
