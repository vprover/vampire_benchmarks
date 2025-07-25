(declare-sort sk 0)
(declare-datatype pair ((pair2 (proj1-pair sk) (proj2-pair sk))))
(declare-datatype list2 ((nil) (cons (head sk) (tail list2))))
(declare-datatype list ((nil2) (cons2 (head2 Int) (tail2 list))))
(declare-datatype
  pair3 ((pair22 (proj1-pair2 Bool) (proj2-pair2 list))))
(define-fun-rec
  count2
  ((x Int) (y list)) Int
  (match y
    ((nil2 0)
     ((cons2 z ys) (ite (= x z) (+ 1 (count2 x ys)) (count2 x ys))))))
(define-fun-rec
  count
  ((x sk) (y list2)) Int
  (match y
    ((nil 0)
     ((cons z ys) (ite (= x z) (+ 1 (count x ys)) (count x ys))))))
(define-fun-rec
  bubble
  ((x list)) pair3
  (match x
    ((nil2 (pair22 false nil2))
     ((cons2 y z)
      (match z
        ((nil2 (pair22 false (cons2 y nil2)))
         ((cons2 y2 xs)
          (ite
            (<= y y2)
            (match (bubble (cons2 y2 xs))
              (((pair22 b12 ys12) (pair22 b12 (cons2 y ys12)))))
            (match (bubble (cons2 y xs))
              (((pair22 b1 ys1) (pair22 true (cons2 y2 ys1)))))))))))))
(define-fun-rec
  bubsort
  ((x list)) list
  (match (bubble x) (((pair22 c ys1) (ite c (bubsort ys1) x)))))
(assert-not
  (forall ((x Int) (xs list))
    (= (count2 x (bubsort xs)) (count2 x xs))))
(assert-claim (= (bubsort nil2) nil2))
(assert-claim
  (forall ((x list)) (= (bubsort (bubsort x)) (bubsort x))))
(assert-claim (forall ((y sk)) (= (count y nil) 0)))
(assert-claim
  (forall ((x Int) (y list))
    (= (count2 x (bubsort y)) (count2 x y))))
(assert-claim
  (forall ((x Int)) (= (bubsort (cons2 x nil2)) (cons2 x nil2))))
(assert-claim
  (forall ((y sk) (z list2))
    (= (+ 1 (count y z)) (count y (cons y z)))))
(assert-claim (forall ((y sk) (z list2)) (<= 0 (count y z))))
(assert-claim
  (forall ((x Int) (y list))
    (= (bubsort (cons2 x (bubsort y))) (bubsort (cons2 x y)))))
(assert-claim
  (forall ((y sk) (z sk))
    (= (count z (cons y nil)) (count y (cons z nil)))))
(assert-claim
  (forall ((x list)) (= (count2 0 (cons2 1 x)) (count2 0 x))))
(assert-claim
  (forall ((x list)) (= (count2 1 (cons2 0 x)) (count2 1 x))))
(assert-claim
  (forall ((x Int) (y Int) (z Int) (x2 list))
    (=> (<= z x)
      (= (bubsort (cons2 z (cons2 y x2)))
        (bubsort (cons2 y (cons2 z x2)))))))
(assert-claim
  (forall ((x Int))
    (= (bubsort (cons2 x (cons2 x nil2))) (cons2 x (cons2 x nil2)))))
(assert-claim
  (forall ((x Int) (y Int))
    (=> (<= x y)
      (= (bubsort (cons2 x (cons2 y nil2))) (cons2 x (cons2 y nil2))))))
(assert-claim
  (forall ((x list) (y Int) (z list))
    (= (<= (+ y y) (count2 y x)) (<= (+ y y) (count2 y z)))))
(assert-claim
  (forall ((x list) (y Int))
    (= (<= (count2 (+ y y) x) y) (<= (count2 y x) (+ y y)))))
(assert-claim
  (forall ((y sk) (z sk) (x2 sk) (x3 list2))
    (= (count y (cons x2 (cons z x3)))
      (count y (cons z (cons x2 x3))))))
(assert-claim
  (forall ((x Int) (y list))
    (= (count2 x (cons2 (+ x x) y)) (count2 x (cons2 0 y)))))
(assert-claim
  (forall ((x Int) (y list))
    (= (<= x (count2 x (cons2 0 y))) (<= x (count2 x y)))))
(assert-claim
  (forall ((x list) (y Int))
    (= (<= y (count2 y (cons2 1 x))) (<= y 1))))
(assert-claim
  (forall ((x Int) (y list))
    (= (<= x (count2 (+ x 1) y)) (<= x (count2 (+ x x) y)))))
(assert-claim
  (forall ((x Int) (y list))
    (= (<= x (count2 0 (cons2 x y))) (<= x (count2 0 y)))))
(assert-claim
  (forall ((x Int) (y list))
    (= (<= (+ x x) (count2 1 y)) (<= (+ x x) (count2 x y)))))
(assert-claim
  (forall ((x list) (y Int))
    (= (<= (count2 1 x) (+ y y)) (<= (count2 (+ y 1) x) y))))
(assert-claim
  (forall ((y sk) (z sk))
    (= (count z (cons y (cons y nil)))
      (count y (cons z (cons z nil))))))
(assert-claim
  (forall ((x Int) (y Int))
    (= (count2 x (cons2 (+ y x) nil2)) (count2 y (cons2 0 nil2)))))
(assert-claim
  (forall ((x Int) (y list))
    (= (count2 x (cons2 (+ x 1) y)) (count2 x y))))
(assert-claim
  (forall ((x Int) (y list))
    (= (count2 (+ x x) (cons2 0 y)) (count2 (+ x x) (cons2 x y)))))
(assert-claim
  (forall ((x Int) (y list))
    (= (count2 (+ x x) (cons2 1 y)) (count2 (+ x x) y))))
(assert-claim
  (forall ((x Int) (y list))
    (= (count2 (+ x 1) (cons2 x y)) (count2 (+ x 1) y))))
(assert-claim
  (forall ((x Int) (y list))
    (= (count2 0 (cons2 (+ x x) y)) (count2 0 (cons2 x y)))))
(assert-claim
  (forall ((x Int) (y list))
    (= (count2 1 (cons2 (+ x x) y)) (count2 1 y))))
(assert-claim
  (forall ((x Int) (y Int))
    (= (<= x (count2 y (cons2 1 nil2)))
      (<= x (count2 x (cons2 y nil2))))))
(assert-claim
  (forall ((x Int) (y list))
    (= (<= x (count2 (+ 1 1) y)) (<= x (count2 (+ x x) y)))))
(assert-claim
  (forall ((y Int) (z Int) (x2 sk) (x3 sk))
    (= (<= (count2 y (cons2 z nil2)) 1)
      (<= (count x2 (cons x3 nil)) 1))))
(assert-claim
  (forall ((x Int) (y Int))
    (= (<= (count2 x (cons2 0 nil2)) y)
      (<= (count2 x (cons2 y nil2)) y))))
