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
  drop2
  ((x Nat) (y list2)) list2
  (match x
    ((Z y)
     ((S z)
      (match y
        ((nil2 nil2)
         ((cons2 x2 x3) (drop2 z x3))))))))
(define-fun-rec
  drop
  ((x Nat) (y list)) list
  (match x
    ((Z y)
     ((S z)
      (match y
        ((nil nil)
         ((cons x2 x3) (drop z x3))))))))
(assert-not
  (forall ((n Nat) (xs list2) (ys list2))
    (= (drop n (zip xs ys)) (zip (drop2 n xs) (drop2 n ys)))))
(assert-claim (forall ((y Nat)) (= (drop2 y nil2) nil2)))
(assert-claim (forall ((y list2)) (= (drop2 Z y) y)))
(assert-claim (forall ((y list2)) (= (zip y nil2) nil)))
(assert-claim (forall ((y list2)) (= (zip nil2 y) nil)))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list2))
    (= (drop2 z (drop2 y x2)) (drop2 y (drop2 z x2)))))
(assert-claim
  (forall ((y sk) (z Nat) (x2 list2))
    (= (drop2 (S z) (cons2 y x2)) (drop2 z x2))))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list2))
    (= (drop2 (S y) (drop2 z x2)) (drop2 y (drop2 (S z) x2)))))
(assert-claim
  (forall ((y sk) (z Nat) (x2 list2))
    (= (drop2 z (drop2 z (cons2 y x2)))
      (drop2 z (cons2 y (drop2 z x2))))))
(assert-claim
  (forall ((z sk) (x2 sk) (x3 list2) (x4 list2))
    (= (zip (cons2 z x3) (cons2 x2 x4))
      (cons (pair2 z x2) (zip x3 x4)))))
(assert-claim
  (forall ((z Nat) (x2 list2) (x3 list2))
    (= (zip (drop2 z x2) (drop2 z x3)) (drop z (zip x2 x3)))))
(assert-claim
  (forall ((z Nat) (x2 list2) (x3 sk))
    (= (zip x2 (drop2 z (cons2 x3 nil2)))
      (drop z (zip x2 (cons2 x3 nil2))))))
(assert-claim
  (forall ((z Nat) (x2 sk) (x3 list2))
    (= (zip (drop2 z (cons2 x2 nil2)) x3)
      (drop z (zip (cons2 x2 nil2) x3)))))
