(define-fun
  i0
  ((x Int)) Int (- x (div x 2)))
(define-fun
  h1
  ((x Int)) Int (- x (div x 2)))
(define-fun
  h0
  () Int (+ 2 2))
(define-fun
  g0
  ((x Int)) Int (+ x x))
(define-funs-rec
  ((v0
    ((x Int) (y Int) (z Int)) Int)
   (u0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g0 (u0 (- x 1) y z)))
   (ite (<= x 0) y (+ (u0 (- x 1) y z) (v0 (- x 1) y z)))))
(define-fun
  w0
  ((x Int)) Int (u0 h0 (i0 x) 1))
(define-fun
  f1
  ((x Int)) Int (+ (* (+ 1 (+ 2 2)) (+ 1 (+ x x))) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 1 (h1 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (w0 c) (v1 c)))))
