(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int)) Int (mod (div (+ 2 x) 2) 2))
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f2
  ((x Int)) Int
  (- (mod (mod (* (* x x) x) (+ 1 (* 2 (+ 2 (+ 2 2))))) (+ 1 2)) 1))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) x))
(define-fun-rec
  t1
  ((x Int)) Int (ite (<= (v2 x) 0) x (t1 (+ x 1))))
(define-fun-rec
  u1
  ((x Int)) Int (ite (<= x 0) (t1 0) (t1 (+ (u1 (- x 1)) 1))))
(define-fun
  f0
  ((x Int)) Int
  (mod
    (div
      (ite
        (<=
          (- (mod (mod (* (* x x) x) (+ 1 (* 2 (+ 2 (+ 2 2))))) (+ 1 2)) 1)
          0)
        x 2)
      2)
    2))
(define-fun-rec
  t0
  ((x Int)) Int (ite (<= (f0 x) 0) x (t0 (+ x 1))))
(define-fun-rec
  u0
  ((x Int)) Int (ite (<= x 0) (t0 0) (t0 (+ (u0 (- x 1)) 1))))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (u0 c) (u1 c)))))
