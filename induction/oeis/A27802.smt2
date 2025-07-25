(define-fun
  h2
  ((x Int)) Int (+ 2 x))
(define-fun
  h1
  ((x Int)) Int (+ 2 x))
(define-fun
  h0
  ((x Int)) Int (+ 2 (+ 1 x)))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f2
  ((x Int)) Int (* (+ 2 x) (- (* (* x x) x) x)))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 1 (h2 x)))
(define-fun
  f1
  ((x Int)) Int
  (* (div (v2 x) (* 2 (+ 2 (+ 2 2)))) (- (* (* x x) x) x)))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 1 (h1 x)))
(define-fun
  fast
  ((x Int)) Int (div (v1 x) (* 2 (+ 2 (+ 2 2)))))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (div (* 2 (+ (+ x x) x)) y) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x (h0 x)))
(define-fun
  small
  ((x Int)) Int (* (+ 1 (+ 2 2)) (v0 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
