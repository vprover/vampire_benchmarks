(define-fun
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y x))
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int) (y Int)) Int (- (* 2 (+ (* 2 (+ y y)) 1)) x))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 (g1 x y) 1))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (v1 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 2 x))
(define-fun
  fast
  ((x Int)) Int
  (+ (ite (<= (div x (+ 1 (* 2 (+ 2 2)))) 0) x (+ 1 (* 2 (+ 2 2))))
    (* 2 (+ 2 2))))
(define-fun
  f1
  ((x Int) (y Int)) Int y)
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
