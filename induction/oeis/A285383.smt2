(define-fun
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y 1))
(define-fun
  h4
  () Int (+ 2 2))
(define-fun
  h3
  ((x Int)) Int (div x (+ 2 2)))
(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g4
  ((x Int)) Int (mod x (+ 2 2)))
(define-fun
  v4
  ((x Int)) Int (u4 (g4 x) h4))
(define-fun
  g2
  ((x Int)) Int (- 1 (mod x (+ 2 2))))
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int (+ x x))
(define-fun
  f3
  ((x Int)) Int (div x (v4 x)))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int)) Int (u3 2 (h3 x)))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (v3 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) x))
(define-fun
  fast
  ((x Int)) Int (mod (v2 x) 2))
(define-fun
  f1
  ((x Int) (y Int)) Int (ite (<= x 0) y 0))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int)) Int (u1 x 2))
(define-fun
  f0
  ((x Int)) Int (div (v1 x) 2))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
