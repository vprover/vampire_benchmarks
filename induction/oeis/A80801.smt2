(define-fun
  j3
  ((x Int)) Int (div x 2))
(define-fun
  j1
  ((x Int)) Int x)
(define-fun
  h3
  () Int (+ 2 (+ 2 2)))
(define-fun
  h2
  ((x Int)) Int (+ 2 x))
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int (+ 2 x))
(define-fun
  g3
  ((x Int) (y Int)) Int (div y 2))
(define-fun
  g1
  ((x Int) (y Int)) Int (div y 2))
(define-fun
  f3
  ((x Int) (y Int)) Int (+ (ite (<= y 0) 0 (+ 1 y)) x))
(define-funs-rec
  ((u3
    ((x Int) (y Int) (z Int)) Int)
   (v3
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f3 (u3 (- x 1) y z) (v3 (- x 1) y z)))
   (ite (<= x 0) z (g3 (u3 (- x 1) y z) (v3 (- x 1) y z)))))
(define-fun
  w3
  ((x Int)) Int (u3 h3 1 (j3 x)))
(define-fun
  f2
  ((x Int)) Int (- (w3 x) x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 1 (h2 x)))
(define-fun
  fast
  ((x Int)) Int (+ (v2 x) 1))
(define-fun
  f1
  ((x Int) (y Int)) Int (+ (+ (ite (<= y 0) 0 1) x) y))
(define-funs-rec
  ((u1
    ((x Int) (y Int) (z Int)) Int)
   (v1
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z)))
   (ite (<= x 0) z (g1 (u1 (- x 1) y z) (v1 (- x 1) y z)))))
(define-fun
  w1
  ((x Int)) Int (u1 x 1 x))
(define-fun
  f0
  ((x Int)) Int (- (- (w1 x) x) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 1 (h0 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
