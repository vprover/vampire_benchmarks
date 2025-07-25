(declare-sort sk 0)
(declare-datatype list ((nil) (cons (head sk) (tail list))))
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
  ++
  ((x list) (y list)) list
  (match x
    ((nil y)
     ((cons z xs) (cons z (++ xs y))))))
(assert-not
  (forall ((xs list) (x sk)) (= (butlast (++ xs (cons x nil))) xs)))
(assert-claim (= (butlast nil) nil))
(assert-claim (forall ((y list)) (= (++ y nil) y)))
(assert-claim (forall ((y list)) (= (++ nil y) y)))
(assert-claim
  (forall ((y list)) (= (butlast (++ y y)) (++ y (butlast y)))))
(assert-claim (forall ((y sk)) (= (butlast (cons y nil)) nil)))
(assert-claim
  (forall ((y list) (z list) (x2 list))
    (= (++ (++ y z) x2) (++ y (++ z x2)))))
(assert-claim
  (forall ((y sk) (z list) (x2 list))
    (= (cons y (++ z x2)) (++ (cons y z) x2))))
(assert-claim
  (forall ((y list))
    (= (butlast (++ (butlast y) y)) (++ (butlast y) (butlast y)))))
(assert-claim
  (forall ((y sk) (z list))
    (= (butlast (butlast (cons y z))) (butlast (cons y (butlast z))))))
(assert-claim
  (forall ((y list) (z list))
    (= (butlast (++ y (++ y z))) (++ y (butlast (++ y z))))))
(assert-claim
  (forall ((y list) (z list))
    (= (butlast (++ z (++ y z))) (++ z (butlast (++ y z))))))
(assert-claim
  (forall ((y list) (z sk) (x2 list))
    (= (butlast (++ y (cons z x2))) (++ y (butlast (cons z x2))))))
(assert-claim
  (forall ((y list))
    (= (butlast (++ (butlast (butlast y)) y))
      (++ (butlast (butlast y)) (butlast y)))))
(assert-claim
  (forall ((y list))
    (= (butlast (butlast (++ y (butlast y))))
      (butlast (++ y (butlast (butlast y)))))))
(assert-claim
  (forall ((y list) (z list))
    (= (butlast (++ y (++ (butlast z) z)))
      (++ (butlast (++ y z)) (butlast z)))))
(assert-claim
  (forall ((y sk) (z list))
    (= (butlast (++ z (butlast (cons y z))))
      (++ z (butlast (cons y (butlast z)))))))
(assert-claim
  (forall ((y list) (z list))
    (= (butlast (++ (++ (butlast y) y) z))
      (++ (butlast y) (butlast (++ y z))))))
(assert-claim
  (forall ((y list) (z list))
    (= (butlast (++ (++ (butlast z) y) z))
      (++ (butlast z) (butlast (++ y z))))))
(assert-claim
  (forall ((y sk) (z list))
    (= (butlast (++ (butlast (cons y z)) z))
      (++ (butlast (cons y z)) (butlast z)))))
(assert-claim
  (forall ((y list))
    (= (butlast (++ (butlast (butlast (butlast y))) y))
      (++ (butlast (butlast (butlast y))) (butlast y)))))
