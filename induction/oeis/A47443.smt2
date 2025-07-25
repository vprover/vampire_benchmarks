(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int
  (+ (+ (+ (- (- x (div (- x 2) (+ 1 2))) (mod x (+ 1 2))) 2) x) x))
(define-fun
  f1
  ((x Int) (y Int)) Int (+ (+ 1 x) y))
(define-funs-rec
  ((u1
    ((x Int) (y Int) (z Int)) Int)
   (v1
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z)))
   (ite (<= x 0) z (u1 (- x 1) y z))))
(define-fun
  w1
  ((x Int)) Int (u1 x 1 0))
(define-fun
  f0
  ((x Int)) Int (mod (w1 x) (+ 1 2)))
(define-fun-rec
  t0
  ((x Int)) Int (ite (<= (f0 x) 0) x (t0 (+ x 1))))
(define-fun-rec
  u0
  ((x Int)) Int (ite (<= x 0) (t0 0) (t0 (+ (u0 (- x 1)) 1))))
(define-fun
  small
  ((x Int)) Int (- (u0 x) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
