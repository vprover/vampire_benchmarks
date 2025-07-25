(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u0 (- x 1) y) x)))
(define-fun
  i2
  () Int (+ 2 (+ 2 2)))
(define-fun
  h2
  ((x Int)) Int (- x 1))
(define-fun
  h1
  ((x Int)) Int (+ x x))
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  g0
  () Int (+ 2 2))
(define-fun
  f2
  ((x Int) (y Int)) Int (- (* 2 (+ (+ x x) x)) y))
(define-funs-rec
  ((u2
    ((x Int) (y Int) (z Int)) Int)
   (v2
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f2 (u2 (- x 1) y z) (v2 (- x 1) y z)))
   (ite (<= x 0) z (u2 (- x 1) y z))))
(define-fun
  w2
  ((x Int)) Int (u2 (h2 x) i2 0))
(define-fun
  fast
  ((x Int)) Int (* 2 (* 2 (* 2 (ite (<= x 0) 0 (w2 x))))))
(define-fun
  f1
  ((x Int) (y Int)) Int (+ (+ x x) y))
(define-funs-rec
  ((u1
    ((x Int) (y Int) (z Int)) Int)
   (v1
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z)))
   (ite (<= x 0) z (u1 (- x 1) y z))))
(define-fun
  w1
  ((x Int)) Int (u1 (h1 x) 0 1))
(define-fun
  v0
  ((x Int)) Int (u0 g0 (w1 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
