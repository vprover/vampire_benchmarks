(define-fun
  h0
  ((x Int)) Int (* (+ 1 2) (div x 2)))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int
  (+
    (*
      (+ (div (- (* (* x x) x) x) (+ 1 2)) (div (* (+ 2 x) x) (+ 2 2)))
      2)
    x))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (- (* 2 (* y y)) y) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x (h0 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
