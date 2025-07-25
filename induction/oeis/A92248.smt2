(define-fun
  h4
  ((x Int)) Int x)
(define-fun
  h3
  ((x Int) (y Int)) Int y)
(define-fun
  g4
  ((x Int) (y Int)) Int (+ 2 y))
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int) (y Int)) Int y)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f4
  ((x Int) (y Int)) Int (- 1 (* x y)))
(define-funs-rec
  ((u4
    ((x Int) (y Int) (z Int)) Int)
   (v4
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f4 (u4 (- x 1) y z) (v4 (- x 1) y z)))
   (ite (<= x 0) z (g4 (u4 (- x 1) y z) (v4 (- x 1) y z)))))
(define-fun
  w4
  ((x Int)) Int (u4 x 1 2))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (w4 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int) (y Int)) Int (u3 1 y))
(define-fun
  f2
  ((x Int) (y Int)) Int (+ (v3 x y) x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y) x)))
(define-fun
  v2
  ((x Int)) Int (u2 x 1))
(define-fun
  fast
  ((x Int)) Int (mod (div (- (v2 x) 1) (+ 1 x)) 2))
(define-fun
  f1
  ((x Int) (y Int)) Int (+ 1 (* 2 (* x y))))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 y 1))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (v1 x y) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 0))
(define-fun
  small
  ((x Int)) Int (mod (div (v0 x) (+ 1 x)) 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
