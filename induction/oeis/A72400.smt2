(define-fun
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y 1))
(define-fun
  h4
  () Int (+ 2 2))
(define-fun
  h3
  ((x Int)) Int x)
(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  h1
  ((x Int)) Int (+ 1 x))
(define-fun
  h0
  ((x Int)) Int (+ 1 x))
(define-fun
  g4
  ((x Int)) Int (mod x (+ 2 2)))
(define-fun
  v4
  ((x Int)) Int (u4 (g4 x) h4))
(define-fun
  g3
  () Int (+ 1 2))
(define-fun
  g2
  ((x Int)) Int (- 1 (mod x (+ 2 2))))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f3
  ((x Int)) Int (div x (v4 x)))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int)) Int (u3 g3 x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (v3 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (v2 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 1 (h1 x)))
(define-fun
  fast
  ((x Int)) Int (mod (v1 x) (* 2 (+ 2 2))))
(define-fun
  f0
  ((x Int)) Int (div x (ite (<= (mod x (+ 2 2)) 0) (+ 2 2) 1)))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 x (h0 x)))
(define-fun
  small
  ((x Int)) Int (mod (v0 x) (* 2 (+ 2 2))))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
