(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int)) Int (+ 2 x))
(define-fun
  fast
  ((x Int)) Int
  (mod
    (-
      (div
        (+
          (+
            (*
              (*
                (div
                  (+ (+ (div (+ (+ x x) x) (- (* 2 (* 2 (* 2 (+ 2 2)))) 1)) x) x)
                  2)
                2)
              2)
            1)
          x)
        (+ 1 2))
      x)
    2))
(define-fun
  f1
  ((x Int) (y Int)) Int (+ (div (* y y) (+ 2 (+ x x))) y))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) 0))
(define-fun
  f0
  ((x Int)) Int (+ (mod (v1 x) 2) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 2 x))
(define-fun
  small
  ((x Int)) Int (mod (+ (+ (v0 x) 1) x) 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
