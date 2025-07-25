(declare-datatype Nat ((Z) (S (proj1-S Nat))))
(define-fun-rec
  max
  ((x Nat) (y Nat)) Nat
  (match x
    ((Z y)
     ((S z)
      (match y
        ((Z (S z))
         ((S x2) (S (max z x2)))))))))
(assert-not
  (forall ((a Nat) (b Nat) (c Nat))
    (= (max (max a b) c) (max a (max b c)))))
(assert-claim (forall ((x Nat) (y Nat)) (= (max y x) (max x y))))
(assert-claim (forall ((x Nat)) (= (max x x) x)))
(assert-claim (forall ((x Nat)) (= (max x Z) x)))
(assert-claim (forall ((x Nat)) (= (max x (S x)) (S x))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (max (max x y) z) (max x (max y z)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (max (S x) (S y)) (S (max x y)))))
