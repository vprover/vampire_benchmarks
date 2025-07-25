(define-fun
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y 1))
(define-fun
  v2
  ((x Int)) Int (u2 x x))
(define-fun
  j3
  ((x Int)) Int x)
(define-fun
  j0
  ((x Int)) Int x)
(define-fun
  h4
  ((x Int) (y Int)) Int y)
(define-fun
  h3
  () Int (+ 2 (+ 2 2)))
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
  g5
  ((x Int)) Int (- 2 x))
(define-fun
  g3
  ((x Int) (y Int)) Int (div y 2))
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int) (y Int)) Int (div y 2))
(define-fun
  f5
  ((x Int) (y Int)) Int (+ 2 (+ (div (* y y) x) (div x 2))))
(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (f5 (u5 (- x 1) y) x)))
(define-fun
  v5
  ((x Int)) Int (u5 (g5 x) 1))
(define-fun
  f4
  ((x Int)) Int (mod (+ (v5 x) x) 2))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (f4 (u4 (- x 1) y))))
(define-fun
  v4
  ((x Int) (y Int)) Int (u4 1 y))
(define-fun
  f3
  ((x Int) (y Int)) Int (+ (* (v4 x y) x) x))
(define-funs-rec
  ((u3
    ((x Int) (y Int) (z Int)) Int)
   (v3
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f3 (u3 (- x 1) y z) (v3 (- x 1) y z)))
   (ite (<= x 0) z (g3 (u3 (- x 1) y z) (v3 (- x 1) y z)))))
(define-fun
  w3
  ((x Int)) Int (u3 h3 1 x))
(define-fun
  f1
  ((x Int)) Int (mod (+ (v2 x) x) 2))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 1 y))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (* (v1 x y) x) x))
(define-funs-rec
  ((u0
    ((x Int) (y Int) (z Int)) Int)
   (v0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z)))))
(define-fun
  w0
  ((x Int)) Int (u0 x 1 x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (w0 c) (w3 c)))))
