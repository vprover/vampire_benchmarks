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
(define-fun
  butlastConcat
  ((x list) (y list)) list
  (match y
    ((nil (butlast x))
     ((cons z x2) (++ x (butlast (cons z x2)))))))
(assert-not
  (forall ((xs list) (ys list))
    (= (butlast (++ xs ys)) (butlastConcat xs ys))))
(assert-claim (= (butlast nil) nil))
(assert-claim (forall ((y list)) (= (++ y nil) y)))
(assert-claim (forall ((y list)) (= (++ nil y) y)))
(assert-claim (forall ((y list)) (= (butlast y) (butlast y))))
(assert-claim
  (forall ((y list)) (= (butlastConcat nil y) (butlast y))))
(assert-claim
  (forall ((y list)) (= (++ y (butlast y)) (butlastConcat y y))))
(assert-claim
  (forall ((y list) (z list))
    (= (butlast (++ y z)) (butlastConcat y z))))
(assert-claim (forall ((y sk)) (= (butlast (cons y nil)) nil)))
(assert-claim
  (forall ((y list) (z list) (x2 list))
    (= (++ (++ y z) x2) (++ y (++ z x2)))))
(assert-claim
  (forall ((y sk) (z list) (x2 list))
    (= (cons y (++ z x2)) (++ (cons y z) x2))))
(assert-claim
  (forall ((y list) (z list))
    (= (butlastConcat y (++ y z)) (++ y (butlastConcat y z)))))
(assert-claim
  (forall ((y list) (z list))
    (= (butlastConcat z (++ y z)) (++ z (butlastConcat y z)))))
(assert-claim
  (forall ((y list))
    (= (++ (butlast y) (butlast y)) (butlastConcat (butlast y) y))))
(assert-claim
  (forall ((y sk) (z list))
    (= (butlast (butlast (cons y z))) (butlast (cons y (butlast z))))))
(assert-claim
  (forall ((y sk) (z list)) (= (++ z (butlast (cons y nil))) z)))
(assert-claim
  (forall ((y list))
    (= (butlastConcat y (butlast (butlast y)))
      (butlast (butlast (butlastConcat y y))))))
(assert-claim
  (forall ((y list) (z sk) (x2 list))
    (= (++ y (butlast (cons z x2))) (++ y (butlast (cons z x2))))))
(assert-claim
  (forall ((y list) (z list))
    (= (butlastConcat y (++ (butlast z) z))
      (++ (butlastConcat y z) (butlast z)))))
(assert-claim
  (forall ((y sk) (z list))
    (= (++ z (butlast (cons y (butlast z))))
      (butlast (++ z (butlast (cons y z)))))))
(assert-claim
  (forall ((y list) (z list))
    (= (butlastConcat y (butlast (butlastConcat y z)))
      (butlast (butlastConcat y (butlastConcat y z))))))
(assert-claim
  (forall ((y list) (z list))
    (= (butlastConcat z (butlast (butlastConcat y z)))
      (butlast (butlastConcat z (butlastConcat y z))))))
(assert-claim
  (forall ((y list) (z list))
    (= (butlastConcat y (butlastConcat (butlast y) z))
      (butlast (butlastConcat (butlastConcat y y) z)))))
(assert-claim
  (forall ((y list) (z list))
    (= (butlastConcat (++ (butlast y) y) z)
      (++ (butlast y) (butlastConcat y z)))))
(assert-claim
  (forall ((y list) (z list))
    (= (butlastConcat (++ (butlast z) y) z)
      (++ (butlast z) (butlastConcat y z)))))
(assert-claim
  (forall ((y sk) (z list))
    (= (butlastConcat (butlast (cons y z)) z)
      (butlastConcat (cons y (butlast z)) z))))
(assert-claim
  (forall ((y list))
    (= (++ (butlast (butlast y)) (butlast y))
      (butlastConcat (butlast (butlast y)) y))))
(assert-claim
  (forall ((y list) (z list) (x2 list))
    (= (butlastConcat z (++ y (++ z x2)))
      (++ z (butlastConcat y (++ z x2))))))
(assert-claim
  (forall ((y sk) (z list) (x2 list))
    (= (butlastConcat z (butlastConcat (cons y z) x2))
      (++ z (butlast (cons y (butlastConcat z x2)))))))
(assert-claim
  (forall ((y list) (z list))
    (= (butlastConcat (++ (butlastConcat z z) y) z)
      (++ (butlastConcat z z) (butlastConcat y z)))))
(assert-claim
  (forall ((y list) (z list))
    (= (butlastConcat (++ (butlastConcat z y) y) z)
      (++ (butlastConcat z y) (butlastConcat y z)))))
(assert-claim
  (forall ((y sk) (z list) (x2 list))
    (= (butlastConcat (butlastConcat (cons y x2) z) x2)
      (butlastConcat (cons y (butlastConcat x2 z)) x2))))
(assert-claim
  (forall ((y sk) (z list) (x2 list))
    (= (butlastConcat (butlastConcat (cons y z) x2) x2)
      (butlastConcat (cons y (butlastConcat z x2)) x2))))
(assert-claim
  (forall ((y list) (z list))
    (= (++ (butlast y) (butlast (butlastConcat y z)))
      (butlastConcat (butlast y) (butlastConcat y z)))))
(assert-claim
  (forall ((y list) (z list))
    (= (++ (butlast z) (butlast (butlastConcat y z)))
      (butlastConcat (butlast z) (butlastConcat y z)))))
(assert-claim
  (forall ((y list) (z list))
    (= (++ (butlast (butlastConcat y z)) (butlast z))
      (butlastConcat (butlastConcat y (butlast z)) z))))
(assert-claim
  (forall ((y list) (z list))
    (= (butlast (butlastConcat z (++ y (butlast z))))
      (butlastConcat z (butlastConcat y (butlast z))))))
(assert-claim
  (forall ((y list))
    (= (butlastConcat y (butlastConcat (butlast (butlast y)) y))
      (butlast (butlastConcat (butlast (butlastConcat y y)) y)))))
(assert-claim
  (forall ((y list) (z list))
    (= (butlastConcat (++ (butlast (butlast y)) y) z)
      (++ (butlast (butlast y)) (butlastConcat y z)))))
(assert-claim
  (forall ((y list) (z list))
    (= (butlastConcat (++ (butlast (butlast z)) y) z)
      (++ (butlast (butlast z)) (butlastConcat y z)))))
(assert-claim
  (forall ((y list))
    (= (++ (butlast (butlast (butlast y))) (butlast y))
      (butlastConcat (butlast (butlast (butlast y))) y))))
(assert-claim
  (forall ((y list))
    (= (butlast (butlastConcat y (butlast (butlast (butlast y)))))
      (butlast (butlast (butlast (butlast (butlastConcat y y))))))))
