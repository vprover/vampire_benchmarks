(declare-datatype Nat ((zero) (succ (p Nat))))
(define-fun-rec
  lt
  ((x Nat) (y Nat)) Bool
  (match y
    ((zero false)
     ((succ z)
      (match x
        ((zero true)
         ((succ n) (lt n z))))))))
(assert-not
  (forall ((x Nat) (y Nat)) (=> (lt y x) (distinct x y))))
