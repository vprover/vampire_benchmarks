(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u1 (- x 1) y) x)))
(define-fun
  h2
  ((x Int)) Int (+ (* 2 (* 2 (* 2 (* (+ 1 2) (+ 1 x))))) x))
(define-fun
  h1
  ((x Int)) Int (+ 1 x))
(define-fun
  g1
  () Int (+ 2 2))
(define-fun
  v1
  ((x Int)) Int (u1 g1 (h1 x)))
(define-fun
  h0
  ((x Int)) Int (+ (v1 x) x))
(define-fun
  f2
  ((x Int)) Int (* x x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 1 (h2 x)))
(define-fun
  fast
  ((x Int)) Int (- (* 2 (v2 x)) 1))
(define-fun
  f0
  ((x Int)) Int (* x x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 1 (h0 x)))
(define-fun
  small
  ((x Int)) Int (- (* 2 (v0 x)) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
