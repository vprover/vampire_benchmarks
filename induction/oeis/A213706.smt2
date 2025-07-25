(define-fun
  j8
  ((x Int)) Int x)
(define-fun
  j3
  ((x Int)) Int x)
(define-fun
  h8
  ((x Int)) Int x)
(define-fun
  h7
  ((x Int)) Int (div x 2))
(define-fun
  h6
  ((x Int) (y Int)) Int y)
(define-fun
  h3
  ((x Int)) Int x)
(define-fun
  h2
  ((x Int) (y Int)) Int y)
(define-fun
  g8
  ((x Int) (y Int)) Int (div y 2))
(define-funs-rec
  ((v8
    ((x Int) (y Int) (z Int)) Int)
   (u8
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g8 (u8 (- x 1) y z) (v8 (- x 1) y z)))
   (ite (<= x 0) y (+ (u8 (- x 1) y z) (v8 (- x 1) y z)))))
(define-fun
  w8
  ((x Int)) Int (u8 x 0 x))
(define-fun-rec
  u7
  ((x Int) (y Int)) Int (ite (<= x 0) y (w8 (u7 (- x 1) y))))
(define-fun
  v7
  ((x Int)) Int (u7 1 (h7 x)))
(define-fun-rec
  u6
  ((x Int) (y Int)) Int (ite (<= x 0) y (v7 (u6 (- x 1) y))))
(define-fun
  g6
  ((x Int)) Int x)
(define-fun
  g5
  ((x Int) (y Int)) Int y)
(define-fun
  g4
  ((x Int)) Int x)
(define-fun
  g3
  ((x Int) (y Int)) Int (div y 2))
(define-funs-rec
  ((v3
    ((x Int) (y Int) (z Int)) Int)
   (u3
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g3 (u3 (- x 1) y z) (v3 (- x 1) y z)))
   (ite (<= x 0) y (+ (u3 (- x 1) y z) (v3 (- x 1) y z)))))
(define-fun
  w3
  ((x Int)) Int (u3 x 0 x))
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
  f5
  ((x Int) (y Int)) Int (+ (u6 x y) x))
(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (f5 (u5 (- x 1) y) x)))
(define-fun
  v5
  ((x Int) (y Int)) Int (u5 y 1))
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
  f2
  ((x Int)) Int (- (w3 x) x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  f1
  ((x Int) (y Int)) Int (+ (u2 x y) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 y 0))
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
