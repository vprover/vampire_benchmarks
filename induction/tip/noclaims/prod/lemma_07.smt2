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
  (forall ((u Nat) (v Nat) (w Nat) (x sk) (y sk) (z list))
    (= (drop (S u) (drop v (drop (S w) (cons x (cons y z)))))
      (drop (S u) (drop v (drop w (cons x z)))))))
