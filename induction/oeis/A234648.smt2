(define-fun
  h3
  ((x Int)) Int x)
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  g3
  () Int (+ 1 (+ 2 (* 2 (* 2 (+ 2 2))))))
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int)) Int (+ 2 x))
(define-fun
  g0
  ((x Int)) Int (+ 1 x))
(define-fun
  f3
  ((x Int)) Int (div (ite (<= (mod x 2) 0) 2 x) 2))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int)) Int (u3 g3 x))
(define-fun-rec
  t2
  ((x Int)) Int (ite (<= (v3 x) 0) x (t2 (+ x 1))))
(define-fun-rec
  u2
  ((x Int)) Int (ite (<= x 0) (t2 0) (t2 (+ (u2 (- x 1)) 1))))
(define-fun
  fast
  ((x Int)) Int (* (+ (+ (* (u2 x) 2) 1) (mod x 2)) 2))
(define-fun
  f1
  ((x Int)) Int (ite (<= (mod x 2) 0) (div x 2) 2))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) x))
(define-fun
  f0
  ((x Int)) Int (- (v1 x) 1))
(define-fun-rec
  t0
  ((x Int)) Int (ite (<= (f0 x) 0) x (t0 (+ x 1))))
(define-fun-rec
  u0
  ((x Int)) Int (ite (<= x 0) (t0 0) (t0 (+ (u0 (- x 1)) 1))))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x)))
(define-fun
  small
  ((x Int)) Int (- (* (+ (v0 x) (mod x 2)) 2) 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
