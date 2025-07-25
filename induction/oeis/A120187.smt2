(define-fun
  h1
  () Int (+ 1 (* 2 (+ 2 (* 2 (+ 2 2))))))
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int)) Int (- x 2))
(define-fun
  f1
  ((x Int)) Int (+ (div x (+ 1 (+ 2 (+ 2 2)))) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) h1))
(define-fun
  fast
  ((x Int)) Int (div (div (div (v1 x) 2) 2) 2))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ 2 (div (+ x y) (+ (+ (+ 1 2) 2) 2))))
(define-funs-rec
  ((u0
    ((x Int) (y Int) (z Int)) Int)
   (v0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) z (+ (u0 (- x 1) y z) (v0 (- x 1) y z)))))
(define-fun
  w0
  ((x Int)) Int (u0 x 2 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (w0 c) (fast c)))))
