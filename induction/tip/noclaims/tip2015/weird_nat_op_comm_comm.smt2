(declare-datatype Nat ((zero) (succ (p Nat))))
(define-fun-rec
  op
  ((x Nat) (y Nat) (z Nat) (x2 Nat)) Nat
  (match z
    ((zero
      (match x
        ((zero x2)
         ((succ x3) (op x3 y y x2)))))
     ((succ x4) (op x y x4 (succ x2))))))
(assert-not
  (forall ((a Nat) (b Nat) (c Nat) (d Nat))
    (= (op a b c d) (op b a d c))))
