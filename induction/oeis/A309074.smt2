(define-fun-rec
  v5
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v5 (- x 1) y z)))
(define-fun-rec
  v0
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v0 (- x 1) y z)))
(define-fun
  u9
  ((x Int) (y Int)) Int (ite (<= x 0) y 1))
(define-fun
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y 1))
(define-fun
  v4
  ((x Int)) Int (u4 x x))
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
  h8
  ((x Int) (y Int)) Int y)
(define-fun
  h7
  () Int (+ 2 (+ 2 2)))
(define-fun
  h6
  ((x Int) (y Int)) Int y)
(define-fun
  h4
  ((x Int)) Int x)
(define-fun
  h3
  ((x Int) (y Int)) Int y)
(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  h1
  ((x Int) (y Int)) Int y)
(define-fun
  g9
  ((x Int)) Int (mod x 2))
(define-fun
  v9
  ((x Int)) Int (u9 (g9 x) 2))
(define-fun
  g7
  ((x Int) (y Int)) Int (div y 2))
(define-fun
  g5
  ((x Int) (y Int)) Int y)
(define-fun
  g4
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int) (y Int)) Int (div y 2))
(define-fun
  g0
  ((x Int) (y Int)) Int y)
(define-fun
  f8
  ((x Int)) Int (mod (+ (v9 x) x) (+ 1 x)))
(define-fun-rec
  u8
  ((x Int) (y Int)) Int (ite (<= x 0) y (f8 (u8 (- x 1) y))))
(define-fun
  v8
  ((x Int) (y Int)) Int (u8 1 y))
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
  ((x Int)) Int (u7 h7 1 x))
(define-fun-rec
  u6
  ((x Int) (y Int)) Int (ite (<= x 0) y (w7 (u6 (- x 1) y))))
(define-fun
  v6
  ((x Int) (y Int)) Int (u6 1 y))
(define-fun
  f5
  ((x Int) (y Int)) Int (* (v6 x y) x))
(define-fun-rec
  u5
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f5 (u5 (- x 1) y z) (v5 (- x 1) y z))))
(define-fun
  w5
  ((x Int)) Int (u5 2 1 x))
(define-fun
  f3
  ((x Int)) Int (mod (+ (v4 x) x) 2))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int) (y Int)) Int (u3 1 y))
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
  ((x Int)) Int (u2 x 1 x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (w2 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 1 y))
(define-fun
  f0
  ((x Int) (y Int)) Int (* (v1 x y) x))
(define-fun-rec
  u0
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))
(define-fun
  w0
  ((x Int)) Int (u0 2 1 x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (w0 c) (w5 c)))))
