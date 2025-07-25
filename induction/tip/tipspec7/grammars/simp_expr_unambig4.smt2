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
(define-funs-rec
  ((linTerm
    ((x E)) list)
   (lin
    ((x E)) list))
  ((match x
     (((Plus y z) (++ (cons C nil) (++ (lin (Plus y z)) (cons D nil))))
      (EX (cons X nil))
      (EY (cons Y nil))))
   (match x
     (((Plus a b) (++ (linTerm a) (++ (cons Pl nil) (linTerm b))))
      (EX (cons X nil))
      (EY (cons Y nil))))))
(assert-not
  (forall ((u E) (v E)) (=> (= (lin u) (lin v)) (= u v))))
(assert-claim (= (lin EX) (cons X nil)))
(assert-claim (= (lin EX) (linTerm EX)))
(assert-claim (= (lin EY) (cons Y nil)))
(assert-claim (= (lin EY) (linTerm EY)))
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
(assert-claim
  (forall ((x E))
    (= (lin (Plus EX x)) (cons X (cons Pl (linTerm x))))))
(assert-claim
  (forall ((x E))
    (= (lin (Plus EY x)) (cons Y (cons Pl (linTerm x))))))
(assert-claim
  (forall ((x E) (y E))
    (= (lin (Plus x y)) (++ (linTerm x) (cons Pl (linTerm y))))))
(assert-claim
  (forall ((x list))
    (= (cons X (cons Pl (cons X x))) (++ (lin (Plus EX EX)) x))))
(assert-claim
  (forall ((x list))
    (= (cons X (cons Pl (cons Y x))) (++ (lin (Plus EX EY)) x))))
(assert-claim
  (forall ((x list))
    (= (cons Y (cons Pl (cons X x))) (++ (lin (Plus EY EX)) x))))
(assert-claim
  (forall ((x list))
    (= (cons Y (cons Pl (cons Y x))) (++ (lin (Plus EY EY)) x))))
