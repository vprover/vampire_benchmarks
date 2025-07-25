(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int
  (div
    (+
      (-
        (-
          (*
            (* (* (+ 1 (+ (mod x 2) x)) (+ 1 x)) (- (- 1 (mod x 2)) (mod x 2)))
            2)
          1)
        x)
      1)
    2))
(define-fun
  f0
  ((x Int) (y Int)) Int
  (- (ite (<= x 0) 1 (- 2 (* 2 (+ 2 (+ y y))))) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
