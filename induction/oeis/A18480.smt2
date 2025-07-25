(define-fun
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y 1))
(define-fun
  h3
  ((x Int)) Int x)
(define-fun
  h1
  () Int (+ 2 2))
(define-fun
  g3
  ((x Int)) Int (- 1 (mod x (+ 2 2))))
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int)) Int (mod x (+ 2 2)))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) h1))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f3
  ((x Int)) Int (+ (- x (div x (+ 2 2))) x))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int)) Int (u3 (g3 x) x))
(define-fun
  f2
  ((x Int)) Int (+ (v3 x) x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 x 1))
(define-fun
  f0
  ((x Int)) Int (+ (+ (- x (div x (v1 x))) x) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (v2 c)))))
