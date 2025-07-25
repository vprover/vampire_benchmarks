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
(define-fun
  gt
  ((x Nat) (y Nat)) Bool (lt y x))
(assert-not
  (forall ((x Nat) (y Nat)) (=> (gt x y) (not (gt y x)))))
(assert-claim (forall ((x Nat)) (not (gt x x))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (gt y x) (not (gt x y)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (lt x y) (not (gt x y)))))
(assert-claim (forall ((x Nat) (y Nat)) (=> (lt y x) (gt x y))))
(assert-claim (forall ((x Nat) (y Nat)) (= (gt y x) (lt x y))))
(assert-claim (forall ((x Nat)) (not (gt zero x))))
(assert-claim (forall ((x Nat) (y Nat)) (=> (gt y x) (gt y zero))))
(assert-claim (forall ((x Nat)) (not (gt x (succ x)))))
(assert-claim (forall ((x Nat)) (gt (succ x) x)))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (gt x y) (gt (succ x) y))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (gt y x) (not (gt (succ x) y)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (gt (succ x) (succ y)) (gt x y))))
