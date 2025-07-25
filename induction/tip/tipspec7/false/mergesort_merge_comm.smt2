(declare-datatype list ((nil) (cons (head Int) (tail list))))
(define-fun-rec
  merge
  ((x list) (y list)) list
  (match x
    ((nil y)
     ((cons z xs)
      (match y
        ((nil (cons z xs))
         ((cons y2 ys)
          (ite
            (<= z y2) (cons z (merge xs (cons y2 ys)))
            (cons y2 (merge (cons z xs) ys))))))))))
(assert-not
  (forall ((xs list) (ys list) (zs list))
    (=> (= (merge xs ys) (merge ys xs))
      (=> (= (merge xs zs) (merge zs xs))
        (= (merge ys zs) (merge zs ys))))))
(assert-claim (forall ((x list)) (= (merge x nil) x)))
(assert-claim (forall ((x list)) (= (merge nil x) x)))
(assert-claim
  (forall ((x list) (y list) (z list))
    (= (merge (merge x y) z) (merge x (merge y z)))))
(assert-claim
  (forall ((x list) (y Int) (z list))
    (= (merge (cons y x) (cons y z)) (cons y (merge x (cons y z))))))
(assert-claim
  (forall ((x Int) (y Int))
    (= (merge (cons y nil) (cons x nil))
      (merge (cons x nil) (cons y nil)))))
