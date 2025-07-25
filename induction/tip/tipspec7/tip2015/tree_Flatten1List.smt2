(declare-sort sk 0)
(declare-sort fun1 0)
(declare-sort fun12 0)
(declare-sort fun13 0)
(declare-datatype list2 ((nil2) (cons2 (head2 sk) (tail2 list2))))
(declare-datatype
  Tree
  ((Node (proj1-Node Tree) (proj2-Node sk) (proj3-Node Tree)) (Nil)))
(declare-datatype list ((nil) (cons (head Tree) (tail list))))
(declare-const lam fun13)
(declare-const lam2 fun13)
(declare-fun apply1 (fun1 sk) sk)
(declare-fun apply12 (fun12 sk) list2)
(declare-fun apply13 (fun13 Tree) list2)
(define-fun-rec
  flatten1
  ((x list)) list2
  (match x
    ((nil nil2)
     ((cons y ps)
      (match y
        (((Node z x2 q)
          (match z
            (((Node x3 x4 x5)
              (flatten1 (cons (Node x3 x4 x5) (cons (Node Nil x2 q) ps))))
             (Nil (cons2 x2 (flatten1 (cons q ps)))))))
         (Nil (flatten1 ps))))))))
(define-fun-rec
  ++2
  ((x list2) (y list2)) list2
  (match x
    ((nil2 y)
     ((cons2 z xs) (cons2 z (++2 xs y))))))
(define-fun-rec
  concatMap
  ((f fun13) (x list)) list2
  (match x
    ((nil nil2)
     ((cons y xs) (++2 (apply13 f y) (concatMap f xs))))))
(define-fun-rec
  concatMap2
  ((f fun12) (x list2)) list2
  (match x
    ((nil2 nil2)
     ((cons2 y xs) (++2 (apply12 f y) (concatMap2 f xs))))))
(define-fun-rec
  flatten0
  ((x Tree)) list2
  (match x
    (((Node p y q)
      (++2 (flatten0 p) (++2 (cons2 y nil2) (flatten0 q))))
     (Nil nil2))))
(define-fun-rec
  ++
  ((x list) (y list)) list
  (match x
    ((nil y)
     ((cons z xs) (cons z (++ xs y))))))
(assert (forall ((x Tree)) (= (apply13 lam x) (flatten0 x))))
(assert (forall ((z Tree)) (= (apply13 lam2 z) (flatten0 z))))
(assert-not
  (forall ((ps list)) (= (flatten1 ps) (concatMap lam ps))))
(assert-claim (= (flatten1 nil) nil2))
(assert-claim (= (flatten0 Nil) nil2))
(assert-claim (forall ((y list2)) (= (++2 y nil2) y)))
(assert-claim (forall ((y list2)) (= (++2 nil2 y) y)))
(assert-claim (forall ((z fun12)) (= (concatMap2 z nil2) nil2)))
(assert-claim
  (forall ((y list)) (= (concatMap lam2 y) (flatten1 y))))
(assert-claim
  (forall ((y Tree)) (= (flatten1 (cons y nil)) (flatten0 y))))
(assert-claim
  (forall ((y list)) (= (flatten1 (cons Nil y)) (flatten1 y))))
(assert-claim
  (forall ((y list2) (z list2) (x2 list2))
    (= (++2 (++2 y z) x2) (++2 y (++2 z x2)))))
(assert-claim
  (forall ((y sk) (z list2) (x2 list2))
    (= (cons2 y (++2 z x2)) (++2 (cons2 y z) x2))))
(assert-claim
  (forall ((y Tree) (z list))
    (= (++2 (flatten0 y) (flatten1 z)) (flatten1 (cons y z)))))
(assert-claim
  (forall ((y list) (z list))
    (= (++2 (flatten1 y) (flatten1 z)) (flatten1 (++ y z)))))
(assert-claim
  (forall ((y sk) (z Tree))
    (= (flatten0 (Node Nil y z)) (cons2 y (flatten0 z)))))
(assert-claim
  (forall ((y Tree) (z sk))
    (= (++2 (flatten0 y) (cons2 z nil2)) (flatten0 (Node y z Nil)))))
(assert-claim
  (forall ((z fun12) (x2 list2) (x3 list2))
    (= (++2 (concatMap2 z x2) (concatMap2 z x3))
      (concatMap2 z (++2 x2 x3)))))
(assert-claim
  (forall ((y Tree) (z sk) (x2 Tree))
    (= (++2 (flatten0 y) (cons2 z (flatten0 x2)))
      (flatten0 (Node y z x2)))))
