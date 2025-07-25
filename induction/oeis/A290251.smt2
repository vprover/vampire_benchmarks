(define-fun
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y x))
(define-fun
  j4
  ((x Int)) Int (div x 2))
(define-fun
  j0
  ((x Int)) Int x)
(define-fun
  h4
  () Int (+ 2 (+ 2 2)))
(define-fun
  h3
  ((x Int)) Int x)
(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  h1
  ((x Int) (y Int)) Int y)
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g4
  ((x Int) (y Int)) Int (div y 2))
(define-fun
  g3
  ((x Int)) Int (ite (<= x 0) 0 1))
(define-fun
  g2
  ((x Int)) Int (- x 1))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) x))
(define-fun
  g0
  ((x Int) (y Int)) Int (div y 2))
(define-fun
  f4
  ((x Int) (y Int)) Int (+ (ite (<= y 0) 0 (+ 1 y)) x))
(define-funs-rec
  ((u4
    ((x Int) (y Int) (z Int)) Int)
   (v4
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f4 (u4 (- x 1) y z) (v4 (- x 1) y z)))
   (ite (<= x 0) z (g4 (u4 (- x 1) y z) (v4 (- x 1) y z)))))
(define-fun
  w4
  ((x Int)) Int (u4 h4 1 (j4 x)))
(define-fun
  f3
  ((x Int)) Int (+ (- (w4 x) x) 1))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int)) Int (u3 (g3 x) x))
(define-fun
  f2
  ((x Int) (y Int)) Int y)
(define-fun
  f1
  ((x Int)) Int (mod (v2 x) 2))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 1 y))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (v1 x y) x))
(define-funs-rec
  ((u0
    ((x Int) (y Int) (z Int)) Int)
   (v0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z)))))
(define-fun
  w0
  ((x Int)) Int (u0 x 0 x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (w0 c) (v3 c)))))
