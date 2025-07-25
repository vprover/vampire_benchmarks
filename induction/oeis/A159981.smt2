(define-fun
  j2
  ((x Int)) Int (div x 2))
(define-fun
  h2
  () Int (+ 2 (+ 2 2)))
(define-fun
  h1
  ((x Int)) Int (+ 1 x))
(define-fun
  g2
  ((x Int) (y Int)) Int (div y 2))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f2
  ((x Int) (y Int)) Int (+ (* (mod y 2) x) x))
(define-funs-rec
  ((u2
    ((x Int) (y Int) (z Int)) Int)
   (v2
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f2 (u2 (- x 1) y z) (v2 (- x 1) y z)))
   (ite (<= x 0) z (g2 (u2 (- x 1) y z) (v2 (- x 1) y z)))))
(define-fun
  w2
  ((x Int)) Int (u2 h2 1 (j2 x)))
(define-fun
  f1
  ((x Int)) Int (* (w2 x) (+ 1 (mod x 2))))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 1 (h1 x)))
(define-fun
  fast
  ((x Int)) Int (mod (div (v1 x) 2) (+ 2 2)))
(define-fun
  f0
  ((x Int) (y Int)) Int (* 2 (+ (- x (div x y)) x)))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(define-fun
  small
  ((x Int)) Int (mod (div (v0 x) (+ 1 x)) (+ 2 2)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
