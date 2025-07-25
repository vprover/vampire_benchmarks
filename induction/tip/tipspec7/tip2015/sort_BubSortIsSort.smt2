(declare-datatype list ((nil) (cons (head Int) (tail list))))
(declare-datatype
  pair ((pair2 (proj1-pair Bool) (proj2-pair list))))
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
(define-fun-rec
  bubble
  ((x list)) pair
  (match x
    ((nil (pair2 false nil))
     ((cons y z)
      (match z
        ((nil (pair2 false (cons y nil)))
         ((cons y2 xs)
          (ite
            (<= y y2)
            (match (bubble (cons y2 xs))
              (((pair2 b12 ys12) (pair2 b12 (cons y ys12)))))
            (match (bubble (cons y xs))
              (((pair2 b1 ys1) (pair2 true (cons y2 ys1)))))))))))))
(define-fun-rec
  bubsort
  ((x list)) list
  (match (bubble x) (((pair2 c ys1) (ite c (bubsort ys1) x)))))
(assert-not (forall ((xs list)) (= (bubsort xs) (isort xs))))
(assert-claim (= (bubsort nil) nil))
(assert-claim (forall ((x list)) (= (bubsort x) (isort x))))
(assert-claim
  (forall ((x list)) (= (bubsort (bubsort x)) (bubsort x))))
(assert-claim (forall ((x Int)) (= (insert2 x nil) (cons x nil))))
(assert-claim
  (forall ((x Int) (y list))
    (= (bubsort (insert2 x y)) (bubsort (cons x y)))))
(assert-claim
  (forall ((x Int) (y list))
    (= (insert2 x (bubsort y)) (bubsort (cons x y)))))
(assert-claim
  (forall ((x Int) (y list))
    (= (insert2 x (cons x y)) (cons x (cons x y)))))
(assert-claim
  (forall ((x Int) (y Int) (z list))
    (= (insert2 y (insert2 x z)) (insert2 x (insert2 y z)))))
(assert-claim
  (forall ((x Int) (y Int) (z list))
    (=> (<= x y) (= (insert2 x (cons y z)) (cons x (cons y z))))))
