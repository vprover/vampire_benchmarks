(define-fun
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y 2))
(define-fun
  g2
  ((x Int)) Int (- 1 (mod x 2)))
(define-fun
  g0
  ((x Int)) Int (mod x 2))
(define-fun
  f2
  () Int (+ 2 (* 2 (+ 2 (* 2 (+ 2 2))))))
(define-fun
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y f2))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) 2))
(define-fun
  fast
  ((x Int)) Int (* (v2 x) (ite (<= x 0) 1 2)))
(define-fun
  f1
  ((x Int)) Int (+ 1 (+ x x)))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  () Int (u1 2 2))
(define-fun
  h0
  ((x Int)) Int (* v1 (ite (<= x 0) 1 2)))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) (h0 x)))
(define-fun
  small
  ((x Int)) Int (* 2 (v0 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
