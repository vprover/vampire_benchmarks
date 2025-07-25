(declare-datatype list ((nil) (cons (head Int) (tail list))))
(declare-datatype
  pair ((pair2 (proj1-pair Bool) (proj2-pair list))))
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
(assert-not (forall ((xs list)) (ordered (bubsort xs))))
(assert-claim (ordered nil))
(assert-claim (= (bubsort nil) nil))
(assert-claim
  (forall ((x list)) (=> (ordered x) (= (bubsort x) x))))
(assert-claim
  (forall ((x list)) (= (bubsort (bubsort x)) (bubsort x))))
(assert-claim (forall ((x list)) (ordered (bubsort x))))
(assert-claim
  (forall ((x Int)) (= (bubsort (cons x nil)) (cons x nil))))
(assert-claim
  (forall ((x Int) (y list))
    (= (bubsort (cons x (bubsort y))) (bubsort (cons x y)))))
(assert-claim
  (forall ((x Int) (y Int) (z Int) (x2 list))
    (=> (<= z x)
      (= (bubsort (cons z (cons y x2)))
        (bubsort (cons y (cons z x2)))))))
(assert-claim
  (forall ((x Int) (y list))
    (= (ordered (cons x (cons x y))) (ordered (cons x y)))))
(assert-claim
  (forall ((x Int) (y Int) (z list))
    (=> (<= x y)
      (= (ordered (cons x (cons y z))) (ordered (cons y z))))))
(assert-claim
  (forall ((x Int))
    (= (bubsort (cons x (cons x nil))) (cons x (cons x nil)))))
(assert-claim
  (forall ((x Int) (y Int))
    (=> (<= x y)
      (= (bubsort (cons x (cons y nil))) (cons x (cons y nil))))))
(assert-claim
  (forall ((x Int) (y Int))
    (= (ordered (cons x (cons y nil))) (<= x y))))
(assert-claim
  (forall ((x Int) (y list))
    (= (ordered (cons x (bubsort (cons x y))))
      (ordered (cons x (bubsort y))))))
