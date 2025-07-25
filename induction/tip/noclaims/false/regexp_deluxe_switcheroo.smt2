(declare-datatype T ((A) (B) (C)))
(declare-datatype list ((nil) (cons (head T) (tail list))))
(declare-datatype
  R
  ((Nil) (Eps) (Atom (proj1-Atom T))
   (|:+:| (|proj1-:+:| R) (|proj2-:+:| R))
   (|:&:| (|proj1-:&:| R) (|proj2-:&:| R))
   (|:>:| (|proj1-:>:| R) (|proj2-:>:| R)) (Star (proj1-Star R))))
(define-fun
  x.>.
  ((x R) (y R)) R
  (match x
    ((Nil Nil)
     (_
      (match y
        ((Nil Nil)
         (_
          (match x
            ((Eps y)
             (_
              (match y
                ((Eps x)
                 (_ (|:>:| x y))))))))))))))
(define-fun
  x.+.
  ((x R) (y R)) R
  (match x
    ((Nil y)
     (_
      (match y
        ((Nil x)
         (_ (|:+:| x y))))))))
(define-fun-rec
  eps
  ((x R)) Bool
  (match x
    ((Eps true)
     ((|:+:| p q) (or (eps p) (eps q)))
     ((|:&:| r q2) (and (eps r) (eps q2)))
     ((|:>:| p2 q3) (and (eps p2) (eps q3)))
     ((Star y) true)
     (_ false))))
(define-fun-rec
  step
  ((x R) (y T)) R
  (match x
    (((Atom b) (ite (= b y) Eps Nil))
     ((|:+:| p q) (x.+. (step p y) (step q y)))
     ((|:&:| r q2)
      (let
        ((z (step r y))
         (q1 (step q2 y)))
        (match z
          ((Nil Nil)
           (_
            (match q1
              ((Nil Nil)
               (_ (|:&:| z q1)))))))))
     ((|:>:| p2 q3)
      (ite
        (eps p2) (x.+. (x.>. (step p2 y) q3) (step q3 y))
        (x.+. (x.>. (step p2 y) q3) Nil)))
     ((Star p3) (x.>. (step p3 y) (Star p3)))
     (_ Nil))))
(define-fun-rec
  rec
  ((x R) (y list)) Bool
  (match y
    ((nil (eps x))
     ((cons z xs) (rec (step x z) xs)))))
(assert-not
  (forall ((p R) (q R) (s list))
    (= (rec (|:+:| p q) s) (rec (|:>:| p q) s))))
