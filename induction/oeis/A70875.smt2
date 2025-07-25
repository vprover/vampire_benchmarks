(define-funs-rec
  ((u0
    ((x Int) (y Int) (z Int)) Int)
   (v0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (+ (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) z (- (u0 (- x 1) y z) (v0 (- x 1) y z)))))
(define-fun
  i0
  () Int (+ 1 (+ 2 2)))
(define-fun
  w0
  ((x Int)) Int (u0 x i0 2))
(define-fun
  h1
  ((x Int)) Int (+ 1 (* 2 (+ 2 (mod x 2)))))
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int)) Int (div x 2))
(define-fun
  f1
  ((x Int)) Int (+ x x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) (h1 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (w0 c) (v1 c)))))
