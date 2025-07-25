(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int
  (+
    (+
      (+
        (div
          (+
            (+
              (*
                (+
                  (+ (div (+ 1 (+ 2 (+ 2 x))) (+ 1 (+ 2 (* 2 (+ 2 2)))))
                    (ite (<= x 0) 1 x))
                  x)
                2)
              1)
            x)
          (+ 1 2))
        x)
      x)
    x))
(define-fun
  f1
  ((x Int)) Int
  (+
    (+
      (mod
        (+
          (+ (div (mod x (+ 1 (* 2 (+ 2 (+ 2 2))))) (+ 1 (* 2 (+ 2 2)))) 1)
          x)
        2)
      2)
    x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 2 x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (v1 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
