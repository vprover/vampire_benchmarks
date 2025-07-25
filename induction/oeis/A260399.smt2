(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (+ (u2 (- x 1) y) x)))
(define-fun
  h4
  ((x Int)) Int x)
(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  g4
  ((x Int)) Int (+ x x))
(define-fun
  g3
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int)) Int (div x 2))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) x))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f4
  ((x Int)) Int (ite (<= (mod x 2) 0) 1 (div x 2)))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (f4 (u4 (- x 1) y))))
(define-fun
  v4
  ((x Int)) Int (u4 (g4 x) x))
(define-fun
  f3
  ((x Int)) Int
  (mod
    (div (+ (* (mod (ite (<= (v4 x) 0) 1 0) (+ 1 x)) (* x (+ 1 2))) 1)
      (+ 2 2))
    2))
(define-fun-rec
  t3
  ((x Int)) Int (ite (<= (f3 x) 0) x (t3 (+ x 1))))
(define-fun-rec
  u3
  ((x Int)) Int (ite (<= x 0) (t3 0) (t3 (+ (u3 (- x 1)) 1))))
(define-fun
  fast
  ((x Int)) Int (+ (u3 x) 1))
(define-fun
  f1
  ((x Int)) Int (ite (<= (mod x 2) 0) 1 (div x 2)))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 (v2 x) x))
(define-fun
  f0
  ((x Int)) Int (+ (+ (v1 x) 1) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
