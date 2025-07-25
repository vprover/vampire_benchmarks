(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (+ (u1 (- x 1) y) x)))
(define-fun
  h1
  ((x Int)) Int (* (* x x) x))
(define-fun
  v1
  ((x Int)) Int (u1 x (h1 x)))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (v1 (u0 (- x 1) y))))
(define-fun
  h0
  ((x Int)) Int (+ 1 x))
(define-fun
  v0
  ((x Int)) Int (u0 1 (h0 x)))
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int (div (* (+ 1 x) (+ 2 (* (+ 1 (+ x x)) (+ 2 x)))) 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
