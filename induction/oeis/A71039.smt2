(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f2
  ((x Int)) Int (* x x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  () Int (u2 2 2))
(define-fun
  g1
  () Int (+ 2 v2))
(define-fun
  f1
  ((x Int) (y Int)) Int (- (ite (<= (- y x) 0) y 0) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int)) Int (u1 g1 x))
(define-fun
  fast
  ((x Int)) Int
  (mod
    (ite
      (<=
        (mod
          (+ (+ (mod (- (mod (+ (+ (v1 x) 1) x) 2) (mod x 2)) 2) (mod x 2))
            x)
          (+ 2 2))
        0)
      2 1)
    2))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (div y (* x x)) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(define-fun
  small
  ((x Int)) Int (ite (<= (mod (+ (mod (v0 x) 2) x) (+ 2 2)) 0) 0 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
