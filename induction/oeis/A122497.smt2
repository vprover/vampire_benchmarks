(define-fun
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y x))
(define-fun
  j2
  ((x Int)) Int (+ 1 x))
(define-fun
  j0
  ((x Int)) Int x)
(define-fun
  h3
  ((x Int) (y Int)) Int y)
(define-fun
  h2
  () Int (+ 2 (+ 2 2)))
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g4
  ((x Int)) Int (mod x 2))
(define-fun
  v4
  ((x Int)) Int (u4 (g4 x) 2))
(define-fun
  g2
  ((x Int) (y Int)) Int (div y 2))
(define-fun
  g1
  ((x Int) (y Int)) Int y)
(define-fun
  g0
  ((x Int) (y Int)) Int (div (- y 1) 2))
(define-fun
  f4
  ((x Int) (y Int)) Int y)
(define-fun
  f3
  ((x Int)) Int (mod (+ (v4 x) x) (+ 1 x)))
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
  ((x Int)) Int (u2 h2 1 (j2 x)))
(define-fun
  fast
  ((x Int)) Int (mod (w2 x) (+ 1 2)))
(define-fun
  f1
  ((x Int)) Int (- 1 x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 y x))
(define-funs-rec
  ((u0
    ((x Int) (y Int) (z Int)) Int)
   (v0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (v1 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z)))))
(define-fun
  w0
  ((x Int)) Int (u0 x 0 x))
(define-fun
  small
  ((x Int)) Int (+ (w0 x) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
