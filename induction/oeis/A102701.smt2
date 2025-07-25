(define-funs-rec
  ((u2
    ((x Int) (y Int) (z Int)) Int)
   (v2
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (+ (u2 (- x 1) y z) (v2 (- x 1) y z)))
   (ite (<= x 0) z (u2 (- x 1) y z))))
(define-funs-rec
  ((u0
    ((x Int) (y Int) (z Int)) Int)
   (v0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (+ (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) z (u0 (- x 1) y z))))
(define-fun
  i0
  ((x Int)) Int (+ 2 (mod x 2)))
(define-fun
  h2
  ((x Int)) Int (div x 2))
(define-fun
  w2
  ((x Int)) Int (u2 (h2 x) 1 0))
(define-fun
  h0
  ((x Int)) Int (div x 2))
(define-fun
  w0
  ((x Int)) Int (u0 (h0 x) (i0 x) 0))
(define-fun
  small
  ((x Int)) Int (+ (div (w0 x) 2) x))
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int)) Int (mod x 2))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f1
  ((x Int)) Int (+ (div x 2) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) (w2 x)))
(define-fun
  fast
  ((x Int)) Int (+ (v1 x) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
