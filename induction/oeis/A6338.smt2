(define-fun
  h3
  ((x Int)) Int x)
(define-fun
  h1
  ((x Int) (y Int)) Int y)
(define-fun
  g2
  ((x Int)) Int (+ x x))
(define-fun
  g0
  ((x Int)) Int (+ 2 x))
(define-fun
  f3
  ((x Int)) Int
  (+
    (mod
      (+ (- 1 (div (- x (div x (+ 1 (+ 2 (+ 2 2))))) (+ 1 (+ 2 2)))) x)
      2)
    x))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int)) Int (u3 2 x))
(define-fun
  fast
  ((x Int)) Int (+ (mod (+ (v3 x) x) 2) 1))
(define-fun
  f2
  ((x Int) (y Int)) Int (+ (+ (div (* y y) (+ x y)) 2) y))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y) x)))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) 1))
(define-fun
  f1
  ((x Int)) Int (mod (v2 x) 2))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 1 y))
(define-fun
  f0
  ((x Int) (y Int)) Int (div (+ (v1 x y) x) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
