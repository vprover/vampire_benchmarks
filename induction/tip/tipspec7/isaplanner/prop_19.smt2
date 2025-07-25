(declare-sort sk 0)
(declare-datatype list ((nil) (cons (head sk) (tail list))))
(declare-datatype Nat ((Z) (S (proj1-S Nat))))
(define-fun-rec
  len
  ((x list)) Nat
  (match x
    ((nil Z)
     ((cons y xs) (S (len xs))))))
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
  |-2|
  ((x Nat) (y Nat)) Nat
  (match x
    ((Z Z)
     ((S z)
      (match y
        ((Z (S z))
         ((S x2) (|-2| z x2))))))))
(assert-not
  (forall ((n Nat) (xs list))
    (= (len (drop n xs)) (|-2| (len xs) n))))
(assert-claim (= (len nil) Z))
(assert-claim (forall ((x Nat)) (= (|-2| x x) Z)))
(assert-claim (forall ((x Nat)) (= (|-2| x Z) x)))
(assert-claim (forall ((x Nat)) (= (|-2| Z x) Z)))
(assert-claim (forall ((y Nat)) (= (drop y nil) nil)))
(assert-claim (forall ((y list)) (= (drop Z y) y)))
(assert-claim (forall ((x Nat)) (= (|-2| x (S x)) Z)))
(assert-claim (forall ((x Nat)) (= (|-2| (S x) x) (S Z))))
(assert-claim (forall ((y list)) (= (drop (len y) y) nil)))
(assert-claim
  (forall ((y sk) (z list)) (= (len (cons y z)) (S (len z)))))
(assert-claim
  (forall ((y Nat) (z list)) (= (|-2| (len z) y) (len (drop y z)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (|-2| y (|-2| y x)) (|-2| x (|-2| x y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (|-2| (|-2| x z) y) (|-2| (|-2| x y) z))))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list))
    (= (drop z (drop y x2)) (drop y (drop z x2)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (|-2| (S x) (S y)) (|-2| x y))))
(assert-claim (forall ((y list)) (= (drop (S (len y)) y) nil)))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (|-2| (S (|-2| x y)) y) (|-2| (|-2| (S x) y) y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (|-2| (S (|-2| x y)) x) (|-2| (S (|-2| y x)) y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (S (|-2| x (|-2| x y))) (|-2| (S x) (|-2| x y)))))
(assert-claim
  (forall ((y sk) (z Nat) (x2 list))
    (= (drop (S z) (cons y x2)) (drop z x2))))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list))
    (= (drop (S y) (drop z x2)) (drop y (drop (S z) x2)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (|-2| (|-2| x y) (|-2| z y)) (|-2| (|-2| x z) (|-2| y z)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (|-2| (|-2| x y) (|-2| y x)) (|-2| x y))))
(assert-claim
  (forall ((y sk) (z Nat) (x2 list))
    (= (drop z (drop z (cons y x2))) (drop z (cons y (drop z x2))))))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list))
    (= (drop y (drop (|-2| z y) x2)) (drop z (drop (|-2| y z) x2)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (|-2| (S (S (|-2| x y))) x) (|-2| (S (S (|-2| y x))) y))))
(assert-claim
  (forall ((x Nat))
    (= (|-2| (S (S (S (S x)))) x) (S (S (S (S Z)))))))
(assert-claim
  (forall ((y list)) (= (drop (|-2| (S Z) (len y)) y) y)))
