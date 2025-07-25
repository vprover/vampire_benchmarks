(declare-datatype T ((A) (B) (C)))
(declare-datatype list ((nil) (cons (head T) (tail list))))
(declare-datatype
  R
  ((Nil) (Eps) (Atom (proj1-Atom T))
   (|:+:| (|proj1-:+:| R) (|proj2-:+:| R))
   (|:>:| (|proj1-:>:| R) (|proj2-:>:| R)) (Star (proj1-Star R))))
(define-fun-rec
  eps
  ((x R)) Bool
  (match x
    ((Eps true)
     ((|:+:| p q) (or (eps p) (eps q)))
     ((|:>:| r q2) (and (eps r) (eps q2)))
     ((Star y) true)
     (_ false))))
(define-fun-rec
  step
  ((x R) (y T)) R
  (match x
    (((Atom b) (ite (= b y) Eps Nil))
     ((|:+:| p q) (|:+:| (step p y) (step q y)))
     ((|:>:| r q2)
      (ite
        (eps r) (|:+:| (|:>:| (step r y) q2) (step q2 y))
        (|:+:| (|:>:| (step r y) q2) Nil)))
     ((Star p2) (|:>:| (step p2 y) (Star p2)))
     (_ Nil))))
(define-fun-rec
  rec
  ((x R) (y list)) Bool
  (match y
    ((nil (eps x))
     ((cons z xs) (rec (step x z) xs)))))
(assert-not
  (forall ((p R)) (not (rec p (cons A (cons B (cons B nil)))))))
