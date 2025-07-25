(define-fun
  h0
  ((x Int)) Int (+ x x))
(define-fun
  fast
  ((x Int)) Int (- (* 2 (* 2 (* (+ 1 (+ 2 2)) (+ 1 (+ x x))))) 1))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (* (+ 1 x) (+ 2 y)) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 2 (h0 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
