(define-fun
  j2
  ((x Int)) Int (div x 2))
(define-fun
  j1
  ((x Int)) Int x)
(define-fun
  i2
  ((x Int)) Int x)
(define-fun
  i1
  ((x Int)) Int x)
(define-fun
  h2
  () Int (+ 2 (+ 2 2)))
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int) (y Int)) Int (div y 2))
(define-funs-rec
  ((v2
    ((x Int) (y Int) (z Int)) Int)
   (u2
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g2 (u2 (- x 1) y z) (v2 (- x 1) y z)))
   (ite (<= x 0) y (- (u2 (- x 1) y z) (v2 (- x 1) y z)))))
(define-fun
  w2
  ((x Int)) Int (u2 h2 x (j2 x)))
(define-fun
  g1
  ((x Int) (y Int)) Int (div y 2))
(define-funs-rec
  ((v1
    ((x Int) (y Int) (z Int)) Int)
   (u1
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g1 (u1 (- x 1) y z) (v1 (- x 1) y z)))
   (ite (<= x 0) y (- (u1 (- x 1) y z) (v1 (- x 1) y z)))))
(define-fun
  w1
  ((x Int)) Int (u1 x x x))
(define-fun
  fast
  ((x Int)) Int
  (mod (div (- (mod (+ 1 (w2 x)) (+ 2 (+ 2 2))) 1) 2) 2))
(define-fun
  f0
  ((x Int) (y Int)) Int (- (+ (w1 x) x) y))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 2 x))
(define-fun
  small
  ((x Int)) Int (mod (v0 x) 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
