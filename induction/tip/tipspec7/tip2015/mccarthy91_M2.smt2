(define-fun-rec
  m
  ((x Int)) Int (ite (> x 100) (- x 10) (m (m (+ x 11)))))
(assert-not (forall ((n Int)) (=> (>= n 101) (= (m n) (- n 10)))))
(assert-claim (forall ((x Int) (y Int)) (= (m x) (m y))))
(assert-claim (forall ((x Int)) (= (m x) (- 101 10))))
