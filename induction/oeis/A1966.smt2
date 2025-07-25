(define-fun
  h0
  ((x Int)) Int (+ (+ 1 x) x))
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int
  (+
    (+
      (+
        (+
          (+
            (+
              (div (+ 1 (+ (div (- 2 (div x (+ 1 (* 2 (+ 2 2))))) 2) x)) (+ 2 2))
              2)
            x)
          x)
        x)
      x)
    x))
(define-fun
  f1
  ((x Int) (y Int)) Int (+ (div (* y y) (+ 2 x)) y))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int)) Int (u1 x 0))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (v1 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 2 (h0 x)))
(define-fun
  small
  ((x Int)) Int (+ (v0 x) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
