(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (+ (u1 (- x 1) y) x)))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (- (u0 (- x 1) y) x)))
(define-fun
  g1
  ((x Int)) Int (* (+ 2 2) (+ 1 x)))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) 1))
(define-fun
  v0
  ((x Int)) Int (u0 x (v1 x)))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int
  (+ 1 (* (+ 1 (+ 2 2)) (div (* (+ 1 x) (+ (* 2 (+ 2 x)) x)) 2))))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
