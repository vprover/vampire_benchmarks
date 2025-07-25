(declare-sort sk 0)
(declare-datatype list2 ((nil2) (cons2 (head2 sk) (tail2 list2))))
(declare-datatype Tok ((C) (D) (X) (Y) (Plus) (Mul)))
(declare-datatype list ((nil) (cons (head Tok) (tail list))))
(declare-datatype
  E
  ((|:+:| (|proj1-:+:| E) (|proj2-:+:| E))
   (|:*:| (|proj1-:*:| E) (|proj2-:*:| E)) (EX) (EY)))
(define-fun-rec
  assoc
  ((x E)) E
  (match x
    (((|:+:| y c)
      (match y
        (((|:+:| a b) (assoc (|:+:| a (|:+:| b c))))
         (_ (|:+:| (assoc y) (assoc c))))))
     ((|:*:| a2 b2) (|:*:| (assoc a2) (assoc b2)))
     (_ x))))
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
     (((|:*:| a b)
       (++ (cons C nil) (++ (lin (|:+:| a b)) (cons D nil))))
      (_ (lin x))))
   (match x
     (((|:+:| a b) (++ (linTerm a) (++ (cons Plus nil) (linTerm b))))
      ((|:*:| a3 b2) (++ (lin a3) (++ (cons Mul nil) (lin b2))))
      (EX (cons X nil))
      (EY (cons Y nil))))))
(assert-not
  (forall ((u E) (v E))
    (=> (= (lin u) (lin v)) (= (assoc u) (assoc v)))))
(assert-claim (= (assoc EX) EX))
(assert-claim (= (assoc EY) EY))
(assert-claim (= (lin EX) (cons X nil)))
(assert-claim (= (lin EX) (linTerm EX)))
(assert-claim (= (lin EY) (cons Y nil)))
(assert-claim (= (lin EY) (linTerm EY)))
(assert-claim (forall ((y list2)) (= (++2 y nil2) y)))
(assert-claim (forall ((y list2)) (= (++2 nil2 y) y)))
(assert-claim (forall ((x E)) (= (assoc (assoc x)) (assoc x))))
(assert-claim (forall ((x E)) (= (lin (assoc x)) (lin x))))
(assert-claim (forall ((x E)) (= (linTerm (assoc x)) (linTerm x))))
(assert-claim
  (forall ((x E) (y E)) (= (lin (|:+:| x y)) (linTerm (|:+:| x y)))))
(assert-claim (forall ((x list)) (= (++ (lin EX) x) (cons X x))))
(assert-claim (forall ((x list)) (= (++ (lin EY) x) (cons Y x))))
(assert-claim
  (forall ((x E)) (= (assoc (|:*:| x EX)) (|:*:| (assoc x) EX))))
(assert-claim
  (forall ((x E)) (= (assoc (|:*:| x EY)) (|:*:| (assoc x) EY))))
(assert-claim
  (forall ((x E)) (= (assoc (|:*:| EX x)) (|:*:| EX (assoc x)))))
(assert-claim
  (forall ((x E)) (= (assoc (|:*:| EY x)) (|:*:| EY (assoc x)))))
(assert-claim
  (forall ((x E)) (= (assoc (|:+:| EX x)) (|:+:| EX (assoc x)))))
(assert-claim
  (forall ((x E)) (= (assoc (|:+:| EY x)) (|:+:| EY (assoc x)))))
(assert-claim
  (forall ((y list2) (z list2) (x2 list2))
    (= (++2 (++2 y z) x2) (++2 y (++2 z x2)))))
(assert-claim
  (forall ((y sk) (z list2) (x2 list2))
    (= (cons2 y (++2 z x2)) (++2 (cons2 y z) x2))))
(assert-claim
  (forall ((x E) (y E))
    (= (|:*:| (assoc x) (assoc y)) (assoc (|:*:| x y)))))
(assert-claim
  (forall ((x E) (y E))
    (= (assoc (|:+:| x (assoc y))) (assoc (|:+:| x y)))))
(assert-claim
  (forall ((x E) (y E))
    (= (assoc (|:+:| (assoc x) y)) (assoc (|:+:| x y)))))
(assert-claim
  (forall ((x E) (y E) (z E))
    (= (assoc (|:+:| (|:+:| x y) z)) (assoc (|:+:| x (|:+:| y z))))))
(assert-claim
  (forall ((x E) (y E) (z E))
    (= (lin (|:*:| (|:*:| x y) z)) (lin (|:*:| x (|:*:| y z))))))
(assert-claim
  (forall ((x E) (y E) (z E))
    (= (linTerm (|:*:| (|:+:| x y) z))
      (linTerm (|:*:| x (|:+:| y z))))))
(assert-claim
  (forall ((x E) (y E))
    (= (assoc (|:+:| (|:*:| x y) EX)) (|:+:| (assoc (|:*:| x y)) EX))))
(assert-claim
  (forall ((x E) (y E))
    (= (assoc (|:+:| (|:*:| x y) EY)) (|:+:| (assoc (|:*:| x y)) EY))))
(assert-claim
  (forall ((x E))
    (= (cons X (cons Mul (lin x))) (lin (|:*:| EX x)))))
(assert-claim
  (forall ((x E))
    (= (lin (|:+:| EX x)) (cons X (cons Plus (linTerm x))))))
(assert-claim
  (forall ((x E))
    (= (cons Y (cons Mul (lin x))) (lin (|:*:| EY x)))))
(assert-claim
  (forall ((x E))
    (= (lin (|:+:| EY x)) (cons Y (cons Plus (linTerm x))))))
(assert-claim
  (forall ((x E))
    (= (assoc (|:+:| (|:*:| EX EX) x))
      (|:+:| (|:*:| EX EX) (assoc x)))))
(assert-claim
  (forall ((x E))
    (= (assoc (|:+:| (|:*:| EX EY) x))
      (|:+:| (|:*:| EX EY) (assoc x)))))
(assert-claim
  (forall ((x E))
    (= (assoc (|:+:| (|:*:| EY EX) x))
      (|:+:| (|:*:| EY EX) (assoc x)))))
(assert-claim
  (forall ((x E))
    (= (assoc (|:+:| (|:*:| EY EY) x))
      (|:+:| (|:*:| EY EY) (assoc x)))))
(assert-claim
  (forall ((x E) (y E) (z E))
    (= (|:+:| (assoc (|:*:| x y)) (assoc z))
      (assoc (|:+:| (|:*:| x y) z)))))
(assert-claim
  (forall ((x E) (y E))
    (= (++ (lin x) (cons Mul (lin y))) (lin (|:*:| x y)))))
(assert-claim
  (forall ((x E) (y E))
    (= (lin (|:+:| x y)) (++ (linTerm x) (cons Plus (linTerm y))))))
(assert-claim
  (forall ((x list))
    (= (cons X (cons Mul (cons X x))) (++ (lin (|:*:| EX EX)) x))))
(assert-claim
  (forall ((x list))
    (= (cons X (cons Mul (cons Y x))) (++ (lin (|:*:| EX EY)) x))))
(assert-claim
  (forall ((x list))
    (= (cons X (cons Plus (cons X x))) (++ (lin (|:+:| EX EX)) x))))
(assert-claim
  (forall ((x list))
    (= (cons X (cons Plus (cons Y x))) (++ (lin (|:+:| EX EY)) x))))
(assert-claim
  (forall ((x list))
    (= (cons Y (cons Mul (cons X x))) (++ (lin (|:*:| EY EX)) x))))
(assert-claim
  (forall ((x list))
    (= (cons Y (cons Mul (cons Y x))) (++ (lin (|:*:| EY EY)) x))))
(assert-claim
  (forall ((x list))
    (= (cons Y (cons Plus (cons X x))) (++ (lin (|:+:| EY EX)) x))))
(assert-claim
  (forall ((x list))
    (= (cons Y (cons Plus (cons Y x))) (++ (lin (|:+:| EY EY)) x))))
