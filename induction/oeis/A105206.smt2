(define-fun
  g1
  ((x Int)) Int (+ 1 x))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int
  (+ (+ (+ (div (+ 1 (* 2 (+ (+ x x) x))) (+ (+ (+ 2 2) 2) x)) 1) x)
    2))
(define-fun
  f1
  ((x Int) (y Int)) Int (+ (- 2 (ite (<= x 0) 0 y)) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) 2))
(define-fun-rec
  t0
  ((x Int)) Int (ite (<= (v1 x) 0) x (t0 (+ x 1))))
(define-fun-rec
  u0
  ((x Int)) Int (ite (<= x 0) (t0 0) (t0 (+ (u0 (- x 1)) 1))))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (u0 c) (fast c)))))
