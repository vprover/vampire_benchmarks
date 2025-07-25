(define-fun
  i0
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int (mod x 2))
(define-funs-rec
  ((v0
    ((x Int) (y Int) (z Int)) Int)
   (u0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g0 (u0 (- x 1) y z)))
   (ite (<= x 0) y (- (u0 (- x 1) y z) (v0 (- x 1) y z)))))
(define-fun
  w0
  ((x Int)) Int (u0 x x 1))
(define-fun
  small
  ((x Int)) Int (+ x (w0 x)))
(define-fun
  fast
  ((x Int)) Int (+ (div (+ 1 (- x (mod x 2))) (+ 1 2)) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
