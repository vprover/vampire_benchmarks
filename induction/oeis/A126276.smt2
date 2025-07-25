(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (+ (u1 (- x 1) y) x)))
(define-fun
  h2
  ((x Int)) Int (+ 2 x))
(define-fun
  h0
  ((x Int)) Int (+ 2 x))
(define-fun
  g1
  ((x Int)) Int (* (* x x) x))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) 0))
(define-fun
  f2
  ((x Int)) Int
  (* (* (div (- (* (+ 2 (* (* x x) x)) x) x) 2) (- (* (* x x) x) x))
    x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 1 (h2 x)))
(define-fun
  fast
  ((x Int)) Int (div (v2 x) (+ 2 (+ 2 2))))
(define-fun
  f0
  ((x Int)) Int (* (v1 x) (+ 1 x)))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 1 (h0 x)))
(define-fun
  small
  ((x Int)) Int (div (div (* (v0 x) (+ 1 x)) 2) (+ 1 2)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
