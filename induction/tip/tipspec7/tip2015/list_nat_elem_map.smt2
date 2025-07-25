(declare-sort sk 0)
(declare-sort fun1 0)
(declare-datatype list ((nil) (cons (head sk) (tail list))))
(declare-fun apply1 (fun1 sk) sk)
(define-fun-rec
  map2
  ((f fun1) (x list)) list
  (match x
    ((nil nil)
     ((cons y xs) (cons (apply1 f y) (map2 f xs))))))
(define-fun-rec
  elem
  ((x sk) (y list)) Bool
  (match y
    ((nil false)
     ((cons z xs) (or (= z x) (elem x xs))))))
(assert-not
  (forall ((y sk) (f fun1) (xs list))
    (=> (elem y (map2 f xs))
      (exists ((x sk)) (and (= (apply1 f x) y) (elem y xs))))))
(assert-claim (forall ((y sk)) (not (elem y nil))))
(assert-claim (forall ((z fun1)) (= (map2 z nil) nil)))
(assert-claim (forall ((y sk) (z list)) (elem y (cons y z))))
(assert-claim
  (forall ((y sk) (z sk) (x2 list))
    (=> (elem y x2) (= (elem z (cons y x2)) (elem z x2)))))
(assert-claim
  (forall ((y sk) (z sk) (x2 list))
    (=> (elem y x2) (elem y (cons z x2)))))
(assert-claim
  (forall ((y sk) (z sk))
    (= (elem z (cons y nil)) (elem y (cons z nil)))))
(assert-claim
  (forall ((z fun1) (x2 sk))
    (= (map2 z (cons x2 nil)) (cons (apply1 z x2) nil))))
(assert-claim
  (forall ((z fun1) (x2 sk) (x3 list))
    (= (cons (apply1 z x2) (map2 z x3)) (map2 z (cons x2 x3)))))
(assert-claim
  (forall ((y sk) (z sk) (x2 sk) (x3 list))
    (= (elem y (cons x2 (cons z x3))) (elem y (cons z (cons x2 x3))))))
