(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g0
  () Int (+ 2 2))
(define-fun
  fast
  ((x Int)) Int
  (+
    (+
      (+
        (+
          (+
            (+
              (+
                (div
                  (+ (+ (+ (div (+ (* 2 (+ x x)) x) (+ 1 (* 2 (+ 2 (+ 2 2))))) 1) x)
                    x)
                  2)
                x)
              x)
            2)
          x)
        x)
      2)
    x))
(define-fun
  f1
  ((x Int)) Int (+ (+ (+ x x) x) 2))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  () Int (u1 2 2))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (+ (+ x x) x) y))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 g0 x))
(define-fun
  small
  ((x Int)) Int (div (+ (- (* (v0 x) 2) x) 1) v1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
