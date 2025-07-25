(declare-datatype Nat ((Z) (S (proj1-S Nat))))
(define-fun-rec
  +2
  ((x Nat) (y Nat)) Nat
  (match x
    ((Z y)
     ((S z) (S (+2 z y))))))
(assert-not
  (forall ((x Nat) (y Nat)) (= (+2 x (S (S y))) (S (S (+2 x y))))))
