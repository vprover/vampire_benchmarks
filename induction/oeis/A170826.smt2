(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u1 (- x 1) y) x)))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(define-fun
  small
  ((x Int)) Int (* (+ (- 1 (mod (v0 x) (+ 1 x))) x) (+ 1 x)))
(define-fun
  g1
  ((x Int)) Int (- x 1))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) 1))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int (+ (+ (* (mod (+ (v1 x) x) (+ 1 x)) (+ 1 x)) 1) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
