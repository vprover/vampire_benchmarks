(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u3 (- x 1) y) x)))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int)) Int (u1 x 1))
(define-fun
  i0
  ((x Int)) Int (ite (<= x 0) 0 (v1 x)))
(define-fun
  h3
  ((x Int)) Int x)
(define-fun
  h2
  ((x Int)) Int (- x 2))
(define-fun
  h0
  ((x Int)) Int (- x 2))
(define-fun
  g3
  ((x Int)) Int (- x 1))
(define-fun
  v3
  ((x Int)) Int (u3 (g3 x) x))
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f2
  ((x Int) (y Int)) Int (+ (+ (- x y) x) x))
(define-funs-rec
  ((u2
    ((x Int) (y Int) (z Int)) Int)
   (v2
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f2 (u2 (- x 1) y z) (v2 (- x 1) y z)))
   (ite (<= x 0) z (u2 (- x 1) y z))))
(define-fun
  w2
  ((x Int)) Int (u2 (h2 x) 1 0))
(define-fun
  fast
  ((x Int)) Int (* (w2 x) (v3 x)))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (+ (- x y) x) x))
(define-funs-rec
  ((u0
    ((x Int) (y Int) (z Int)) Int)
   (v0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) z (u0 (- x 1) y z))))
(define-fun
  w0
  ((x Int)) Int (u0 (h0 x) (i0 x) 0))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (w0 c) (fast c)))))
