(define-fun
  j0
  ((x Int)) Int x)
(define-fun
  i0
  ((x Int)) Int (div x 2))
(define-fun
  h0
  () Int (+ 2 2))
(define-fun
  g0
  ((x Int)) Int (+ 1 x))
(define-funs-rec
  ((v0
    ((x Int) (y Int) (z Int)) Int)
   (u0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g0 (u0 (- x 1) y z)))
   (ite (<= x 0) y (+ (u0 (- x 1) y z) (v0 (- x 1) y z)))))
(define-fun
  w0
  ((x Int)) Int (u0 h0 (i0 x) x))
(define-fun
  fast
  ((x Int)) Int (+ (+ (* 2 (+ 2 x)) (* (+ 1 (+ 2 2)) (div x 2))) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (w0 c) (fast c)))))
