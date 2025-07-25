(define-fun
  h1
  ((x Int)) Int (mod x (+ 1 2)))
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g1
  () Int (- 0 2))
(define-fun
  v1
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z g1))
(define-fun
  u1
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) y (v1 (- x 1) y z)))
(define-fun
  w1
  ((x Int)) Int (u1 (h1 x) 1 2))
(define-fun
  g0
  ((x Int) (y Int)) Int (- 1 (+ x y)))
(define-funs-rec
  ((v0
    ((x Int) (y Int) (z Int)) Int)
   (u0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) y (v0 (- x 1) y z))))
(define-fun
  w0
  ((x Int)) Int (u0 x 1 2))
(define-fun
  small
  ((x Int)) Int (+ (w0 x) (* 2 (+ (+ x x) x))))
(define-fun
  fast
  ((x Int)) Int (+ (* 2 (+ (+ x x) x)) (w1 x)))
(define-fun
  f1
  ((x Int) (y Int)) Int y)
(define-fun
  f0
  ((x Int) (y Int)) Int y)
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
