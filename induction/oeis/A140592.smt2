(define-fun
  j1
  ((x Int)) Int x)
(define-fun
  i3
  ((x Int)) Int (div x 2))
(define-fun
  h3
  () Int (+ 2 2))
(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  g3
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int) (y Int)) Int y)
(define-fun
  g1
  ((x Int) (y Int)) Int (div y 2))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f3
  ((x Int) (y Int)) Int (div (- y x) 2))
(define-funs-rec
  ((u3
    ((x Int) (y Int) (z Int)) Int)
   (v3
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f3 (u3 (- x 1) y z) (v3 (- x 1) y z)))
   (ite (<= x 0) z (u3 (- x 1) y z))))
(define-fun
  w3
  ((x Int)) Int (u3 h3 (i3 x) 0))
(define-fun
  fast
  ((x Int)) Int (+ (+ (+ (mod (+ (w3 x) x) 2) 2) x) x))
(define-fun
  f2
  ((x Int)) Int (- 1 x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int) (y Int)) Int (u2 y x))
(define-funs-rec
  ((u1
    ((x Int) (y Int) (z Int)) Int)
   (v1
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (v2 (u1 (- x 1) y z) (v1 (- x 1) y z)))
   (ite (<= x 0) z (g1 (u1 (- x 1) y z) (v1 (- x 1) y z)))))
(define-fun
  w1
  ((x Int)) Int (u1 x 0 x))
(define-fun-rec
  t0
  ((x Int)) Int (ite (<= (w1 x) 0) x (t0 (+ x 1))))
(define-fun-rec
  u0
  ((x Int)) Int (ite (<= x 0) (t0 0) (t0 (+ (u0 (- x 1)) 1))))
(define-fun
  small
  ((x Int)) Int (+ (u0 x) 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
