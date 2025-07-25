(define-funs-rec
  ((u1
    ((x Int) (y Int) (z Int)) Int)
   (v1
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (+ (u1 (- x 1) y z) (v1 (- x 1) y z)))
   (ite (<= x 0) z (u1 (- x 1) y z))))
(define-fun
  h2
  ((x Int)) Int (- x 1))
(define-fun
  h1
  ((x Int)) Int (+ x x))
(define-fun
  w1
  ((x Int)) Int (u1 (h1 x) 1 0))
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g1
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
  ((x Int)) Int (u2 (h2 x) 2 1))
(define-fun
  fast
  ((x Int)) Int (div (w2 x) (+ 1 (* 2 (+ 2 2)))))
(define-fun
  f0
  ((x Int)) Int (div x (+ 1 2)))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 2 (w1 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
