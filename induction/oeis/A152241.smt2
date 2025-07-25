(define-fun-rec
  v5
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v5 (- x 1) y z)))
(define-fun-rec
  v0
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v0 (- x 1) y z)))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u4 (- x 1) y) x)))
(define-fun
  v4
  ((x Int)) Int (u4 x 1))
(define-fun
  j7
  ((x Int)) Int x)
(define-fun
  j5
  ((x Int)) Int x)
(define-fun
  j2
  ((x Int)) Int x)
(define-fun
  j0
  ((x Int)) Int x)
(define-fun
  h9
  ((x Int)) Int x)
(define-fun
  h6
  ((x Int) (y Int)) Int y)
(define-fun
  h1
  ((x Int) (y Int)) Int y)
(define-fun
  g9
  ((x Int)) Int (- 1 (mod x 2)))
(define-fun
  g8
  ((x Int) (y Int)) Int (+ 1 y))
(define-fun
  g7
  ((x Int) (y Int)) Int (+ 1 y))
(define-fun
  g5
  ((x Int) (y Int)) Int y)
(define-fun
  g4
  ((x Int)) Int x)
(define-fun
  g3
  ((x Int) (y Int)) Int (+ 1 y))
(define-fun
  g2
  ((x Int) (y Int)) Int (+ 1 y))
(define-fun
  g10
  ((x Int)) Int (div (- x 1) 2))
(define-fun
  g0
  ((x Int) (y Int)) Int y)
(define-fun
  f3
  ((x Int)) Int (mod (+ 1 (v4 x)) (+ 1 x)))
(define-fun-rec
  t3
  ((x Int)) Int (ite (<= (f3 x) 0) x (t3 (+ x 1))))
(define-fun-rec
  u3
  ((x Int)) Int (ite (<= x 0) (t3 0) (t3 (+ (u3 (- x 1)) 1))))
(define-fun
  v3
  ((x Int) (y Int)) Int (u3 (g3 x y)))
(define-fun
  f2
  ((x Int) (y Int)) Int (+ (* (v3 x y) x) x))
(define-funs-rec
  ((u2
    ((x Int) (y Int) (z Int)) Int)
   (v2
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f2 (u2 (- x 1) y z) (v2 (- x 1) y z)))
   (ite (<= x 0) z (g2 (u2 (- x 1) y z) (v2 (- x 1) y z)))))
(define-fun
  w2
  ((x Int)) Int (u2 2 1 x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (w2 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 1 y))
(define-fun
  f10
  ((x Int)) Int (+ x x))
(define-fun-rec
  u10
  ((x Int) (y Int)) Int (ite (<= x 0) y (f10 (u10 (- x 1) y))))
(define-fun
  v10
  ((x Int)) Int (u10 (g10 x) 2))
(define-fun
  f9
  ((x Int)) Int (mod (- 1 (v10 x)) (+ 1 x)))
(define-fun-rec
  u9
  ((x Int) (y Int)) Int (ite (<= x 0) y (f9 (u9 (- x 1) y))))
(define-fun
  v9
  ((x Int)) Int (u9 (g9 x) x))
(define-fun
  f8
  ((x Int)) Int (- (v9 x) 2))
(define-fun-rec
  t8
  ((x Int)) Int (ite (<= (f8 x) 0) x (t8 (+ x 1))))
(define-fun-rec
  u8
  ((x Int)) Int (ite (<= x 0) (t8 0) (t8 (+ (u8 (- x 1)) 1))))
(define-fun
  v8
  ((x Int) (y Int)) Int (u8 (g8 x y)))
(define-fun
  f7
  ((x Int) (y Int)) Int (+ (* (v8 x y) x) x))
(define-funs-rec
  ((u7
    ((x Int) (y Int) (z Int)) Int)
   (v7
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f7 (u7 (- x 1) y z) (v7 (- x 1) y z)))
   (ite (<= x 0) z (g7 (u7 (- x 1) y z) (v7 (- x 1) y z)))))
(define-fun
  w7
  ((x Int)) Int (u7 2 1 x))
(define-fun-rec
  u6
  ((x Int) (y Int)) Int (ite (<= x 0) y (w7 (u6 (- x 1) y))))
(define-fun
  v6
  ((x Int) (y Int)) Int (u6 1 y))
(define-fun
  f5
  ((x Int) (y Int)) Int (* (v6 x y) (* x x)))
(define-fun-rec
  u5
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f5 (u5 (- x 1) y z) (v5 (- x 1) y z))))
(define-fun
  w5
  ((x Int)) Int (u5 2 1 x))
(define-fun
  f0
  ((x Int) (y Int)) Int (* (v1 x y) (* x x)))
(define-fun-rec
  u0
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))
(define-fun
  w0
  ((x Int)) Int (u0 2 1 x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (w0 c) (w5 c)))))
