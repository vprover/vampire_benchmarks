(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int
  (div
    (+
      (+
        (-
          (+
            (+
              (+
                (+ (- (* 2 (+ 2 (+ 2 (+ 2 x)))) (div (div x 2) 2))
                  (ite (<= x 0) 1 2))
                x)
              x)
            x)
          1)
        x)
      (ite (<= x 0) 2 2))
    (+ x (* (* 2 2) 2))))
(define-fun
  f1
  ((x Int) (y Int)) Int (+ (+ (+ x x) x) y))
(define-funs-rec
  ((u1
    ((x Int) (y Int) (z Int)) Int)
   (v1
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z)))
   (ite (<= x 0) z (u1 (- x 1) y z))))
(define-fun
  w1
  ((x Int)) Int (u1 x 0 1))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (div y (w1 x)) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
