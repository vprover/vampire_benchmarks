(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int)) Int (ite (<= (mod x (+ 1 (+ 2 (* 2 (+ 2 2))))) 0) 1 0))
(define-fun
  f1
  ((x Int)) Int (div x (+ 2 (* 2 (+ 2 2)))))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) x))
(define-fun
  f0
  ((x Int)) Int (+ 1 (+ x x)))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  () Int (u0 2 2))
(define-fun
  small
  ((x Int)) Int
  (div x (ite (<= (mod x v0) 0) (+ 2 (* 2 (+ 2 2))) 1)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (v1 c)))))
