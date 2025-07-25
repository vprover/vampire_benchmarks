(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int)) Int (+ 2 x))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f2
  ((x Int)) Int
  (+
    (+
      (mod
        (mod (+ 1 (div x (+ 2 (* 2 (+ 2 2))))) (+ 1 (+ 2 (* 2 (+ 2 2)))))
        2)
      1)
    x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 x 2))
(define-fun
  fast
  ((x Int)) Int (- (v2 x) 1))
(define-fun
  f1
  ((x Int)) Int
  (ite (<= (mod x 2) 0) (div (div x 2) (+ 1 (+ 2 2))) 1))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) x))
(define-fun
  f0
  ((x Int)) Int (ite (<= (v1 x) 0) 1 0))
(define-fun-rec
  t0
  ((x Int)) Int (ite (<= (f0 x) 0) x (t0 (+ x 1))))
(define-fun-rec
  u0
  ((x Int)) Int (ite (<= x 0) (t0 0) (t0 (+ (u0 (- x 1)) 1))))
(define-fun
  small
  ((x Int)) Int (div (u0 x) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
