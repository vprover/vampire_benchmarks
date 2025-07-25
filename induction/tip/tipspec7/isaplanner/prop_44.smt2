(declare-sort sk 0)
(declare-datatype pair ((pair2 (proj1-pair sk) (proj2-pair sk))))
(declare-datatype list2 ((nil2) (cons2 (head2 sk) (tail2 list2))))
(declare-datatype list ((nil) (cons (head pair) (tail list))))
(define-fun-rec
  zip
  ((x list2) (y list2)) list
  (match x
    ((nil2 nil)
     ((cons2 z x2)
      (match y
        ((nil2 nil)
         ((cons2 x3 x4) (cons (pair2 z x3) (zip x2 x4)))))))))
(define-fun
  zipConcat
  ((x sk) (y list2) (z list2)) list
  (match z
    ((nil2 nil)
     ((cons2 y2 ys) (cons (pair2 x y2) (zip y ys))))))
(assert-not
  (forall ((x sk) (xs list2) (ys list2))
    (= (zip (cons2 x xs) ys) (zipConcat x xs ys))))
(assert-claim (forall ((y list2)) (= (zip y nil2) nil)))
(assert-claim (forall ((y list2)) (= (zip nil2 y) nil)))
(assert-claim (forall ((y sk) (z list2)) true))
(assert-claim
  (forall ((z sk) (x2 list2) (x3 list2))
    (= (zip (cons2 z x2) x3) (zipConcat z x2 x3))))
(assert-claim
  (forall ((z list2) (x2 sk) (x3 sk))
    (and (and (= x2 x2) (= x3 x3)) (= (zip z nil2) nil))))
(assert-claim
  (forall ((z list2) (x2 sk) (x3 sk))
    (and (and (= x2 x2) (= x3 x3)) (= (zip nil2 z) nil))))
(assert-claim
  (forall ((z sk) (x2 list2) (x3 sk) (x4 list2))
    (and (and (= z z) (= x3 x3)) (= (zip x2 x4) (zip x2 x4)))))
