(define-fun
  g1
  ((x Int)) Int (- 1 (mod x (+ 1 2))))
(define-fun
  f1
  () Int (+ 1 (+ 2 (* 2 (* 2 (+ 2 2))))))
(define-fun
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y f1))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) 2))
(define-fun
  fast
  ((x Int)) Int (* (v1 x) (ite (<= x 0) 1 2)))
(define-fun
  f0
  ((x Int)) Int (* x x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  () Int (u0 2 2))
(define-fun
  small
  ((x Int)) Int
  (* (+ 1 (ite (<= (mod x (+ 1 2)) 0) (+ 2 v0) 1))
    (ite (<= x 0) 1 2)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
