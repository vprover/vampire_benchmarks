(declare-sort sk 0)
(declare-datatype list2 ((nil2) (cons2 (head2 sk) (tail2 list2))))
(declare-datatype Tok ((C) (D) (X) (Y) (Pl)))
(declare-datatype list ((nil) (cons (head Tok) (tail list))))
(declare-datatype T ((TX) (TY)))
(declare-datatype
  E ((Plus (proj1-Plus T) (proj2-Plus E)) (Term (proj1-Term T))))
(define-fun
  linTerm
  ((x T)) list
  (match x
    ((TX (cons X nil))
     (TY (cons Y nil)))))
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
    (((Plus a b) (++ (linTerm a) (++ (cons Pl nil) (lin b))))
     ((Term t) (linTerm t)))))
(assert-not
  (forall ((u E) (v E)) (=> (= (lin u) (lin v)) (= u v))))
(assert-claim true)
(assert-claim true)
(assert-claim (forall ((y list2)) (= (++2 y nil2) y)))
(assert-claim (forall ((y list2)) (= (++2 nil2 y) y)))
(assert-claim (forall ((x T)) (= (linTerm x) (lin (Term x)))))
(assert-claim
  (forall ((x list)) (= (++ (cons X nil) x) (cons X x))))
(assert-claim
  (forall ((x list)) (= (++ (cons Y nil) x) (cons Y x))))
(assert-claim
  (forall ((y list2) (z list2) (x2 list2))
    (= (++2 (++2 y z) x2) (++2 y (++2 z x2)))))
(assert-claim
  (forall ((y sk) (z list2) (x2 list2))
    (= (cons2 y (++2 z x2)) (++2 (cons2 y z) x2))))
(assert-claim
  (forall ((x E)) (= (cons X (cons Pl (lin x))) (lin (Plus TX x)))))
(assert-claim
  (forall ((x E)) (= (cons Y (cons Pl (lin x))) (lin (Plus TY x)))))
(assert-claim
  (forall ((x T) (y E))
    (= (++ (linTerm x) (cons Pl (lin y))) (lin (Plus x y)))))
(assert-claim
  (forall ((x list))
    (= (cons X (cons Pl (cons X x)))
      (++ (lin (Plus TX (Term TX))) x))))
(assert-claim
  (forall ((x list))
    (= (cons X (cons Pl (cons Y x)))
      (++ (lin (Plus TX (Term TY))) x))))
(assert-claim
  (forall ((x list))
    (= (cons Y (cons Pl (cons X x)))
      (++ (lin (Plus TY (Term TX))) x))))
(assert-claim
  (forall ((x list))
    (= (cons Y (cons Pl (cons Y x)))
      (++ (lin (Plus TY (Term TY))) x))))
