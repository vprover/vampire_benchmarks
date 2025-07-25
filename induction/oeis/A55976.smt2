(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(define-fun
  small
  ((x Int)) Int (mod (+ 1 (v0 x)) (+ 1 x)))
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int)) Int (div x 2))
(define-fun
  g1
  ((x Int)) Int (mod (+ 1 x) 2))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f2
  ((x Int)) Int (+ x x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) 1))
(define-fun
  f1
  ((x Int)) Int (mod (- 1 (v2 x)) (+ 1 x)))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) x))
(define-fun
  fast
  ((x Int)) Int
  (mod
    (-
      (mod
        (mod
          (- (- (* (+ (+ (ite (<= (- (v1 x) 2) 0) 1 (+ 1 2)) 1) x) 2) 1) x)
          (+ 2 x))
        (+ 1 2))
      1)
    (+ 1 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
