(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u4 (- x 1) y) x)))
(define-fun
  v4
  ((x Int)) Int (u4 x 1))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int)) Int (u1 x x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (v1 (u0 (- x 1) y))))
(define-fun
  j2
  ((x Int)) Int (+ x x))
(define-fun
  h3
  ((x Int)) Int (+ 1 (+ x x)))
(define-fun
  h2
  ((x Int)) Int (- x 1))
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int (+ 1 (+ x x)))
(define-fun
  v0
  ((x Int)) Int (u0 1 (h0 x)))
(define-fun
  small
  ((x Int)) Int (div (v0 x) (+ 1 x)))
(define-fun
  g4
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int) (y Int)) Int (- y 1))
(define-funs-rec
  ((v2
    ((x Int) (y Int) (z Int)) Int)
   (u2
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g2 (u2 (- x 1) y z) (v2 (- x 1) y z)))
   (ite (<= x 0) y (* (u2 (- x 1) y z) (v2 (- x 1) y z)))))
(define-fun
  w2
  ((x Int)) Int (u2 (h2 x) 1 (j2 x)))
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  f3
  ((x Int)) Int (* x x))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int)) Int (u3 1 (h3 x)))
(define-fun
  fast
  ((x Int)) Int (* (* (w2 x) (v3 x)) (v4 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
