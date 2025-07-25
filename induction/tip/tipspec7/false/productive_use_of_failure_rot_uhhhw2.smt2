(declare-sort sk 0)
(declare-datatype list2 ((nil2) (cons2 (head2 sk) (tail2 list2))))
(declare-datatype Nat ((S (proj1-S Nat)) (Z)))
(declare-datatype list ((nil) (cons (head Nat) (tail list))))
(define-fun-rec
  length2
  ((x list2)) Nat
  (match x
    ((nil2 Z)
     ((cons2 y xs) (S (length2 xs))))))
(define-fun-rec
  length
  ((x list)) Nat
  (match x
    ((nil Z)
     ((cons y xs) (S (length xs))))))
(assert-not
  (forall ((xs list) (ys list))
    (=> (= (length xs) (length ys)) (= xs ys))))
(assert-claim (= (length2 nil2) Z))
(assert-claim
  (forall ((y sk) (z list2))
    (= (length2 (cons2 y z)) (S (length2 z)))))
