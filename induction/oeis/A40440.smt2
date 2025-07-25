(define-fun
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y 1))
(define-fun
  v2
  ((x Int)) Int (u2 x 2))
(define-fun
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y 2))
(define-fun
  h3
  ((x Int)) Int (ite (<= x 0) 1 2))
(define-fun
  g3
  ((x Int)) Int (- 1 (mod x 2)))
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int (mod x 2))
(define-fun
  f3
  ((x Int)) Int (+ (* 2 (* 2 (+ 2 (* (+ 2 x) x)))) x))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int)) Int (u3 (g3 x) (h3 x)))
(define-fun
  f1
  ((x Int)) Int (+ (* x x) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  () Int (u1 2 2))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) v1))
(define-fun
  small
  ((x Int)) Int (div (v0 x) (v2 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (v3 c)))))
