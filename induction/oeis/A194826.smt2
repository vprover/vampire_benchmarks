(define-fun
  g0
  ((x Int)) Int (+ (+ x x) x))
(define-fun
  fast
  ((x Int)) Int
  (mod (div (* (+ 1 x) (+ 2 (+ (* 2 (+ (+ x x) x)) x))) 2)
    (+ 2 (* 2 (+ 2 2)))))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (+ (+ x y) y) y))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 1))
(define-fun
  small
  ((x Int)) Int (mod (v0 x) (+ 2 (* 2 (+ 2 2)))))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
