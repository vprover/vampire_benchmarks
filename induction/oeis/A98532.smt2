(define-funs-rec
  ((u8
    ((x Int) (y Int) (z Int)) Int)
   (v8
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (+ (u8 (- x 1) y z) (v8 (- x 1) y z)))
   (ite (<= x 0) z (u8 (- x 1) y z))))
(define-funs-rec
  ((u3
    ((x Int) (y Int) (z Int)) Int)
   (v3
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (+ (u3 (- x 1) y z) (v3 (- x 1) y z)))
   (ite (<= x 0) z (u3 (- x 1) y z))))
(define-fun
  w3
  ((x Int) (y Int)) Int (u3 y 0 1))
(define-funs-rec
  ((u2
    ((x Int) (y Int) (z Int)) Int)
   (v2
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (* (u2 (- x 1) y z) (v2 (- x 1) y z)))
   (ite (<= x 0) z (u2 (- x 1) y z))))
(define-fun
  w2
  ((x Int) (y Int)) Int (u2 y x x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (w2 (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 2 (w3 x y)))
(define-fun
  j2
  ((x Int)) Int x)
(define-fun
  i2
  ((x Int)) Int x)
(define-fun
  h8
  ((x Int)) Int (- x 2))
(define-fun
  w8
  ((x Int)) Int (u8 (h8 x) 1 1))
(define-fun
  h7
  ((x Int)) Int (ite (<= x 0) 0 (w8 x)))
(define-fun
  h5
  ((x Int) (y Int)) Int y)
(define-fun
  h3
  ((x Int) (y Int)) Int y)
(define-fun
  h2
  ((x Int) (y Int)) Int y)
(define-fun
  g8
  ((x Int)) Int x)
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
  ((x Int)) Int x)
(define-fun
  f7
  ((x Int)) Int (* x x))
(define-fun-rec
  u7
  ((x Int) (y Int)) Int (ite (<= x 0) y (f7 (u7 (- x 1) y))))
(define-fun
  v7
  ((x Int)) Int (u7 1 (h7 x)))
(define-fun
  f6
  ((x Int)) Int (* (* x x) x))
(define-fun-rec
  u6
  ((x Int) (y Int)) Int (ite (<= x 0) y (f6 (u6 (- x 1) y))))
(define-fun
  v6
  ((x Int)) Int (u6 1 (v7 x)))
(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (v6 (u5 (- x 1) y))))
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
  f0
  ((x Int) (y Int)) Int (+ (v1 x y) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 0))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (v4 c)))))
