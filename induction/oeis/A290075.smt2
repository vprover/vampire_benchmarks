(define-fun
  h2
  ((x Int)) Int (+ 1 (+ 2 (mod x 2))))
(define-fun
  h1
  ((x Int) (y Int)) Int (div y 2))
(define-fun
  g3
  ((x Int)) Int (- x 2))
(define-fun
  g2
  ((x Int)) Int (div x 2))
(define-fun
  g1
  ((x Int) (y Int)) Int (- y x))
(define-funs-rec
  ((v1
    ((x Int) (y Int) (z Int)) Int)
   (u1
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g1 (u1 (- x 1) y z) (v1 (- x 1) y z)))
   (ite (<= x 0) y (- (u1 (- x 1) y z) (v1 (- x 1) y z)))))
(define-fun
  w1
  ((x Int) (y Int)) Int (u1 (h1 x y) 0 1))
(define-fun
  g0
  ((x Int)) Int (- x 1))
(define-fun
  f3
  ((x Int)) Int (+ x x))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int)) Int (u3 (g3 x) 1))
(define-fun
  f2
  ((x Int)) Int (+ x x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) (h2 x)))
(define-fun
  fast
  ((x Int)) Int (div (+ (div (v2 x) 2) (v3 x)) 2))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (+ (w1 x y) x) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
