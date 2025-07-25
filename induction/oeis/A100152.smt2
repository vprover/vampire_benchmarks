(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int
  (+
    (+
      (div
        (*
          (+ (+ (* (- (* 2 (* 2 (* 2 (+ 2 2)))) 1) (div (+ (* x x) x) 2)) x)
            x)
          (+ 1 x))
        (+ 1 2))
      1)
    x))
(define-fun
  f0
  ((x Int) (y Int)) Int
  (+ (div (+ (* 2 (+ (* 2 (* (+ 1 (+ 2 2)) (* y y))) x)) x) y) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(define-fun
  small
  ((x Int)) Int (* 1 (v0 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
