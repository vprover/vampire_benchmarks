(define-fun
  g0
  ((x Int)) Int (+ (+ x x) x))
(define-fun
  fast
  ((x Int)) Int
  (+
    (+
      (+
        (+
          (div
            (+
              (+
                (- (+ (+ (* (div (+ (+ x x) x) (+ 1 (+ 2 (+ 2 2)))) 2) 1) x)
                  (ite (<= x 0) 0 2))
                x)
              x)
            (+ 1 2))
          1)
        x)
      x)
    x))
(define-fun
  f0
  ((x Int)) Int
  (+ (ite (<= (mod (mod x (+ 2 (* 2 (+ 2 2)))) (+ 2 2)) 0) 2 1) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
