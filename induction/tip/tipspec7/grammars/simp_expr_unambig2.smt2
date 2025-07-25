(declare-sort sk 0)
(declare-datatype list2 ((nil2) (cons2 (head2 sk) (tail2 list2))))
(declare-datatype Tok ((C) (D) (X) (Y) (Pl)))
(declare-datatype list ((nil) (cons (head Tok) (tail list))))
(declare-datatype
  E ((Plus (proj1-Plus E) (proj2-Plus E)) (EX) (EY)))
(define-fun-rec
  ++2
  ((x list2) (y list2)) list2
  (match x
    ((nil2 y)
     ((cons2 z xs) (cons2 z (++2 xs y))))))
(define-fun-rec
  ++
  ((x list) (y list)) list
  (match x
    ((nil y)
     ((cons z xs) (cons z (++ xs y))))))
(define-fun-rec
  lin
  ((x E)) list
  (match x
    (((Plus a b)
      (++ (cons C nil)
        (++ (lin a)
          (++ (cons D (cons Pl (cons C nil))) (++ (lin b) (cons D nil))))))
     (EX (cons X nil))
     (EY (cons Y nil)))))
(assert-not
  (forall ((u E) (v E)) (=> (= (lin u) (lin v)) (= u v))))
(assert-claim (= (lin EX) (cons X nil)))
(assert-claim (= (lin EY) (cons Y nil)))
(assert-claim (forall ((y list2)) (= (++2 y nil2) y)))
(assert-claim (forall ((y list2)) (= (++2 nil2 y) y)))
(assert-claim (forall ((x list)) (= (++ (lin EX) x) (cons X x))))
(assert-claim (forall ((x list)) (= (++ (lin EY) x) (cons Y x))))
(assert-claim
  (forall ((y list2) (z list2) (x2 list2))
    (= (++2 (++2 y z) x2) (++2 y (++2 z x2)))))
(assert-claim
  (forall ((y sk) (z list2) (x2 list2))
    (= (cons2 y (++2 z x2)) (++2 (cons2 y z) x2))))
