(define-funs-rec
  ((u8
    ((x Int) (y Int) (z Int)) Int)
   (v8
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (+ (u8 (- x 1) y z) (v8 (- x 1) y z)))
   (ite (<= x 0) z (u8 (- x 1) y z))))
(define-fun
  w8
  ((x Int)) Int (u8 x 1 2))
(define-fun
  j4
  ((x Int)) Int x)
(define-fun
  j0
  ((x Int)) Int x)
(define-fun
  h8
  ((x Int)) Int x)
(define-fun
  h7
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
  g8
  ((x Int)) Int x)
(define-fun
  g7
  ((x Int)) Int (- 1 (mod x 2)))
(define-fun
  g6
  ((x Int)) Int (+ 1 x))
(define-fun
  g4
  ((x Int) (y Int)) Int (+ 1 (+ y y)))
(define-fun
  g3
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int)) Int (+ 1 x))
(define-fun
  g0
  ((x Int) (y Int)) Int (+ 1 (+ y y)))
(define-fun
  f7
  ((x Int)) Int (mod (w8 x) (+ 1 x)))
(define-fun-rec
  u7
  ((x Int) (y Int)) Int (ite (<= x 0) y (f7 (u7 (- x 1) y))))
(define-fun
  v7
  ((x Int)) Int (u7 (g7 x) x))
(define-fun
  f6
  ((x Int)) Int (- (v7 x) 1))
(define-fun-rec
  t6
  ((x Int)) Int (ite (<= (f6 x) 0) x (t6 (+ x 1))))
(define-fun-rec
  u6
  ((x Int)) Int (ite (<= x 0) (t6 0) (t6 (+ (u6 (- x 1)) 1))))
(define-fun
  v6
  ((x Int)) Int (u6 (g6 x)))
(define-fun
  f5
  ((x Int)) Int (+ (v6 x) 1))
(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (f5 (u5 (- x 1) y))))
(define-fun
  v5
  ((x Int) (y Int)) Int (u5 1 y))
(define-fun
  f4
  ((x Int) (y Int)) Int (* (v5 x y) x))
(define-funs-rec
  ((u4
    ((x Int) (y Int) (z Int)) Int)
   (v4
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f4 (u4 (- x 1) y z) (v4 (- x 1) y z)))
   (ite (<= x 0) z (g4 (u4 (- x 1) y z) (v4 (- x 1) y z)))))
(define-fun
  w4
  ((x Int)) Int (u4 2 1 x))
(define-fun
  f3
  ((x Int) (y Int)) Int (+ 1 (+ x y)))
(define-funs-rec
  ((u3
    ((x Int) (y Int) (z Int)) Int)
   (v3
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f3 (u3 (- x 1) y z) (v3 (- x 1) y z)))
   (ite (<= x 0) z (u3 (- x 1) y z))))
(define-fun
  w3
  ((x Int)) Int (u3 x 0 1))
(define-fun
  f2
  ((x Int)) Int (mod (w3 x) (+ 1 x)))
(define-fun-rec
  t2
  ((x Int)) Int (ite (<= (f2 x) 0) x (t2 (+ x 1))))
(define-fun-rec
  u2
  ((x Int)) Int (ite (<= x 0) (t2 0) (t2 (+ (u2 (- x 1)) 1))))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x)))
(define-fun
  f1
  ((x Int)) Int (+ (v2 x) 1))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 1 y))
(define-fun
  f0
  ((x Int) (y Int)) Int (* (v1 x y) x))
(define-funs-rec
  ((u0
    ((x Int) (y Int) (z Int)) Int)
   (v0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z)))))
(define-fun
  w0
  ((x Int)) Int (u0 2 1 x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (w0 c) (w4 c)))))
