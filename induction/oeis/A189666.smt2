(define-fun
  h3
  ((x Int)) Int x)
(define-fun
  h2
  ((x Int)) Int (- x 1))
(define-fun
  g3
  () Int (+ 2 2))
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int) (y Int)) Int y)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f3
  ((x Int)) Int (ite (<= (- 1 (mod x (+ 1 2))) 0) (div x (+ 1 2)) x))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int)) Int (u3 g3 x))
(define-fun
  fast
  ((x Int)) Int (+ (+ (+ (+ (mod (+ (v3 x) x) 2) 2) x) x) x))
(define-fun
  f2
  ((x Int)) Int (ite (<= (- 1 (mod x (+ 1 2))) 0) (div x (+ 1 2)) x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 x (h2 x)))
(define-fun
  f1
  ((x Int)) Int (mod (+ (v2 x) x) 2))
(define-fun-rec
  t1
  ((x Int)) Int (ite (<= (f1 x) 0) x (t1 (+ x 1))))
(define-fun-rec
  u1
  ((x Int)) Int (ite (<= x 0) (t1 0) (t1 (+ (u1 (- x 1)) 1))))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 y))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (v1 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
