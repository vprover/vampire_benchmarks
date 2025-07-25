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
