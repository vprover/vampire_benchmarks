(define-fun
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y 0))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u1 (- x 1) y) x)))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u0 (- x 1) y) x)))
(define-fun
  h0
  ((x Int)) Int (mod 2 (+ 1 (div x 2))))
(define-fun
  v0
  ((x Int)) Int (u0 x (h0 x)))
(define-fun
  g2
  ((x Int)) Int (+ 2 (- 2 x)))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) 2))
(define-fun
  v1
  ((x Int)) Int (u1 x (v2 x)))
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int x)
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (v1 c)))))
