(declare-sort sk 0)
(declare-datatype list ((nil) (cons (head sk) (tail list))))
(declare-datatype Nat ((Z) (S (proj1-S Nat))))
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
  (forall ((v Nat) (w Nat) (x Nat) (y sk) (z list))
    (= (drop (S v) (drop w (drop x (cons y z))))
      (drop v (drop w (drop x z))))))
(assert-claim (forall ((y Nat)) (= (drop y nil) nil)))
(assert-claim (forall ((y list)) (= (drop Z y) y)))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list))
    (= (drop z (drop y x2)) (drop y (drop z x2)))))
(assert-claim
  (forall ((y sk) (z Nat) (x2 list))
    (= (drop (S z) (cons y x2)) (drop z x2))))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list))
    (= (drop (S y) (drop z x2)) (drop y (drop (S z) x2)))))
(assert-claim
  (forall ((y sk) (z Nat) (x2 list))
    (= (drop z (drop z (cons y x2))) (drop z (cons y (drop z x2))))))
