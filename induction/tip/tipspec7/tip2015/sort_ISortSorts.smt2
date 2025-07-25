(declare-datatype list ((nil) (cons (head Int) (tail list))))
(define-fun-rec
  ordered
  ((x list)) Bool
  (match x
    ((nil true)
     ((cons y z)
      (match z
        ((nil true)
         ((cons y2 xs) (and (<= y y2) (ordered (cons y2 xs))))))))))
(define-fun-rec
  insert2
  ((x Int) (y list)) list
  (match y
    ((nil (cons x nil))
     ((cons z xs)
      (ite (<= x z) (cons x (cons z xs)) (cons z (insert2 x xs)))))))
(define-fun-rec
  isort
  ((x list)) list
  (match x
    ((nil nil)
     ((cons y xs) (insert2 y (isort xs))))))
(assert-not (forall ((xs list)) (ordered (isort xs))))
(assert-claim (ordered nil))
(assert-claim (= (isort nil) nil))
(assert-claim (forall ((x list)) (=> (ordered x) (= (isort x) x))))
(assert-claim (forall ((x Int)) (= (insert2 x nil) (cons x nil))))
(assert-claim (forall ((x list)) (= (isort (isort x)) (isort x))))
(assert-claim (forall ((x list)) (ordered (isort x))))
(assert-claim
  (forall ((x Int) (y list))
    (= (isort (cons x y)) (insert2 x (isort y)))))
(assert-claim
  (forall ((x Int) (y list))
    (= (isort (insert2 x y)) (insert2 x (isort y)))))
(assert-claim
  (forall ((x Int) (y list))
    (= (ordered (insert2 x y)) (ordered y))))
(assert-claim
  (forall ((x Int) (y list))
    (= (insert2 x (cons x y)) (cons x (cons x y)))))
(assert-claim
  (forall ((x Int) (y Int) (z list))
    (= (insert2 y (insert2 x z)) (insert2 x (insert2 y z)))))
(assert-claim
  (forall ((x Int) (y Int) (z list))
    (=> (<= x y) (= (insert2 x (cons y z)) (cons x (cons y z))))))
(assert-claim
  (forall ((x Int) (y list))
    (= (ordered (cons x (insert2 x y))) (ordered (cons x y)))))
(assert-claim
  (forall ((x Int) (y Int) (z list))
    (=> (<= y x)
      (= (ordered (cons y (insert2 x z))) (ordered (cons y z))))))
(assert-claim
  (forall ((x Int) (y Int) (z list))
    (=> (<= y x)
      (= (ordered (cons x (insert2 y z)))
        (ordered (cons x (cons y z)))))))
(assert-claim
  (forall ((x Int) (y Int))
    (= (ordered (cons x (cons y nil))) (<= x y))))
