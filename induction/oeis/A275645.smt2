(define-fun
  j1
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int) (y Int)) Int (- y 2))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f1
  ((x Int) (y Int)) Int (+ (+ (ite (<= (* x y) 0) y x) x) x))
(define-funs-rec
  ((u1
    ((x Int) (y Int) (z Int)) Int)
   (v1
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z)))
   (ite (<= x 0) z (g1 (u1 (- x 1) y z) (v1 (- x 1) y z)))))
(define-fun
  w1
  ((x Int)) Int (u1 2 1 x))
(define-fun
  fast
  ((x Int)) Int (+ (- (w1 x) 1) x))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ 2 (+ 2 (+ (mod (+ 2 x) (- x 2)) y))))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
