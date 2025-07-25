(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u3 (- x 1) y) x)))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u0 (- x 1) y) x)))
(define-fun
  h2
  ((x Int)) Int (- (* x x) x))
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  g3
  ((x Int)) Int (- x 1))
(define-fun
  v3
  ((x Int)) Int (u3 (g3 x) 1))
(define-fun
  g0
  ((x Int)) Int (- x 1))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 1))
(define-fun
  f2
  ((x Int)) Int (* (- x 2) x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 1 (h2 x)))
(define-fun
  fast
  ((x Int)) Int (* (div (v2 x) (* 2 (+ 2 2))) (v3 x)))
(define-fun
  f1
  ((x Int)) Int (div (- (* x x) x) 2))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 2 x))
(define-fun
  small
  ((x Int)) Int (* (v0 x) (v1 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
