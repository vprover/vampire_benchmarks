(define-fun
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y 0))
(define-fun
  g3
  ((x Int)) Int (- 2 x))
(define-fun
  v3
  ((x Int)) Int (u3 (g3 x) 1))
(define-fun
  g2
  ((x Int)) Int (div x 2))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f2
  ((x Int)) Int (+ x x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) 1))
(define-fun
  f1
  ((x Int)) Int (* x x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 1 (v2 x)))
(define-fun
  fast
  ((x Int)) Int (+ (* (v1 x) (* (+ 1 (mod x 2)) 2)) (v3 x)))
(define-fun
  f0
  ((x Int)) Int (+ x x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 x 2))
(define-fun
  small
  ((x Int)) Int (+ (mod 1 (ite (<= x 0) 1 x)) (v0 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
