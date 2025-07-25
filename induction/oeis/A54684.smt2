(define-fun
  j1
  ((x Int)) Int x)
(define-fun
  h2
  ((x Int)) Int (+ x x))
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int) (y Int)) Int (div (div y 2) (+ 1 (+ 2 2))))
(define-funs-rec
  ((v1
    ((x Int) (y Int) (z Int)) Int)
   (u1
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g1 (u1 (- x 1) y z) (v1 (- x 1) y z)))
   (ite (<= x 0) y (+ (u1 (- x 1) y z) (v1 (- x 1) y z)))))
(define-fun
  w1
  ((x Int)) Int (u1 x 1 x))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f2
  ((x Int)) Int
  (+
    (mod
      (mod (+ 1 (div x (+ 2 (* 2 (+ 2 2))))) (+ 1 (+ 2 (* 2 (+ 2 2)))))
      2)
    x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 1 (h2 x)))
(define-fun
  f0
  ((x Int)) Int (mod (w1 x) 2))
(define-fun-rec
  t0
  ((x Int)) Int (ite (<= (f0 x) 0) x (t0 (+ x 1))))
(define-fun-rec
  u0
  ((x Int)) Int (ite (<= x 0) (t0 0) (t0 (+ (u0 (- x 1)) 1))))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (u0 c) (v2 c)))))
