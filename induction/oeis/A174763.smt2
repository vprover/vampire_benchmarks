(define-fun
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y 1))
(define-fun
  j2
  () Int (* 2 (+ 2 2)))
(define-fun
  h2
  ((x Int)) Int (+ x x))
(define-fun
  h1
  () Int (* 2 (+ 2 2)))
(define-fun
  h0
  ((x Int)) Int (+ x x))
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int)) Int (mod x 2))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) h1))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f2
  ((x Int) (y Int)) Int
  (- (* (* 2 (* 2 (+ 2 (* 2 (mod x 2))))) x) y))
(define-funs-rec
  ((u2
    ((x Int) (y Int) (z Int)) Int)
   (v2
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f2 (u2 (- x 1) y z) (v2 (- x 1) y z)))
   (ite (<= x 0) z (u2 (- x 1) y z))))
(define-fun
  w2
  ((x Int)) Int (u2 (h2 x) 1 j2))
(define-fun
  f0
  ((x Int) (y Int)) Int (- (* (* (v1 x) 2) (+ x x)) y))
(define-funs-rec
  ((u0
    ((x Int) (y Int) (z Int)) Int)
   (v0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) z (u0 (- x 1) y z))))
(define-fun
  w0
  ((x Int)) Int (u0 (h0 x) 1 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (w0 c) (w2 c)))))
