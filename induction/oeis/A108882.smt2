(define-fun
  h3
  ((x Int)) Int (+ 1 x))
(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  g3
  ((x Int)) Int (mod x (+ 2 2)))
(define-fun
  g2
  ((x Int)) Int (- (mod x (+ 1 2)) 1))
(define-fun
  g1
  ((x Int)) Int (+ 2 x))
(define-funs-rec
  ((v1
    ((x Int) (y Int) (z Int)) Int)
   (u1
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g1 (u1 (- x 1) y z)))
   (ite (<= x 0) y (+ (u1 (- x 1) y z) (v1 (- x 1) y z)))))
(define-fun
  w1
  ((x Int)) Int (u1 x 1 1))
(define-fun
  g0
  ((x Int)) Int (+ x x))
(define-fun
  f3
  ((x Int)) Int (div x (ite (<= (mod x (+ 2 2)) 0) (+ 2 2) 1)))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int)) Int (u3 (g3 x) (h3 x)))
(define-fun
  f2
  ((x Int)) Int (+ (mod (v3 x) 2) x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) x))
(define-fun
  fast
  ((x Int)) Int (ite (<= (mod (v2 x) (+ 1 2)) 0) 1 0))
(define-fun
  f0
  ((x Int)) Int (ite (<= (mod x 2) 0) 1 (div x 2)))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) (w1 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
