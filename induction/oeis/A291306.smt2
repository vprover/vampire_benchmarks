(define-fun
  h1
  ((x Int) (y Int)) Int y)
(define-fun
  g1
  ((x Int)) Int (- 0 x))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int
  (+
    (+
      (* (- 1 (mod (+ 2 (+ (* x x) x)) (+ 2 (+ 2 2)))) (- 2 (mod x 2)))
      2)
    x))
(define-fun
  f1
  ((x Int) (y Int)) Int (- y x))
(define-funs-rec
  ((u1
    ((x Int) (y Int) (z Int)) Int)
   (v1
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z)))
   (ite (<= x 0) z (g1 (u1 (- x 1) y z)))))
(define-fun
  w1
  ((x Int) (y Int)) Int (u1 y 2 1))
(define-fun
  f0
  ((x Int) (y Int)) Int (- (w1 x y) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 0))
(define-fun
  small
  ((x Int)) Int (* (div (+ (v0 x) x) 2) 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
