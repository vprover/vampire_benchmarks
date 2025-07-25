(define-fun
  v0
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z 1))
(define-fun
  j0
  ((x Int)) Int (ite (<= x 0) 0 1))
(define-fun
  fast
  ((x Int)) Int
  (* 2 (* (+ 1 (+ 2 (* 2 (+ 2 2)))) (ite (<= x 0) 1 2))))
(define-fun
  f0
  ((x Int) (y Int)) Int (* (+ x y) x))
(define-fun-rec
  u0
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))
(define-fun
  w0
  ((x Int)) Int (u0 2 2 (j0 x)))
(define-fun
  small
  ((x Int)) Int (+ (w0 x) 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
