(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u1 (- x 1) y) x)))
(define-fun
  j0
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int (- x 2))
(define-fun
  g2
  ((x Int)) Int (- x 1))
(define-fun
  g1
  ((x Int)) Int (- (- x 1) 2))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) 2))
(define-fun
  g0
  ((x Int) (y Int)) Int (+ 1 y))
(define-fun
  f2
  ((x Int) (y Int)) Int (div (* 2 (- (* 2 (* x y)) x)) (+ 1 y)))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y) x)))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) 1))
(define-fun
  fast
  ((x Int)) Int
  (* (div (* (v2 x) (div (* (- x 1) x) (+ 1 x))) 2) (- x 1)))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (* x y) x))
(define-funs-rec
  ((u0
    ((x Int) (y Int) (z Int)) Int)
   (v0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z)))))
(define-fun
  w0
  ((x Int)) Int (u0 (h0 x) 1 x))
(define-fun
  small
  ((x Int)) Int (div (w0 x) (v1 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
