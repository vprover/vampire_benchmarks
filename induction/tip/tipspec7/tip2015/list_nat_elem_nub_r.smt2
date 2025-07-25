(declare-sort sk 0)
(declare-sort fun1 0)
(declare-sort fun12 0)
(declare-sort fun13 0)
(declare-datatype list ((nil) (cons (head sk) (tail list))))
(declare-fun lam (fun12 sk) fun13)
(declare-fun lam2 (sk) fun13)
(declare-const lam3 fun12)
(declare-fun apply1 (fun1 sk) sk)
(declare-fun apply12 (fun12 sk) fun13)
(declare-fun apply13 (fun13 sk) Bool)
(define-fun-rec
  filter
  ((p fun13) (x list)) list
  (match x
    ((nil nil)
     ((cons y xs)
      (ite (apply13 p y) (cons y (filter p xs)) (filter p xs))))))
(define-fun-rec
  nubBy
  ((x fun12) (y list)) list
  (match y
    ((nil nil)
     ((cons z xs) (cons z (nubBy x (filter (lam x z) xs)))))))
(define-fun-rec
  elem
  ((x sk) (y list)) Bool
  (match y
    ((nil false)
     ((cons z xs) (or (= z x) (elem x xs))))))
(assert
  (forall ((x fun12) (z sk) (y2 sk))
    (= (apply13 (lam x z) y2) (not (apply13 (apply12 x z) y2)))))
(assert (forall ((y sk)) (= (apply12 lam3 y) (lam2 y))))
(assert (forall ((y sk) (z sk)) (= (apply13 (lam2 y) z) (= y z))))
(assert-not
  (forall ((x sk) (xs list))
    (=> (elem x (nubBy lam3 xs)) (elem x xs))))
(assert-claim (forall ((y sk)) (not (elem y nil))))
(assert-claim (forall ((y fun13)) (= (filter y nil) nil)))
(assert-claim (forall ((y fun12)) (= (nubBy y nil) nil)))
(assert-claim (forall ((y sk) (z list)) (elem y (cons y z))))
(assert-claim
  (forall ((y sk) (z sk) (x2 list))
    (=> (elem y x2) (= (elem z (cons y x2)) (elem z x2)))))
(assert-claim
  (forall ((y sk) (z sk) (x2 list))
    (=> (elem y x2) (elem y (cons z x2)))))
(assert-claim
  (forall ((y list) (z fun13) (x2 sk))
    (=> (elem x2 y) (= (elem x2 (filter z y)) (apply13 z x2)))))
(assert-claim
  (forall ((y fun13) (z fun13) (x2 list))
    (= (filter z (filter y x2)) (filter y (filter z x2)))))
(assert-claim
  (forall ((y fun13) (z list))
    (= (filter y (filter y z)) (filter y z))))
(assert-claim
  (forall ((y fun12) (z list))
    (= (nubBy y (nubBy y z)) (nubBy y z))))
(assert-claim
  (forall ((y sk) (z sk))
    (= (elem z (cons y nil)) (elem y (cons z nil)))))
(assert-claim
  (forall ((y fun12) (z sk))
    (= (nubBy y (cons z nil)) (cons z nil))))
(assert-claim
  (forall ((y sk) (z sk) (x2 sk) (x3 list))
    (= (elem y (cons x2 (cons z x3))) (elem y (cons z (cons x2 x3))))))
(assert-claim
  (forall ((y fun12) (z sk) (x2 list))
    (elem z (nubBy y (cons z x2)))))
(assert-claim
  (forall ((y fun13) (z sk) (x2 list))
    (= (filter y (cons z (filter y x2))) (filter y (cons z x2)))))
(assert-claim
  (forall ((y fun12) (z fun13) (x2 list))
    (= (filter z (nubBy y (filter z x2))) (nubBy y (filter z x2)))))
(assert-claim
  (forall ((y fun13) (z fun12) (x2 list))
    (= (nubBy z (filter y (nubBy z x2))) (filter y (nubBy z x2)))))
(assert-claim
  (forall ((y fun12) (z fun12) (x2 list))
    (= (nubBy z (nubBy y (nubBy z x2))) (nubBy y (nubBy z x2)))))
(assert-claim
  (forall ((y sk) (z fun13) (x2 sk))
    (= (elem x2 (filter z (cons y nil)))
      (elem y (filter z (cons x2 nil))))))
