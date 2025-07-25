(define-fun
  i2
  ((x Int)) Int (ite (<= x 0) 1 (+ 2 (* 2 (+ 2 (+ 2 2))))))
(define-fun
  h2
  ((x Int)) Int (- x 1))
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int (- 0 x))
(define-fun
  f2
  ((x Int) (y Int)) Int (- (* (+ 1 (* 2 (+ 2 (+ 2 2)))) x) y))
(define-funs-rec
  ((u2
    ((x Int) (y Int) (z Int)) Int)
   (v2
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f2 (u2 (- x 1) y z) (v2 (- x 1) y z)))
   (ite (<= x 0) z (u2 (- x 1) y z))))
(define-fun
  w2
  ((x Int)) Int (u2 (h2 x) (i2 x) 1))
(define-fun
  f1
  ((x Int) (y Int)) Int (* (+ 2 y) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int)) Int (u1 2 x))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (+ (v1 x) x) y))
(define-funs-rec
  ((u0
    ((x Int) (y Int) (z Int)) Int)
   (v0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) z (g0 (u0 (- x 1) y z)))))
(define-fun
  w0
  ((x Int)) Int (u0 x 1 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (w0 c) (w2 c)))))
