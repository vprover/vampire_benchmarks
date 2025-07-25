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
  butlast
  ((x list)) list
  (match x
    ((nil nil)
     ((cons y z)
      (match z
        ((nil nil)
         ((cons x2 x3) (cons y (butlast (cons x2 x3))))))))))
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
  (forall ((xs list))
    (= (butlast xs) (take (|-2| (len xs) (S Z)) xs))))
(assert-claim (= (len nil) Z))
(assert-claim (= (butlast nil) nil))
(assert-claim (forall ((x Nat)) (= (|-2| x x) Z)))
(assert-claim (forall ((x Nat)) (= (|-2| x Z) x)))
(assert-claim (forall ((x Nat)) (= (|-2| Z x) Z)))
(assert-claim (forall ((y Nat)) (= (take y nil) nil)))
(assert-claim (forall ((y list)) (= (take Z y) nil)))
(assert-claim (forall ((x Nat)) (= (|-2| x (S x)) Z)))
(assert-claim (forall ((x Nat)) (= (|-2| (S x) x) (S Z))))
(assert-claim
  (forall ((y sk) (z list)) (= (len (cons y z)) (S (len z)))))
(assert-claim (forall ((y list)) (= (take (len y) y) y)))
(assert-claim (forall ((y sk)) (= (butlast (cons y nil)) nil)))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (|-2| y (|-2| y x)) (|-2| x (|-2| x y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (|-2| (|-2| x z) y) (|-2| (|-2| x y) z))))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list))
    (= (take z (take y x2)) (take y (take z x2)))))
(assert-claim
  (forall ((y Nat) (z list)) (= (take y (take y z)) (take y z))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (|-2| (S x) (S y)) (|-2| x y))))
(assert-claim
  (forall ((y list) (z Nat))
    (= (|-2| (len (butlast y)) z) (|-2| (len y) (S z)))))
(assert-claim
  (forall ((y sk) (z list))
    (= (butlast (butlast (cons y z))) (butlast (cons y (butlast z))))))
(assert-claim
  (forall ((y Nat) (z list))
    (= (butlast (take (S y) z)) (take y (butlast z)))))
(assert-claim
  (forall ((z list) (x2 list))
    (= (len (take (len x2) z)) (len (take (len z) x2)))))
(assert-claim (forall ((y list)) (= (take (S (len y)) y) y)))
(assert-claim
  (forall ((y list)) (= (take (len (butlast y)) y) (butlast y))))
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
  (forall ((y sk) (z sk) (x2 list))
    (= (butlast (cons y (cons z x2))) (cons y (butlast (cons z x2))))))
(assert-claim
  (forall ((y sk) (z Nat) (x2 list))
    (= (take z (butlast (cons y x2))) (butlast (cons y (take z x2))))))
(assert-claim
  (forall ((y Nat) (z list)) (= (take y (take (S y) z)) (take y z))))
(assert-claim
  (forall ((y sk) (z Nat) (x2 list))
    (= (take (S z) (cons y x2)) (cons y (take z x2)))))
(assert-claim
  (forall ((z Nat) (x2 list) (x3 list))
    (= (take (len (take z x2)) x3) (take z (take (len x2) x3)))))
(assert-claim
  (forall ((y list)) (= (take (S (len (butlast y))) y) y)))
(assert-claim
  (forall ((z list) (x2 list))
    (= (take (len (butlast z)) (butlast x2))
      (butlast (take (len z) x2)))))
(assert-claim
  (forall ((y list))
    (= (take (len (butlast (butlast y))) y) (butlast (butlast y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (|-2| (|-2| x y) (|-2| z y)) (|-2| (|-2| x z) (|-2| y z)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (|-2| (|-2| x y) (|-2| y x)) (|-2| x y))))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list))
    (= (take y (take (|-2| y z) x2)) (take (|-2| y z) x2))))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list))
    (= (take (|-2| y (|-2| y z)) x2) (take y (take z x2)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (|-2| (S (S (|-2| x y))) x) (|-2| (S (S (|-2| y x))) y))))
(assert-claim
  (forall ((y sk) (z Nat) (x2 list))
    (= (butlast (take z (cons y (butlast x2))))
      (butlast (cons y (butlast (take z x2)))))))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list))
    (= (butlast (take (|-2| (S y) z) x2))
      (take (|-2| y z) (butlast x2)))))
(assert-claim
  (forall ((y Nat) (z list))
    (= (take (|-2| (S y) (len z)) z)
      (take (|-2| y (len (butlast z))) z))))
(assert-claim
  (forall ((y Nat) (z list))
    (= (take (|-2| (len z) (S y)) z)
      (butlast (take (|-2| (len z) y) z)))))
(assert-claim
  (forall ((y Nat) (z list))
    (= (take (S (len (take y z))) z) (take (S y) z))))
(assert-claim
  (forall ((y sk) (z list))
    (= (take (len z) (cons y (butlast z))) (butlast (cons y z)))))
(assert-claim
  (forall ((x Nat))
    (= (|-2| (S (S (S (S x)))) x) (S (S (S (S Z)))))))
(assert-claim
  (forall ((y list) (z sk))
    (= (butlast (cons z (take (S Z) y))) (take (len y) (cons z nil)))))
(assert-claim
  (forall ((y Nat) (z sk) (x2 list))
    (= (len (take (|-2| y (S Z)) x2))
      (len (butlast (take y (cons z x2)))))))
(assert-claim
  (forall ((y list) (z Nat))
    (= (len (take (|-2| (S Z) z) y)) (|-2| (len (take (S Z) y)) z))))
