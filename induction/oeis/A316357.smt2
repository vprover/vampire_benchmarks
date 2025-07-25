(define-fun
  h0
  ((x Int)) Int (div (+ (* x x) x) 2))
(define-fun
  fast
  ((x Int)) Int
  (+
    (*
      (*
        (div (+ (div (* (+ 1 (+ 2 2)) (+ (* x x) x)) (+ 2 (+ 2 2))) 1) 2)
        2)
      2)
    1))
(define-fun
  f0
  ((x Int)) Int (+ (+ (div (+ x x) (+ 1 2)) (mod x 2)) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 1 (h0 x)))
(define-fun
  small
  ((x Int)) Int (+ (* (v0 x) 2) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
