(define-fun-rec
  u6
  ((x Int) (y Int)) Int (ite (<= x 0) y (+ (u6 (- x 1) y) x)))
(define-fun
  v6
  ((x Int) (y Int)) Int (u6 y x))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (+ (u3 (- x 1) y) x)))
(define-fun
  v3
  ((x Int) (y Int)) Int (u3 y x))
(define-fun
  j5
  ((x Int)) Int x)
(define-fun
  j2
  ((x Int)) Int x)
(define-fun
  i5
  ((x Int)) Int x)
(define-fun
  i2
  ((x Int)) Int x)
(define-fun
  h6
  ((x Int)) Int x)
(define-fun
  h5
  ((x Int)) Int x)
(define-fun
  h3
  ((x Int)) Int x)
(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  g6
  ((x Int) (y Int)) Int y)
(define-fun
  g5
  ((x Int) (y Int)) Int (div y 2))
(define-funs-rec
  ((v5
    ((x Int) (y Int) (z Int)) Int)
   (u5
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g5 (u5 (- x 1) y z) (v5 (- x 1) y z)))
   (ite (<= x 0) y (v6 (u5 (- x 1) y z) (v5 (- x 1) y z)))))
(define-fun
  w5
  ((x Int)) Int (u5 x x x))
(define-fun
  g4
  ((x Int)) Int (mod (* (* x x) x) (+ 1 x)))
(define-fun
  g3
  ((x Int) (y Int)) Int y)
(define-fun
  g2
  ((x Int) (y Int)) Int (div y 2))
(define-funs-rec
  ((v2
    ((x Int) (y Int) (z Int)) Int)
   (u2
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g2 (u2 (- x 1) y z) (v2 (- x 1) y z)))
   (ite (<= x 0) y (v3 (u2 (- x 1) y z) (v2 (- x 1) y z)))))
(define-fun
  w2
  ((x Int)) Int (u2 x x x))
(define-fun
  g1
  ((x Int) (y Int)) Int y)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f4
  ((x Int)) Int
  (+
    (*
      (div (- (* (mod (div (w5 x) 2) 2) (ite (<= (+ 1 x) 0) 1 x)) 1)
        (+ 1 2))
      2)
    1))
(define-fun-rec
  t4
  ((x Int)) Int (ite (<= (f4 x) 0) x (t4 (+ x 1))))
(define-fun-rec
  u4
  ((x Int)) Int (ite (<= x 0) (t4 0) (t4 (+ (u4 (- x 1)) 1))))
(define-fun
  v4
  ((x Int)) Int (u4 (g4 x)))
(define-fun
  f1
  ((x Int)) Int (mod (div (w2 x) 2) 2))
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
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (v4 c)))))
