(declare-sort sk 0)
(declare-datatype list2 ((nil2) (cons2 (head2 sk) (tail2 list2))))
(declare-datatype Nat ((S (proj1-S Nat)) (Z)))
(declare-datatype list ((nil) (cons (head Nat) (tail list))))
(define-fun-rec
  drop2
  ((x Nat) (y list2)) list2
  (match x
    (((S z)
      (match y
        ((nil2 nil2)
         ((cons2 x2 x3) (drop2 z x3)))))
     (Z y))))
(define-fun-rec
  drop
  ((x Nat) (y list)) list
  (match x
    (((S z)
      (match y
        ((nil nil)
         ((cons x2 x3) (drop z x3)))))
     (Z y))))
(assert-not
  (forall ((n Nat) (xs list)) (= (drop n (drop n xs)) (drop n xs))))
(assert-claim (forall ((y Nat)) (= (drop2 y nil2) nil2)))
(assert-claim (forall ((y list2)) (= (drop2 Z y) y)))
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
