(define-fun-rec
  v1
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v1 (- x 1) y z)))
(define-funs-rec
  ((u2
    ((x Int) (y Int) (z Int)) Int)
   (v2
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (+ (u2 (- x 1) y z) (v2 (- x 1) y z)))
   (ite (<= x 0) z (u2 (- x 1) y z))))
(define-fun-rec
  u1
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u1 (- x 1) y z) (v1 (- x 1) y z))))
(define-fun
  j1
  () Int (+ 1 (+ 2 2)))
(define-fun
  w1
  ((x Int)) Int (u1 x 2 j1))
(define-fun
  i0
  () Int (+ 1 (+ 2 2)))
(define-fun
  h2
  ((x Int)) Int (+ 2 (+ x x)))
(define-fun
  w2
  ((x Int)) Int (u2 (h2 x) 2 1))
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int (+ x x))
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int) (y Int)) Int y)
(define-fun
  fast
  ((x Int)) Int (* (* (* 2 (w1 x)) (w2 x)) 2))
(define-fun
  f0
  ((x Int) (y Int)) Int (- (* 2 (+ x x)) y))
(define-funs-rec
  ((u0
    ((x Int) (y Int) (z Int)) Int)
   (v0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) z (+ (u0 (- x 1) y z) (v0 (- x 1) y z)))))
(define-fun
  w0
  ((x Int)) Int (u0 (h0 x) i0 2))
(define-fun
  small
  ((x Int)) Int (* (* 2 (* 2 (w0 x))) 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
