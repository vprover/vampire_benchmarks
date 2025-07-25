(define-fun
  j0
  ((x Int)) Int (+ 1 (+ x x)))
(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  h1
  ((x Int)) Int (+ (+ x x) x))
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g2
  () Int (+ 2 2))
(define-fun
  g0
  ((x Int) (y Int)) Int (+ 1 (div y (+ 1 (+ 2 2)))))
(define-funs-rec
  ((v0
    ((x Int) (y Int) (z Int)) Int)
   (u0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) y (* (u0 (- x 1) y z) (v0 (- x 1) y z)))))
(define-fun
  w0
  ((x Int)) Int (u0 x 1 (j0 x)))
(define-fun
  small
  ((x Int)) Int (mod (w0 x) 2))
(define-fun
  f2
  ((x Int)) Int (ite (<= (mod x (+ 1 2)) 0) (div x (+ 1 (+ 2 2))) 1))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 g2 x))
(define-fun
  f1
  ((x Int)) Int (mod (+ (v2 x) 1) 2))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 1 (h1 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (v1 c)))))
