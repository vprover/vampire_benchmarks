(declare-sort sk 0)
(declare-datatype list ((nil) (cons (head sk) (tail list))))
(declare-datatype Nat ((Z) (S (proj1-S Nat))))
(define-fun-rec
  take
  ((x Nat) (y list)) list
  (match x
    ((Z nil)
     ((S z)
      (match y
        ((nil nil)
         ((cons x2 x3) (cons x2 (take z x3)))))))))
(define-fun-rec
  drop
  ((x Nat) (y list)) list
  (match x
    ((Z y)
     ((S z)
      (match y
        ((nil nil)
         ((cons x2 x3) (drop z x3))))))))
(define-fun-rec
  +2
  ((x Nat) (y Nat)) Nat
  (match x
    ((Z y)
     ((S z) (S (+2 z y))))))
(assert-not
  (forall ((n Nat) (m Nat) (xs list))
    (= (take n (drop m xs)) (drop m (take (+2 n m) xs)))))
(assert-claim (forall ((x Nat) (y Nat)) (= (+2 y x) (+2 x y))))
(assert-claim (forall ((x Nat)) (= (+2 x Z) x)))
(assert-claim (forall ((y Nat)) (= (drop y nil) nil)))
(assert-claim (forall ((y list)) (= (drop Z y) y)))
(assert-claim (forall ((y Nat)) (= (take y nil) nil)))
(assert-claim (forall ((y list)) (= (take Z y) nil)))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (+2 y (S x)) (+2 x (S y)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (S (+2 x y)) (+2 x (S y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (+2 (+2 x y) z) (+2 x (+2 y z)))))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list))
    (= (drop z (drop y x2)) (drop y (drop z x2)))))
(assert-claim
  (forall ((y Nat) (z list)) (= (drop y (take y z)) nil)))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list))
    (= (drop (+2 y z) x2) (drop y (drop z x2)))))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list))
    (= (take z (take y x2)) (take y (take z x2)))))
(assert-claim
  (forall ((y Nat) (z list)) (= (take y (take y z)) (take y z))))
(assert-claim
  (forall ((y sk) (z Nat) (x2 list))
    (= (drop (S z) (cons y x2)) (drop z x2))))
(assert-claim
  (forall ((y Nat) (z list)) (= (take y (take (S y) z)) (take y z))))
(assert-claim
  (forall ((y sk) (z Nat) (x2 list))
    (= (take (S z) (cons y x2)) (cons y (take z x2)))))
(assert-claim
  (forall ((y Nat) (z list))
    (= (drop y (take (S y) z)) (take (S Z) (drop y z)))))
(assert-claim
  (forall ((y sk) (z Nat) (x2 list))
    (= (drop z (drop z (cons y x2))) (drop z (cons y (drop z x2))))))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list))
    (= (drop z (take (+2 z y) x2)) (take y (drop z x2)))))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list))
    (= (take z (drop y (take z x2))) (drop y (take z x2)))))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list))
    (= (take z (take (+2 z y) x2)) (take z x2))))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 sk))
    (= (take z (drop y (cons x2 nil)))
      (drop y (take z (cons x2 nil))))))
(assert-claim
  (forall ((y Nat) (z sk))
    (= (take (+2 y y) (cons z nil)) (take y (cons z nil)))))
