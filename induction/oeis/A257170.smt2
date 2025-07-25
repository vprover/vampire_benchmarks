(define-fun
  j0
  ((x Int)) Int (mod x 2))
(define-fun
  h0
  ((x Int)) Int (div x 2))
(define-fun
  g1
  ((x Int)) Int (mod (div x (+ 2 2)) 2))
(define-fun
  g0
  ((x Int) (y Int)) Int (- 0 y))
(define-funs-rec
  ((v0
    ((x Int) (y Int) (z Int)) Int)
   (u0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) y (* (u0 (- x 1) y z) (v0 (- x 1) y z)))))
(define-fun
  w0
  ((x Int)) Int (u0 (h0 x) 1 (j0 x)))
(define-fun
  f1
  ((x Int)) Int (- 0 x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) 2))
(define-fun
  fast
  ((x Int)) Int (mod (ite (<= x 0) 1 x) (v1 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (w0 c) (fast c)))))
