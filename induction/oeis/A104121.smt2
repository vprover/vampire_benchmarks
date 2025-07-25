(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int)) Int (- 1 (mod x (* 2 (+ 2 2)))))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f1
  ((x Int)) Int (+ 1 (div x (* 2 (+ 2 (+ 2 2))))))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) x))
(define-fun
  fast
  ((x Int)) Int (mod 1 (v1 x)))
(define-fun
  f0
  ((x Int) (y Int)) Int (- y x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 2))
(define-fun
  small
  ((x Int)) Int (ite (<= (mod x (+ 2 (v0 x))) 0) 0 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
