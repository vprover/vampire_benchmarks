(define-fun
  h1
  ((x Int)) Int (mod x (+ 2 2)))
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f1
  ((x Int) (y Int)) Int (- 0 y))
(define-funs-rec
  ((u1
    ((x Int) (y Int) (z Int)) Int)
   (v1
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z)))
   (ite (<= x 0) z (u1 (- x 1) y z))))
(define-fun
  w1
  ((x Int)) Int (u1 (h1 x) 2 1))
(define-fun
  fast
  ((x Int)) Int (+ (+ (w1 x) (* 2 (+ x x))) x))
(define-fun
  f0
  ((x Int)) Int (+ (mod x (+ 1 (+ 2 2))) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(define-fun
  small
  ((x Int)) Int (* 2 (v0 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
