(declare-sort sk 0)
(declare-sort fun1 0)
(declare-datatype list ((nil) (cons (head sk) (tail list))))
(declare-datatype Nat ((Z) (S (proj1-S Nat))))
(declare-fun apply1 (fun1 sk) sk)
(define-fun-rec
  map2
  ((x fun1) (y list)) list
  (match y
    ((nil nil)
     ((cons z xs) (cons (apply1 x z) (map2 x xs))))))
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
  (forall ((n Nat) (f fun1) (xs list))
    (= (drop n (map2 f xs)) (map2 f (drop n xs)))))
(assert-claim (forall ((y Nat)) (= (drop y nil) nil)))
(assert-claim (forall ((y list)) (= (drop Z y) y)))
(assert-claim (forall ((z fun1)) (= (map2 z nil) nil)))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list))
    (= (drop z (drop y x2)) (drop y (drop z x2)))))
(assert-claim
  (forall ((z Nat) (x2 fun1) (x3 list))
    (= (map2 x2 (drop z x3)) (drop z (map2 x2 x3)))))
(assert-claim
  (forall ((z fun1) (x2 sk))
    (= (map2 z (cons x2 nil)) (cons (apply1 z x2) nil))))
(assert-claim
  (forall ((y sk) (z Nat) (x2 list))
    (= (drop (S z) (cons y x2)) (drop z x2))))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list))
    (= (drop (S y) (drop z x2)) (drop y (drop (S z) x2)))))
(assert-claim
  (forall ((z fun1) (x2 sk) (x3 list))
    (= (cons (apply1 z x2) (map2 z x3)) (map2 z (cons x2 x3)))))
(assert-claim
  (forall ((y sk) (z Nat) (x2 list))
    (= (drop z (drop z (cons y x2))) (drop z (cons y (drop z x2))))))
