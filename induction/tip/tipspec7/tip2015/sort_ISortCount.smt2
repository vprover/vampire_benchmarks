(declare-sort sk 0)
(declare-datatype list2 ((nil2) (cons2 (head2 Int) (tail2 list2))))
(declare-datatype list ((nil) (cons (head sk) (tail list))))
(define-fun-rec
  insert2
  ((x Int) (y list2)) list2
  (match y
    ((nil2 (cons2 x nil2))
     ((cons2 z xs)
      (ite (<= x z) (cons2 x (cons2 z xs)) (cons2 z (insert2 x xs)))))))
(define-fun-rec
  isort
  ((x list2)) list2
  (match x
    ((nil2 nil2)
     ((cons2 y xs) (insert2 y (isort xs))))))
(define-fun-rec
  count2
  ((x Int) (y list2)) Int
  (match y
    ((nil2 0)
     ((cons2 z ys) (ite (= x z) (+ 1 (count2 x ys)) (count2 x ys))))))
(define-fun-rec
  count
  ((x sk) (y list)) Int
  (match y
    ((nil 0)
     ((cons z ys) (ite (= x z) (+ 1 (count x ys)) (count x ys))))))
(assert-not
  (forall ((x Int) (xs list2))
    (= (count2 x (isort xs)) (count2 x xs))))
(assert-claim (= (isort nil2) nil2))
(assert-claim (forall ((y sk)) (= (count y nil) 0)))
(assert-claim
  (forall ((x Int)) (= (insert2 x nil2) (cons2 x nil2))))
(assert-claim (forall ((x list2)) (= (isort (isort x)) (isort x))))
(assert-claim
  (forall ((x Int) (y list2)) (= (count2 x (isort y)) (count2 x y))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (isort (cons2 x y)) (insert2 x (isort y)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (isort (insert2 x y)) (insert2 x (isort y)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (insert2 x (cons2 x y)) (cons2 x (cons2 x y)))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (= (insert2 y (insert2 x z)) (insert2 x (insert2 y z)))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (=> (<= x y) (= (insert2 x (cons2 y z)) (cons2 x (cons2 y z))))))
(assert-claim
  (forall ((y sk) (z list))
    (= (+ 1 (count y z)) (count y (cons y z)))))
(assert-claim (forall ((y sk) (z list)) (<= 0 (count y z))))
(assert-claim
  (forall ((y sk) (z sk))
    (= (count z (cons y nil)) (count y (cons z nil)))))
(assert-claim
  (forall ((x list2)) (= (count2 0 (cons2 1 x)) (count2 0 x))))
(assert-claim
  (forall ((x list2)) (= (count2 1 (cons2 0 x)) (count2 1 x))))
(assert-claim
  (forall ((x list2))
    (= (insert2 1 (cons2 0 x)) (cons2 0 (insert2 1 x)))))
(assert-claim
  (forall ((y sk) (z sk) (x2 sk) (x3 list))
    (= (count y (cons x2 (cons z x3)))
      (count y (cons z (cons x2 x3))))))
(assert-claim
  (forall ((x Int) (y Int) (z Int) (x2 list2))
    (= (count2 x (cons2 y (insert2 z x2)))
      (count2 x (cons2 y (cons2 z x2))))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (count2 x (cons2 (+ x x) y)) (count2 x (cons2 0 y)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (<= x (count2 x (cons2 0 y))) (<= x (count2 x y)))))
(assert-claim
  (forall ((x list2) (y Int))
    (= (<= y (count2 y (cons2 1 x))) (<= y 1))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (<= x (count2 0 (cons2 x y))) (<= x (count2 0 y)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (<= (+ x x) (count2 1 y)) (<= (+ x x) (count2 x y)))))
(assert-claim
  (forall ((y sk) (z sk))
    (= (count z (cons y (cons y nil)))
      (count y (cons z (cons z nil))))))
(assert-claim
  (forall ((x Int) (y Int))
    (= (count2 x (cons2 (+ y x) nil2)) (count2 y (cons2 0 nil2)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (count2 x (cons2 (+ x 1) y)) (count2 x y))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (count2 (+ x x) (cons2 0 y)) (count2 (+ x x) (cons2 x y)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (count2 (+ x x) (cons2 1 y)) (count2 (+ x x) y))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (count2 (+ x 1) (cons2 x y)) (count2 (+ x 1) y))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (count2 0 (cons2 (+ x x) y)) (count2 0 (cons2 x y)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (count2 1 (cons2 (+ x x) y)) (count2 1 y))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (insert2 (+ x 1) (cons2 x y)) (cons2 x (insert2 (+ x 1) y)))))
(assert-claim
  (forall ((x Int) (y Int))
    (= (<= x (count2 y (cons2 1 nil2)))
      (<= x (count2 x (cons2 y nil2))))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (<= x (count2 (+ x x) y)) (<= x (count2 (+ 1 1) y)))))
(assert-claim
  (forall ((y sk) (z sk)) (<= (count y (cons z nil)) 1)))
(assert-claim
  (forall ((x Int) (y Int))
    (= (<= (count2 x (cons2 0 nil2)) y)
      (<= (count2 x (cons2 y nil2)) y))))
(assert-claim
  (forall ((x list2))
    (= (insert2 (+ 1 1) (cons2 0 x)) (cons2 0 (insert2 (+ 1 1) x)))))
