(define-fun
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y 2))
(define-fun
  i3
  ((x Int)) Int (ite (<= x 0) 1 2))
(define-fun
  h3
  ((x Int)) Int (- x 1))
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g4
  ((x Int) (y Int)) Int (mod y 2))
(define-fun
  g3
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int)) Int (mod x 2))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f4
  ((x Int)) Int (* 2 (+ (* 2 (+ x x)) x)))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (f4 (u4 (- x 1) y))))
(define-fun
  v4
  ((x Int) (y Int)) Int (u4 (g4 x y) 2))
(define-fun
  f3
  ((x Int) (y Int)) Int (+ (* (v4 x y) x) y))
(define-funs-rec
  ((u3
    ((x Int) (y Int) (z Int)) Int)
   (v3
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f3 (u3 (- x 1) y z) (v3 (- x 1) y z)))
   (ite (<= x 0) z (u3 (- x 1) y z))))
(define-fun
  w3
  ((x Int)) Int (u3 (h3 x) (i3 x) 1))
(define-fun
  fast
  ((x Int)) Int (div (w3 x) (+ 1 (mod x 2))))
(define-fun
  f2
  ((x Int)) Int (* 2 (+ 2 x)))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  () Int (u2 2 2))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) v2))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (* (v1 x) x) y))
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
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
