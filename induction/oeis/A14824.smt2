(define-fun
  g1
  ((x Int)) Int (- x 1))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f1
  ((x Int) (y Int)) Int (* (+ 2 (* 2 (+ 2 2))) (+ x y)))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) 0))
(define-fun
  fast
  ((x Int)) Int (+ (v1 x) x))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (* 2 (+ (* 2 (+ x x)) x)) y))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 0))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
