(define-fun
  h0
  ((x Int)) Int (div x (+ 2 2)))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int
  (*
    (div
      (-
        (+
          (+ (div (* (+ 1 (* 2 (+ 2 x))) (* (+ 2 x) x)) (+ 1 2)) (div x 2))
          2)
        x)
      2)
    2))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (* (+ 2 y) y) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x (h0 x)))
(define-fun
  small
  ((x Int)) Int (* (+ 1 (v0 x)) 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
