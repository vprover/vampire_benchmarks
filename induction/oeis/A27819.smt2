(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (+ (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int)) Int (u1 x x))
(define-fun
  h4
  ((x Int)) Int (+ 2 x))
(define-fun
  h3
  ((x Int)) Int (+ 2 x))
(define-fun
  h2
  ((x Int)) Int (+ 1 x))
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int (+ 1 (v1 x)))
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int (+ 1 x))
(define-fun
  f4
  ((x Int)) Int (* (+ 2 x) (- (* (* x x) x) x)))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (f4 (u4 (- x 1) y))))
(define-fun
  v4
  ((x Int)) Int (u4 1 (h4 x)))
(define-fun
  f3
  ((x Int)) Int (* (div (v4 x) (* 2 (* 2 (+ 2 (+ 2 2))))) x))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int)) Int (u3 1 (h3 x)))
(define-fun
  f2
  ((x Int)) Int
  (*
    (div (* (div (* (v3 x) (+ 1 x)) (+ 2 (* 2 (+ 2 2)))) (+ 1 x))
      (+ 1 2))
    x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 1 (h2 x)))
(define-fun
  fast
  ((x Int)) Int (div (v2 x) 2))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (div (* 2 (+ (+ x x) x)) y) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) (h0 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
