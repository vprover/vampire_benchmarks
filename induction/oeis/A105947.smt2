(define-fun
  h2
  ((x Int)) Int (+ 2 x))
(define-fun
  h1
  ((x Int) (y Int)) Int (+ 2 (+ 2 y)))
(define-fun
  g3
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f3
  ((x Int) (y Int)) Int (+ (div (* 2 (+ (+ x x) x)) y) x))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y) x)))
(define-fun
  v3
  ((x Int)) Int (u3 x 1))
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
  fast
  ((x Int)) Int (* (div (v2 x) (* 2 (* 2 (+ 2 (+ 2 2))))) (v3 x)))
(define-fun
  f1
  ((x Int)) Int (* (+ 2 x) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 1 (h1 x y)))
(define-fun
  f0
  ((x Int) (y Int)) Int (div (div (* (v1 x y) x) y) y))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
