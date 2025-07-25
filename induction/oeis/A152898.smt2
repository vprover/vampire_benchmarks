(define-fun
  v0
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z 0))
(define-fun
  h0
  ((x Int)) Int (mod x (+ 1 (+ 2 2))))
(define-fun
  fast
  ((x Int)) Int (mod (* (+ 1 (* x x)) (+ 1 x)) (+ 1 (+ 2 2))))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ y y))
(define-fun-rec
  u0
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))
(define-fun
  w0
  ((x Int)) Int (u0 (h0 x) 1 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (w0 c) (fast c)))))
