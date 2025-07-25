(define-fun
  i4
  ((x Int)) Int (ite (<= x 0) 1 2))
(define-fun
  h5
  () Int (+ 2 (* 2 (+ 2 (+ 2 2)))))
(define-fun
  h4
  ((x Int)) Int (- x 1))
(define-fun
  h3
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g5
  ((x Int)) Int (mod x (+ 2 2)))
(define-fun
  g4
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int)) Int (mod x (+ 2 2)))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f5
  ((x Int)) Int (ite (<= (mod x 2) 0) 1 (div x 2)))
(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (f5 (u5 (- x 1) y))))
(define-fun
  v5
  ((x Int)) Int (u5 (g5 x) h5))
(define-fun
  f4
  ((x Int) (y Int)) Int (+ (* (+ (v5 x) 1) x) y))
(define-funs-rec
  ((u4
    ((x Int) (y Int) (z Int)) Int)
   (v4
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f4 (u4 (- x 1) y z) (v4 (- x 1) y z)))
   (ite (<= x 0) z (u4 (- x 1) y z))))
(define-fun
  w4
  ((x Int)) Int (u4 (h4 x) (i4 x) 1))
(define-fun
  f3
  ((x Int)) Int (div (w4 x) (+ 1 (mod x 2))))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int)) Int (u3 1 x))
(define-fun
  f2
  ((x Int)) Int (+ 2 (+ x x)))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  () Int (u2 2 2))
(define-fun
  f1
  ((x Int)) Int (ite (<= (mod x 2) 0) 1 (div x 2)))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) v2))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (* (+ (v1 x) 1) x) y))
(define-funs-rec
  ((u0
    ((x Int) (y Int) (z Int)) Int)
   (v0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) z (u0 (- x 1) y z))))
(define-fun
  w0
  ((x Int)) Int (u0 x 1 0))
(define-fun
  small
  ((x Int)) Int (div (w0 x) (+ 1 (mod x 2))))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (v3 c)))))
