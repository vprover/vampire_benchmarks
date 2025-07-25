(define-fun
  j1
  ((x Int)) Int x)
(define-fun
  i1
  ((x Int)) Int x)
(define-fun
  h2
  () Int (+ 2 (+ 2 2)))
(define-fun
  h1
  ((x Int) (y Int)) Int y)
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int) (y Int)) Int (- y 1))
(define-funs-rec
  ((v1
    ((x Int) (y Int) (z Int)) Int)
   (u1
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g1 (u1 (- x 1) y z) (v1 (- x 1) y z)))
   (ite (<= x 0) y (+ (u1 (- x 1) y z) (v1 (- x 1) y z)))))
(define-fun
  w1
  ((x Int) (y Int)) Int (u1 y x x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (w1 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 2))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f2
  ((x Int) (y Int)) Int (* (- x 1) y))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y) x)))
(define-fun
  v2
  ((x Int)) Int (u2 x h2))
(define-fun
  fast
  ((x Int)) Int (- (div (* (v2 x) (+ 1 x)) 2) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
