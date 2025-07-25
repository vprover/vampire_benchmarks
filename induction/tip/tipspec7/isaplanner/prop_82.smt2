(declare-sort sk 0)
(declare-datatype pair ((pair2 (proj1-pair sk) (proj2-pair sk))))
(declare-datatype list2 ((nil2) (cons2 (head2 sk) (tail2 list2))))
(declare-datatype list ((nil) (cons (head pair) (tail list))))
(declare-datatype Nat ((Z) (S (proj1-S Nat))))
(define-fun-rec
  zip
  ((x list2) (y list2)) list
  (match x
    ((nil2 nil)
     ((cons2 z x2)
      (match y
        ((nil2 nil)
         ((cons2 x3 x4) (cons (pair2 z x3) (zip x2 x4)))))))))
(define-fun-rec
  take2
  ((x Nat) (y list2)) list2
  (match x
    ((Z nil2)
     ((S z)
      (match y
        ((nil2 nil2)
         ((cons2 x2 x3) (cons2 x2 (take2 z x3)))))))))
(define-fun-rec
  take
  ((x Nat) (y list)) list
  (match x
    ((Z nil)
     ((S z)
      (match y
        ((nil nil)
         ((cons x2 x3) (cons x2 (take z x3)))))))))
(assert-not
  (forall ((n Nat) (xs list2) (ys list2))
    (= (take n (zip xs ys)) (zip (take2 n xs) (take2 n ys)))))
(assert-claim (forall ((y Nat)) (= (take2 y nil2) nil2)))
(assert-claim (forall ((y list2)) (= (take2 Z y) nil2)))
(assert-claim (forall ((y list2)) (= (zip y nil2) nil)))
(assert-claim (forall ((y list2)) (= (zip nil2 y) nil)))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list2))
    (= (take2 z (take2 y x2)) (take2 y (take2 z x2)))))
(assert-claim
  (forall ((y Nat) (z list2)) (= (take2 y (take2 y z)) (take2 y z))))
(assert-claim
  (forall ((z Nat) (x2 list2) (x3 list2))
    (= (zip x2 (take2 z x3)) (take z (zip x2 x3)))))
(assert-claim
  (forall ((z Nat) (x2 list2) (x3 list2))
    (= (zip (take2 z x2) x3) (take z (zip x2 x3)))))
(assert-claim
  (forall ((y Nat) (z list2))
    (= (take2 y (take2 (S y) z)) (take2 y z))))
(assert-claim
  (forall ((y sk) (z Nat) (x2 list2))
    (= (take2 (S z) (cons2 y x2)) (cons2 y (take2 z x2)))))
(assert-claim
  (forall ((z sk) (x2 sk) (x3 list2) (x4 list2))
    (= (zip (cons2 z x3) (cons2 x2 x4))
      (cons (pair2 z x2) (zip x3 x4)))))
(assert-claim
  (forall ((y Nat) (z list2))
    (= (take2 (S y) (take2 (S Z) z)) (take2 (S Z) z))))
