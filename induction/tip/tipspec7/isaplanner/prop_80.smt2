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
  len
  ((x list)) Nat
  (match x
    ((nil Z)
     ((cons y xs) (S (len xs))))))
(define-fun-rec
  |-2|
  ((x Nat) (y Nat)) Nat
  (match x
    ((Z Z)
     ((S z)
      (match y
        ((Z (S z))
         ((S x2) (|-2| z x2))))))))
(define-fun-rec
  ++
  ((x list) (y list)) list
  (match x
    ((nil y)
     ((cons z xs) (cons z (++ xs y))))))
(assert-not
  (forall ((n Nat) (xs list) (ys list))
    (= (take n (++ xs ys))
      (++ (take n xs) (take (|-2| n (len xs)) ys)))))
(assert-claim (= (len nil) Z))
(assert-claim (forall ((x Nat)) (= (|-2| x x) Z)))
(assert-claim (forall ((y list)) (= (++ y nil) y)))
(assert-claim (forall ((y list)) (= (++ nil y) y)))
(assert-claim (forall ((x Nat)) (= (|-2| x Z) x)))
(assert-claim (forall ((x Nat)) (= (|-2| Z x) Z)))
(assert-claim (forall ((y Nat)) (= (take y nil) nil)))
(assert-claim (forall ((y list)) (= (take Z y) nil)))
(assert-claim (forall ((x Nat)) (= (|-2| x (S x)) Z)))
(assert-claim (forall ((x Nat)) (= (|-2| (S x) x) (S Z))))
(assert-claim
  (forall ((y list) (z list)) (= (len (++ z y)) (len (++ y z)))))
(assert-claim
  (forall ((y sk) (z list)) (= (len (cons y z)) (S (len z)))))
(assert-claim (forall ((y list)) (= (take (len y) y) y)))
(assert-claim
  (forall ((y list) (z list) (x2 list))
    (= (++ (++ y z) x2) (++ y (++ z x2)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (|-2| y (|-2| y x)) (|-2| x (|-2| x y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (|-2| (|-2| x z) y) (|-2| (|-2| x y) z))))
(assert-claim
  (forall ((y sk) (z list) (x2 list))
    (= (cons y (++ z x2)) (++ (cons y z) x2))))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list))
    (= (take z (take y x2)) (take y (take z x2)))))
(assert-claim
  (forall ((y Nat) (z list)) (= (take y (take y z)) (take y z))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (|-2| (S x) (S y)) (|-2| x y))))
(assert-claim
  (forall ((z list) (x2 list))
    (= (len (take (len x2) z)) (len (take (len z) x2)))))
(assert-claim (forall ((y list)) (= (take (S (len y)) y) y)))
(assert-claim
  (forall ((y Nat) (z list))
    (= (|-2| y (|-2| y (len z))) (len (take y z)))))
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
  (forall ((y Nat) (z list)) (= (take y (take (S y) z)) (take y z))))
(assert-claim
  (forall ((y sk) (z Nat) (x2 list))
    (= (take (S z) (cons y x2)) (cons y (take z x2)))))
(assert-claim
  (forall ((y list) (z list)) (= (take (len z) (++ z y)) z)))
(assert-claim
  (forall ((z Nat) (x2 list) (x3 list))
    (= (take (len (take z x2)) x3) (take z (take (len x2) x3)))))
(assert-claim
  (forall ((y list)) (= (take (S Z) (++ y y)) (take (S Z) y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (|-2| (|-2| x y) (|-2| z y)) (|-2| (|-2| x z) (|-2| y z)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (|-2| (|-2| x y) (|-2| y x)) (|-2| x y))))
(assert-claim
  (forall ((y Nat) (z list) (x2 list))
    (= (take y (++ z (take y x2))) (take y (++ z x2)))))
(assert-claim
  (forall ((y Nat) (z list) (x2 list))
    (= (take y (++ (take y z) x2)) (take y (++ z x2)))))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list))
    (= (take y (take (|-2| y z) x2)) (take (|-2| y z) x2))))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list))
    (= (take (|-2| y (|-2| y z)) x2) (take y (take z x2)))))
(assert-claim
  (forall ((y Nat) (z list) (x2 list))
    (= (|-2| (|-2| y (len z)) (len x2)) (|-2| y (len (++ z x2))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (|-2| (S (S (|-2| x y))) x) (|-2| (S (S (|-2| y x))) y))))
(assert-claim
  (forall ((y list) (z list))
    (= (|-2| (len (++ y z)) (len y)) (len (take (len z) z)))))
(assert-claim
  (forall ((y list) (z list) (x2 list))
    (= (len (++ y (take (len x2) z))) (len (++ y (take (len z) x2))))))
(assert-claim
  (forall ((y list) (z list))
    (= (take (S (len y)) (++ y z)) (++ y (take (S Z) z)))))
(assert-claim
  (forall ((y Nat) (z list))
    (= (take (S (len (take y z))) z) (take (S y) z))))
(assert-claim
  (forall ((x Nat))
    (= (|-2| (S (S (S (S x)))) x) (S (S (S (S Z)))))))
(assert-claim
  (forall ((y list) (z Nat))
    (= (len (take (|-2| (S Z) z) y)) (|-2| (len (take (S Z) y)) z))))
(assert-claim
  (forall ((y list)) (= (take (|-2| (S Z) (len y)) y) nil)))
