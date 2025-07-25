(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f1
  ((x Int)) Int (+ 1 x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  () Int (u1 2 2))
(define-fun
  fast
  ((x Int)) Int
  (+
    (+ (- (* (mod (ite (<= x 0) 1 (* 2 (+ (* 2 (+ x x)) x))) v1) 2) 1)
      x)
    (mod (div x 2) 2)))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (- (* (* (mod y 2) 2) 2) (mod x 2)) y))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
