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
(define-fun-rec
  ++
  ((x list) (y list)) list
  (match x
    ((nil y)
     ((cons z xs) (cons z (++ xs y))))))
(define-fun-rec
  rev
  ((x list)) list
  (match x
    ((nil nil)
     ((cons y xs) (++ (rev xs) (cons y nil))))))
(assert-not
  (forall ((i Nat) (xs list))
    (= (rev (drop i xs)) (take (|-2| (len xs) i) (rev xs)))))
(assert-claim (= (len nil) Z))
(assert-claim (= (rev nil) nil))
(assert-claim (forall ((x Nat)) (= (|-2| x x) Z)))
(assert-claim (forall ((y list)) (= (++ y nil) y)))
(assert-claim (forall ((y list)) (= (++ nil y) y)))
(assert-claim (forall ((x Nat)) (= (|-2| x Z) x)))
(assert-claim (forall ((x Nat)) (= (|-2| Z x) Z)))
(assert-claim (forall ((y Nat)) (= (drop y nil) nil)))
(assert-claim (forall ((y list)) (= (drop Z y) y)))
(assert-claim (forall ((y list)) (= (len (rev y)) (len y))))
(assert-claim (forall ((y list)) (= (rev (rev y)) y)))
(assert-claim (forall ((y Nat)) (= (take y nil) nil)))
(assert-claim (forall ((y list)) (= (take Z y) nil)))
(assert-claim (forall ((x Nat)) (= (|-2| x (S x)) Z)))
(assert-claim (forall ((x Nat)) (= (|-2| (S x) x) (S Z))))
(assert-claim (forall ((y list)) (= (drop (len y) y) nil)))
(assert-claim
  (forall ((y list) (z list)) (= (len (++ z y)) (len (++ y z)))))
(assert-claim
  (forall ((y sk) (z list)) (= (len (cons y z)) (S (len z)))))
(assert-claim
  (forall ((y Nat) (z list)) (= (|-2| (len z) y) (len (drop y z)))))
(assert-claim (forall ((y list)) (= (take (len y) y) y)))
(assert-claim
  (forall ((y sk)) (= (rev (cons y nil)) (cons y nil))))
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
    (= (drop z (drop y x2)) (drop y (drop z x2)))))
(assert-claim
  (forall ((y Nat) (z list)) (= (drop y (take y z)) nil)))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list))
    (= (take z (take y x2)) (take y (take z x2)))))
(assert-claim
  (forall ((y Nat) (z list)) (= (take y (take y z)) (take y z))))
(assert-claim
  (forall ((y list) (z list))
    (= (++ (rev z) (rev y)) (rev (++ y z)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (|-2| (S x) (S y)) (|-2| x y))))
(assert-claim (forall ((y list)) (= (drop (S (len y)) y) nil)))
(assert-claim
  (forall ((y list) (z list))
    (= (len (++ y (rev z))) (len (++ y z)))))
(assert-claim
  (forall ((y Nat) (z list))
    (= (len (take y (rev z))) (len (take y z)))))
(assert-claim
  (forall ((z list) (x2 list))
    (= (len (take (len x2) z)) (len (take (len z) x2)))))
(assert-claim (forall ((y list)) (= (take (S (len y)) y) y)))
(assert-claim
  (forall ((y list)) (= (rev (take (S Z) y)) (take (S Z) y))))
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
  (forall ((y Nat) (z list)) (= (drop y (rev (take y z))) nil)))
(assert-claim
  (forall ((y Nat) (z list))
    (= (drop (|-2| (len z) y) z) (rev (take y (rev z))))))
(assert-claim
  (forall ((y sk) (z Nat) (x2 list))
    (= (drop (S z) (cons y x2)) (drop z x2))))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list))
    (= (drop (S y) (drop z x2)) (drop y (drop (S z) x2)))))
(assert-claim
  (forall ((y list) (z list))
    (= (drop (len y) (++ y z)) (take (len z) z))))
(assert-claim
  (forall ((y Nat) (z list))
    (= (drop (len (take y z)) z) (drop y z))))
(assert-claim
  (forall ((y Nat) (z list))
    (= (take (|-2| (len z) y) z) (rev (drop y (rev z))))))
(assert-claim
  (forall ((y sk) (z Nat) (x2 list))
    (= (take (S z) (cons y x2)) (cons y (take z x2)))))
(assert-claim
  (forall ((z Nat) (x2 list) (x3 list))
    (= (take (len (take z x2)) x3) (take z (take (len x2) x3)))))
(assert-claim
  (forall ((y list))
    (= (drop (S Z) (++ y y)) (++ (drop (S Z) y) y))))
(assert-claim
  (forall ((y Nat) (z list))
    (= (take (|-2| (S Z) y) z) (drop y (take (S Z) z)))))
(assert-claim
  (forall ((y list)) (= (take (S Z) (++ y y)) (take (S Z) y))))
(assert-claim
  (forall ((y Nat) (z list))
    (= (drop y (take (S y) z)) (take (S Z) (drop y z)))))
(assert-claim
  (forall ((y Nat) (z list)) (= (++ (take y z) (drop y z)) z)))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (|-2| (|-2| x y) (|-2| z y)) (|-2| (|-2| x z) (|-2| y z)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (|-2| (|-2| x y) (|-2| y x)) (|-2| x y))))
(assert-claim
  (forall ((y Nat) (z list))
    (= (drop y (++ z (drop y z))) (++ (drop y z) (drop y z)))))
(assert-claim
  (forall ((y Nat) (z list) (x2 list))
    (= (drop y (++ (take y z) x2)) (drop (|-2| y (len z)) x2))))
(assert-claim
  (forall ((y Nat) (z list))
    (= (drop y (drop y (++ z z))) (drop y (++ (drop y z) z)))))
(assert-claim
  (forall ((y sk) (z Nat) (x2 list))
    (= (drop z (drop z (cons y x2))) (drop z (cons y (drop z x2))))))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list))
    (= (drop y (drop (|-2| z y) x2)) (drop z (drop (|-2| y z) x2)))))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list))
    (= (drop y (take (|-2| y z) x2)) nil)))
(assert-claim
  (forall ((y Nat) (z list))
    (= (take y (++ z (drop y z))) (take y z))))
(assert-claim
  (forall ((y Nat) (z list) (x2 list))
    (= (take y (++ z (take y x2))) (take y (++ z x2)))))
(assert-claim
  (forall ((y Nat) (z list) (x2 list))
    (= (take y (++ (take y z) x2)) (take y (++ z x2)))))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list))
    (= (take (|-2| z y) (drop y x2)) (drop y (take z x2)))))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list))
    (= (take (|-2| y (|-2| y z)) x2) (take y (take z x2)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (|-2| (S (S (|-2| x y))) x) (|-2| (S (S (|-2| y x))) y))))
(assert-claim
  (forall ((y list) (z Nat) (x2 list))
    (= (len (++ y (drop z (rev x2)))) (len (++ y (drop z x2))))))
(assert-claim
  (forall ((y list) (z list))
    (= (len (++ z (drop (len z) y))) (len (++ y (drop (len y) z))))))
(assert-claim
  (forall ((y list) (z list) (x2 list))
    (= (len (++ y (take (len x2) z))) (len (++ y (take (len z) x2))))))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list))
    (= (drop z (rev (drop y (rev x2))))
      (rev (drop y (rev (drop z x2)))))))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 sk))
    (= (take z (drop y (cons x2 nil)))
      (drop y (take z (cons x2 nil))))))
(assert-claim
  (forall ((y list) (z list))
    (= (take (S (len y)) (++ y z)) (++ y (take (S Z) z)))))
(assert-claim
  (forall ((y Nat) (z list))
    (= (take (S (len (take y z))) z) (take (S y) z))))
(assert-claim
  (forall ((y list))
    (= (++ (rev (drop (S Z) y)) y) (++ (rev y) (drop (S Z) y)))))
(assert-claim
  (forall ((x Nat))
    (= (|-2| (S (S (S (S x)))) x) (S (S (S (S Z)))))))
(assert-claim
  (forall ((y list)) (= (drop (|-2| (S Z) (len y)) y) y)))
(assert-claim
  (forall ((y list))
    (= (drop (S Z) (++ y (rev y))) (++ (drop (S Z) y) (rev y)))))
(assert-claim
  (forall ((y Nat) (z list))
    (= (|-2| y (|-2| (S y) (len z))) (len (take y (drop (S Z) z))))))
(assert-claim
  (forall ((y list)) (= (take (S Z) (++ y (rev y))) (take (S Z) y))))
