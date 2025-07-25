(declare-sort sk 0)
(declare-datatype list2 ((nil2) (cons2 (head2 sk) (tail2 list2))))
(declare-datatype list ((nil) (cons (head list2) (tail list))))
(define-fun-rec
  ++2
  ((x list2) (y list2)) list2
  (match x
    ((nil2 y)
     ((cons2 z xs) (cons2 z (++2 xs y))))))
(define-fun-rec
  rev
  ((x list2)) list2
  (match x
    ((nil2 nil2)
     ((cons2 y xs) (++2 (rev xs) (cons2 y nil2))))))
(define-fun-rec
  qrevflat
  ((x list) (y list2)) list2
  (match x
    ((nil y)
     ((cons xs xss) (qrevflat xss (++2 (rev xs) y))))))
(define-fun-rec
  revflat
  ((x list)) list2
  (match x
    ((nil nil2)
     ((cons xs xss) (++2 (revflat xss) (rev xs))))))
(define-fun-rec
  ++
  ((x list) (y list)) list
  (match x
    ((nil y)
     ((cons z xs) (cons z (++ xs y))))))
(assert-not (forall ((x list)) (= (revflat x) (qrevflat x nil2))))
(assert-claim (= (rev nil2) nil2))
(assert-claim (= (revflat nil) nil2))
(assert-claim (forall ((y list2)) (= (++2 y nil2) y)))
(assert-claim (forall ((y list2)) (= (++2 nil2 y) y)))
(assert-claim
  (forall ((y list)) (= (qrevflat y nil2) (revflat y))))
(assert-claim (forall ((y list2)) (= (qrevflat nil y) y)))
(assert-claim (forall ((y list2)) (= (rev (rev y)) y)))
(assert-claim
  (forall ((y list) (z list2))
    (= (++2 (revflat y) z) (qrevflat y z))))
(assert-claim
  (forall ((y list) (z list))
    (= (revflat (++ z y)) (qrevflat y (revflat z)))))
(assert-claim
  (forall ((y list) (z list2))
    (= (revflat (cons z y)) (qrevflat y (rev z)))))
(assert-claim
  (forall ((y sk)) (= (rev (cons2 y nil2)) (cons2 y nil2))))
(assert-claim
  (forall ((y list2) (z list2) (x2 list2))
    (= (++2 (++2 y z) x2) (++2 y (++2 z x2)))))
(assert-claim
  (forall ((y sk) (z list2) (x2 list2))
    (= (cons2 y (++2 z x2)) (++2 (cons2 y z) x2))))
(assert-claim
  (forall ((y list2) (z list2))
    (= (++2 (rev z) (rev y)) (rev (++2 y z)))))
