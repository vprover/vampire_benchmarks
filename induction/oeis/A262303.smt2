(define-fun
  h3
  () Int (+ 1 (+ 2 2)))
(define-fun
  g3
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int)) Int (+ x 2))
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f3
  ((x Int)) Int (+ x x))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int)) Int (u3 x h3))
(define-fun
  f2
  ((x Int) (y Int)) Int (+ (div y (v3 x)) x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y) x)))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) 0))
(define-fun
  f1
  ((x Int)) Int (* 2 (+ 2 x)))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 x 1))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (div y (+ 2 (v1 x))) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 0))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (v2 c)))))
