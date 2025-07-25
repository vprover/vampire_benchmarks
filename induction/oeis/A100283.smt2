(define-fun
  fast
  ((x Int)) Int
  (mod
    (ite
      (<=
        (mod (- (mod (+ 1 x) (* 2 (* 2 (+ 2 (* 2 (+ 2 2)))))) 1) (+ 1 2))
        0)
      1 0)
    (+ 1 x)))
(define-fun
  f0
  ((x Int)) Int (* (+ 2 x) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  () Int (u0 2 2))
(define-fun
  small
  ((x Int)) Int
  (mod (ite (<= (mod (mod (+ 1 (+ 2 (+ x x))) v0) (+ 2 1)) 0) 1 0)
    (+ 1 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
