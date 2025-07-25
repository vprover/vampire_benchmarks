(declare-sort sk 0)
(declare-datatype list2 ((nil2) (cons2 (head2 sk) (tail2 list2))))
(declare-datatype T ((A) (B) (C)))
(declare-datatype list ((nil) (cons (head T) (tail list))))
(declare-datatype
  R2
  ((Nil2) (Eps2) (Atom2 (proj1-Atom2 sk))
   (|:+:2| (|proj1-:+:2| R2) (|proj2-:+:2| R2))
   (|:>:2| (|proj1-:>:2| R2) (|proj2-:>:2| R2))
   (Star2 (proj1-Star2 R2))))
(declare-datatype
  R
  ((Nil) (Eps) (Atom (proj1-Atom T))
   (|:+:| (|proj1-:+:| R) (|proj2-:+:| R))
   (|:>:| (|proj1-:>:| R) (|proj2-:>:| R)) (Star (proj1-Star R))))
(define-fun-rec
  eps2
  ((x R2)) Bool
  (match x
    ((Eps2 true)
     ((|:+:2| p q) (or (eps2 p) (eps2 q)))
     ((|:>:2| r q2) (and (eps2 r) (eps2 q2)))
     ((Star2 y) true)
     (_ false))))
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
  (forall ((p R) (q R) (r R) (s list))
    (= (rec (|:+:| p (|:>:| q r)) s) (rec (|:>:| (|:+:| p q) r) s))))
(assert-claim (eps2 Eps2))
(assert-claim (not (eps2 Nil2)))
(assert-claim (= (step (Atom A) B) Nil))
(assert-claim (= (step (Atom A) C) Nil))
(assert-claim (= (step (Atom B) C) Nil))
(assert-claim
  (= (step (|:>:| (Star Nil) (Atom A)) C)
    (step (|:>:| (Star Nil) (Atom A)) B)))
(assert-claim
  (= (step (|:>:| (Star Nil) (Atom B)) C)
    (step (|:>:| (Star Nil) (Atom B)) A)))
(assert-claim
  (= (step (|:>:| (Star Nil) (Atom C)) B)
    (step (|:>:| (Star Nil) (Atom C)) A)))
(assert-claim
  (= (step (|:>:| (Star Eps) (Atom A)) C)
    (step (|:>:| (Star Eps) (Atom A)) B)))
(assert-claim
  (= (step (|:>:| (Star Eps) (Atom B)) C)
    (step (|:>:| (Star Eps) (Atom B)) A)))
(assert-claim
  (= (step (|:>:| (Star Eps) (Atom C)) B)
    (step (|:>:| (Star Eps) (Atom C)) A)))
(assert-claim
  (= (step (|:>:| (Star (Atom A)) Nil) C)
    (step (|:>:| (Star (Atom A)) Nil) B)))
(assert-claim
  (= (step (|:>:| (Star (Atom A)) Eps) C)
    (step (|:>:| (Star (Atom A)) Eps) B)))
(assert-claim
  (= (step (|:>:| (Star (Atom B)) Nil) C)
    (step (|:>:| (Star (Atom B)) Nil) A)))
(assert-claim
  (= (step (|:>:| (Star (Atom B)) Eps) C)
    (step (|:>:| (Star (Atom B)) Eps) A)))
(assert-claim
  (= (step (|:>:| (Star (Atom C)) Nil) B)
    (step (|:>:| (Star (Atom C)) Nil) A)))
(assert-claim
  (= (step (|:>:| (Star (Atom C)) Eps) B)
    (step (|:>:| (Star (Atom C)) Eps) A)))
(assert-claim
  (= (step (Star (Atom A)) B) (|:>:| Nil (Star (Atom A)))))
(assert-claim
  (= (step (Star (Atom A)) C) (|:>:| Nil (Star (Atom A)))))
(assert-claim
  (= (step (Star (Atom B)) A) (|:>:| Nil (Star (Atom B)))))
(assert-claim
  (= (step (Star (Atom B)) C) (|:>:| Nil (Star (Atom B)))))
(assert-claim
  (= (step (Star (Atom C)) A) (|:>:| Nil (Star (Atom C)))))
(assert-claim
  (= (step (Star (Atom C)) B) (|:>:| Nil (Star (Atom C)))))
(assert-claim
  (= (step (Star (|:+:| Nil (Atom A))) C)
    (step (Star (|:+:| Nil (Atom A))) B)))
(assert-claim
  (= (step (Star (|:+:| Nil (Atom B))) C)
    (step (Star (|:+:| Nil (Atom B))) A)))
(assert-claim
  (= (step (Star (|:+:| Nil (Atom C))) B)
    (step (Star (|:+:| Nil (Atom C))) A)))
(assert-claim
  (= (step (Star (|:+:| Eps (Atom A))) C)
    (step (Star (|:+:| Eps (Atom A))) B)))
(assert-claim
  (= (step (Star (|:+:| Eps (Atom B))) C)
    (step (Star (|:+:| Eps (Atom B))) A)))
(assert-claim
  (= (step (Star (|:+:| Eps (Atom C))) B)
    (step (Star (|:+:| Eps (Atom C))) A)))
(assert-claim
  (= (step (Star (|:+:| (Atom A) Nil)) C)
    (step (Star (|:+:| (Atom A) Nil)) B)))
(assert-claim
  (= (step (Star (|:+:| (Atom A) Eps)) C)
    (step (Star (|:+:| (Atom A) Eps)) B)))
(assert-claim
  (= (step (Star (|:+:| (Atom B) Nil)) C)
    (step (Star (|:+:| (Atom B) Nil)) A)))
(assert-claim
  (= (step (Star (|:+:| (Atom B) Eps)) C)
    (step (Star (|:+:| (Atom B) Eps)) A)))
(assert-claim
  (= (step (Star (|:+:| (Atom C) Nil)) B)
    (step (Star (|:+:| (Atom C) Nil)) A)))
(assert-claim
  (= (step (Star (|:+:| (Atom C) Eps)) B)
    (step (Star (|:+:| (Atom C) Eps)) A)))
(assert-claim
  (= (step (Star (|:>:| Eps (Atom A))) C)
    (step (Star (|:>:| Eps (Atom A))) B)))
(assert-claim
  (= (step (Star (|:>:| Eps (Atom B))) C)
    (step (Star (|:>:| Eps (Atom B))) A)))
(assert-claim
  (= (step (Star (|:>:| Eps (Atom C))) B)
    (step (Star (|:>:| Eps (Atom C))) A)))
(assert-claim
  (= (step (Star (Star (Atom A))) C)
    (step (Star (Star (Atom A))) B)))
(assert-claim
  (= (step (Star (Star (Atom B))) C)
    (step (Star (Star (Atom B))) A)))
(assert-claim
  (= (step (Star (Star (Atom C))) B)
    (step (Star (Star (Atom C))) A)))
(assert-claim (forall ((y sk)) (not (eps2 (Atom2 y)))))
(assert-claim (forall ((y R2)) (eps2 (Star2 y))))
(assert-claim (forall ((x R)) (= (rec x nil) (eps x))))
(assert-claim (forall ((x list)) (not (rec Nil x))))
(assert-claim (forall ((x T)) (= (step Eps x) Nil)))
(assert-claim (forall ((x T)) (= (step Nil x) Nil)))
(assert-claim
  (forall ((y R2) (z R2))
    (= (eps2 (|:+:2| z y)) (eps2 (|:+:2| y z)))))
(assert-claim (forall ((y R2)) (= (eps2 (|:+:2| y y)) (eps2 y))))
(assert-claim
  (forall ((y R2) (z R2)) (=> (eps2 z) (eps2 (|:+:2| y z)))))
(assert-claim
  (forall ((y R2) (z R2))
    (= (eps2 (|:>:2| z y)) (eps2 (|:>:2| y z)))))
(assert-claim (forall ((y R2)) (= (eps2 (|:>:2| y y)) (eps2 y))))
(assert-claim
  (forall ((y R2) (z R2))
    (=> (eps2 y) (= (eps2 (|:>:2| z y)) (eps2 z)))))
(assert-claim
  (forall ((x R) (y list)) (=> (rec x y) (rec (Star x) y))))
(assert-claim
  (forall ((x T) (y T)) (= (step (Atom y) x) (step (Atom x) y))))
(assert-claim (forall ((x T)) (= (step (Atom x) x) Eps)))
(assert-claim
  (forall ((y R2)) (= (eps2 (|:+:2| y Nil2)) (eps2 y))))
(assert-claim (forall ((y R2)) (not (eps2 (|:>:2| y Nil2)))))
(assert-claim
  (forall ((x list) (y R)) (=> (rec y x) (eps (|:+:| Eps y)))))
(assert-claim
  (forall ((x list) (y R))
    (=> (rec y x) (= (eps (|:>:| Eps y)) (eps y)))))
(assert-claim
  (forall ((x list)) (= (rec (Star Eps) x) (rec Eps x))))
(assert-claim
  (forall ((x list)) (= (rec (Star Nil) x) (rec Eps x))))
(assert-claim
  (forall ((x T) (y T)) (= (step (Star Eps) x) (step (Star Eps) y))))
(assert-claim
  (forall ((x T) (y T)) (= (step (Star Nil) x) (step (Star Nil) y))))
(assert-claim
  (forall ((x T)) (= (step (Star Eps) x) (|:>:| Nil (Star Eps)))))
(assert-claim
  (forall ((x T)) (= (step (Star Nil) x) (|:>:| Nil (Star Nil)))))
(assert-claim
  (forall ((x R) (y R) (z list))
    (= (rec (|:+:| y x) z) (rec (|:+:| x y) z))))
(assert-claim
  (forall ((x R) (y list)) (= (rec (|:+:| x x) y) (rec x y))))
(assert-claim
  (forall ((x R) (y R) (z list)) (=> (rec y z) (rec (|:+:| x y) z))))
(assert-claim
  (forall ((x R) (y R) (z R) (x2 list))
    (=> (rec x x2) (= (rec (|:>:| z y) x2) (rec (|:>:| y z) x2)))))
(assert-claim
  (forall ((x list) (y R) (z list) (x2 R) (x3 R) (x4 list))
    (=> (rec y z)
      (=> (rec x3 x)
        (=> (rec x2 x4)
          (= (rec (|:>:| y x3) z) (rec (|:>:| x2 x3) x4)))))))
(assert-claim
  (forall ((x R) (y T) (z list))
    (= (rec (step x y) z) (rec x (cons y z)))))
(assert-claim
  (forall ((y sk) (z R2)) (= (eps2 (|:+:2| z (Atom2 y))) (eps2 z))))
(assert-claim
  (forall ((y R2) (z sk)) (not (eps2 (|:>:2| y (Atom2 z))))))
(assert-claim
  (forall ((x list) (y R) (z R))
    (=> (rec z x) (eps (|:+:| y (Star z))))))
(assert-claim
  (forall ((x list) (y R) (z R))
    (=> (rec z x) (eps (|:+:| (Star y) z)))))
(assert-claim
  (forall ((x list) (y R) (z R))
    (=> (rec y x) (= (eps (|:>:| z (Star y))) (eps z)))))
(assert-claim
  (forall ((x list) (y R) (z R))
    (=> (rec z x) (= (eps (|:>:| (Star y) z)) (eps z)))))
(assert-claim
  (forall ((x R) (y T))
    (= (eps (step (Star x) y)) (eps (step x y)))))
(assert-claim
  (forall ((x R) (y list)) (= (rec (|:+:| x Nil) y) (rec x y))))
(assert-claim
  (forall ((x R) (y list)) (= (rec (|:>:| x Eps) y) (rec x y))))
(assert-claim
  (forall ((x R) (y list)) (not (rec (|:>:| x Nil) y))))
(assert-claim
  (forall ((x R) (y list)) (= (rec (|:>:| Eps x) y) (rec x y))))
(assert-claim
  (forall ((x R) (y list)) (not (rec (|:>:| Nil x) y))))
(assert-claim
  (forall ((x R) (y list))
    (= (rec (Star (Star x)) y) (rec (Star x) y))))
(assert-claim
  (forall ((x R) (y T))
    (= (step (|:+:| x Eps) y) (|:+:| (step x y) Nil))))
(assert-claim
  (forall ((x R) (y T))
    (= (step (|:+:| x Nil) y) (|:+:| (step x y) Nil))))
(assert-claim
  (forall ((x R) (y T))
    (= (step (|:+:| Eps x) y) (|:+:| Nil (step x y)))))
(assert-claim
  (forall ((x R) (y T))
    (= (step (|:+:| Nil x) y) (|:+:| Nil (step x y)))))
(assert-claim
  (forall ((x T) (y R) (z T))
    (= (step (|:>:| Nil y) x) (step (|:>:| Nil y) z))))
(assert-claim
  (forall ((x T) (y R))
    (= (step (|:>:| Nil y) x) (|:+:| (|:>:| Nil y) Nil))))
(assert-claim
  (forall ((x T))
    (= (step (Star (Atom x)) x) (|:>:| Eps (Star (Atom x))))))
(assert-claim (forall ((x R)) (rec (|:+:| x Eps) nil)))
(assert-claim
  (forall ((x T) (y T))
    (= (step (|:>:| Eps Eps) x) (step (|:>:| Eps Eps) y))))
(assert-claim
  (forall ((x T) (y T))
    (= (step (|:>:| Eps Nil) x) (step (|:>:| Eps Nil) y))))
(assert-claim
  (forall ((x T))
    (= (step (|:>:| Nil Eps) x) (step (|:>:| Eps Eps) x))))
(assert-claim
  (forall ((x T))
    (= (step (|:>:| Nil Nil) x) (step (|:>:| Eps Nil) x))))
(assert-claim
  (forall ((x T) (y T))
    (= (step (Star (Star Eps)) x) (step (Star (Star Eps)) y))))
(assert-claim
  (forall ((x T) (y T))
    (= (step (Star (Star Nil)) x) (step (Star (Star Nil)) y))))
(assert-claim
  (forall ((x R) (y T))
    (= (|:>:| (step x y) (Star x)) (step (Star x) y))))
(assert-claim
  (forall ((y R2) (z R2) (x2 R2))
    (= (eps2 (|:+:2| y (|:+:2| x2 z)))
      (eps2 (|:+:2| y (|:+:2| z x2))))))
(assert-claim
  (forall ((y R2) (z R2) (x2 R2))
    (= (eps2 (|:+:2| z (|:+:2| y x2)))
      (eps2 (|:+:2| y (|:+:2| z x2))))))
(assert-claim
  (forall ((y R2) (z R2))
    (= (eps2 (|:+:2| y (|:+:2| y z))) (eps2 (|:+:2| y z)))))
(assert-claim
  (forall ((y R2) (z R2) (x2 R2))
    (= (eps2 (|:+:2| y (|:>:2| x2 z)))
      (eps2 (|:+:2| y (|:>:2| z x2))))))
(assert-claim
  (forall ((y R2) (z R2))
    (= (eps2 (|:+:2| z (|:>:2| z y))) (eps2 z))))
(assert-claim
  (forall ((y R2) (z R2))
    (= (eps2 (|:+:2| y (|:>:2| z z))) (eps2 (|:+:2| y z)))))
(assert-claim
  (forall ((y R2) (z R2) (x2 R2))
    (=> (eps2 y)
      (= (eps2 (|:+:2| z (|:>:2| x2 y))) (eps2 (|:+:2| z x2))))))
(assert-claim
  (forall ((y R2) (z R2) (x2 R2))
    (= (eps2 (|:>:2| y (|:+:2| x2 z)))
      (eps2 (|:>:2| y (|:+:2| z x2))))))
(assert-claim
  (forall ((y R2) (z R2))
    (= (eps2 (|:>:2| z (|:+:2| z y))) (eps2 z))))
(assert-claim
  (forall ((y R2) (z R2))
    (= (eps2 (|:>:2| y (|:+:2| z z))) (eps2 (|:>:2| y z)))))
(assert-claim
  (forall ((y R2) (z R2) (x2 R2))
    (= (eps2 (|:>:2| y (|:>:2| x2 z)))
      (eps2 (|:>:2| y (|:>:2| z x2))))))
(assert-claim
  (forall ((y R2) (z R2) (x2 R2))
    (= (eps2 (|:>:2| z (|:>:2| y x2)))
      (eps2 (|:>:2| y (|:>:2| z x2))))))
(assert-claim
  (forall ((y R2) (z R2))
    (= (eps2 (|:>:2| y (|:>:2| y z))) (eps2 (|:>:2| y z)))))
(assert-claim
  (forall ((x R) (y R) (z T))
    (= (eps (step (|:>:| y x) z)) (eps (step (|:>:| x y) z)))))
(assert-claim
  (forall ((x R) (y T))
    (= (eps (step (|:>:| x x) y)) (eps (|:>:| x (step x y))))))
(assert-claim
  (forall ((x R) (y list))
    (= (rec (|:+:| x (Star x)) y) (rec (Star x) y))))
(assert-claim
  (forall ((x list) (y list) (z R) (x2 R) (x3 R) (x4 list))
    (=> (rec x3 x)
      (=> (rec x2 y)
        (=> (rec z x4)
          (= (rec (|:+:| (Star x3) x2) x4) (rec (|:+:| x2 x3) x4)))))))
(assert-claim
  (forall ((x R) (y R) (z list))
    (=> (rec y z) (= (rec (|:>:| x (Star y)) z) (rec (|:>:| x y) z)))))
(assert-claim
  (forall ((x R) (y list))
    (= (rec (|:>:| (Star x) x) y) (rec (|:>:| x (Star x)) y))))
(assert-claim
  (forall ((x R) (y R) (z list))
    (=> (rec y z) (rec (|:>:| (Star x) y) z))))
(assert-claim
  (forall ((x list) (y R) (z R) (x2 list))
    (=> (rec z x)
      (=> (rec y x2)
        (= (rec (|:>:| (Star z) z) x2) (rec (|:+:| z z) x2))))))
(assert-claim
  (forall ((x R) (y R) (z list))
    (= (rec (Star (|:+:| y x)) z) (rec (Star (|:+:| x y)) z))))
(assert-claim
  (forall ((x R) (y list))
    (= (rec (Star (|:+:| x x)) y) (rec (Star x) y))))
(assert-claim
  (forall ((x list) (y list) (z R) (x2 R) (x3 R) (x4 list))
    (=> (rec x3 x)
      (=> (rec x2 y)
        (=> (rec z x4)
          (= (rec (Star (|:>:| x3 x2)) x4)
            (rec (Star (|:>:| x2 x3)) x4)))))))
(assert-claim
  (forall ((x list) (y R) (z R) (x2 list))
    (=> (rec y x)
      (=> (rec z x2)
        (= (rec (Star (|:>:| y y)) x) (rec (|:>:| y z) x2))))))
(assert-claim
  (forall ((x list) (y R) (z R) (x2 list))
    (=> (rec z x)
      (=> (rec y x2)
        (= (rec (Star (|:>:| z z)) x2) (rec (Star z) x2))))))
(assert-claim
  (forall ((x R) (y T))
    (= (step (|:+:| x (Atom y)) y) (|:+:| (step x y) Eps))))
(assert-claim
  (forall ((x R) (y T))
    (= (step (|:+:| (Atom y) x) y) (|:+:| Eps (step x y)))))
(assert-claim
  (forall ((x T) (y R) (z T))
    (= (step (|:>:| (Atom z) y) x) (step (|:>:| (Atom x) y) z))))
(assert-claim
  (forall ((x T) (y R))
    (= (step (|:>:| (Atom x) y) x) (|:+:| (|:>:| Eps y) Nil))))
(assert-claim
  (forall ((x T) (y T) (z T)) (= (step (step (Atom x) y) z) Nil)))
(assert-claim
  (forall ((y R2) (z R2))
    (= (eps2 (|:+:2| z (|:>:2| y Nil2))) (eps2 z))))
(assert-claim
  (forall ((y R2) (z R2))
    (= (eps2 (|:>:2| y (|:+:2| z Nil2))) (eps2 (|:>:2| y z)))))
(assert-claim
  (forall ((x list) (y R) (z R))
    (=> (rec z x)
      (= (eps (|:+:| y (|:>:| Eps z))) (eps (|:+:| y z))))))
(assert-claim (forall ((x R) (y R)) (rec (|:+:| x (Star y)) nil)))
(assert-claim
  (forall ((x R) (y list))
    (= (rec (|:+:| x (Star Eps)) y) (rec (|:+:| x Eps) y))))
(assert-claim
  (forall ((x R) (y list))
    (= (rec (|:+:| x (Star Nil)) y) (rec (|:+:| x Eps) y))))
(assert-claim
  (forall ((x R) (y list))
    (= (rec (|:+:| Eps (Star x)) y) (rec (Star x) y))))
(assert-claim
  (forall ((x R) (y list))
    (= (rec (|:>:| x (Star Eps)) y) (rec x y))))
(assert-claim
  (forall ((x R) (y list))
    (= (rec (|:>:| x (Star Nil)) y) (rec x y))))
(assert-claim
  (forall ((x R) (y list))
    (= (rec (|:>:| (Star Eps) x) y) (rec x y))))
(assert-claim
  (forall ((x R) (y list))
    (= (rec (|:>:| (Star Nil) x) y) (rec x y))))
(assert-claim
  (forall ((x R) (y list))
    (= (rec (Star (|:+:| x Eps)) y) (rec (Star x) y))))
(assert-claim
  (forall ((x R) (y list))
    (= (rec (Star (|:+:| x Nil)) y) (rec (Star x) y))))
(assert-claim
  (forall ((x R) (y list))
    (= (rec (Star (|:>:| x Eps)) y) (rec (Star x) y))))
(assert-claim
  (forall ((x R) (y list))
    (= (rec (Star (|:>:| x Nil)) y) (rec Eps y))))
(assert-claim
  (forall ((x R) (y list))
    (= (rec (Star (|:>:| Eps x)) y) (rec (Star x) y))))
(assert-claim
  (forall ((x R) (y list))
    (= (rec (Star (|:>:| Nil x)) y) (rec Eps y))))
(assert-claim
  (forall ((x T))
    (= (step (|:>:| Eps (Atom x)) x)
      (|:+:| (|:>:| Nil (Atom x)) Eps))))
(assert-claim
  (forall ((x R))
    (= (step (|:+:| x (Atom A)) B) (|:+:| (step x B) Nil))))
(assert-claim
  (forall ((x R))
    (= (step (|:+:| x (Atom A)) C) (|:+:| (step x C) Nil))))
(assert-claim
  (forall ((x R))
    (= (step (|:+:| x (Atom B)) A) (|:+:| (step x A) Nil))))
(assert-claim
  (forall ((x R))
    (= (step (|:+:| x (Atom B)) C) (|:+:| (step x C) Nil))))
(assert-claim
  (forall ((x R))
    (= (step (|:+:| x (Atom C)) A) (|:+:| (step x A) Nil))))
(assert-claim
  (forall ((x R))
    (= (step (|:+:| x (Atom C)) B) (|:+:| (step x B) Nil))))
(assert-claim
  (forall ((x R))
    (= (step (|:+:| (Atom A) x) B) (|:+:| Nil (step x B)))))
(assert-claim
  (forall ((x R))
    (= (step (|:+:| (Atom A) x) C) (|:+:| Nil (step x C)))))
(assert-claim
  (forall ((x R))
    (= (step (|:+:| (Atom B) x) A) (|:+:| Nil (step x A)))))
(assert-claim
  (forall ((x R))
    (= (step (|:+:| (Atom B) x) C) (|:+:| Nil (step x C)))))
(assert-claim
  (forall ((x R))
    (= (step (|:+:| (Atom C) x) A) (|:+:| Nil (step x A)))))
(assert-claim
  (forall ((x R))
    (= (step (|:+:| (Atom C) x) B) (|:+:| Nil (step x B)))))
(assert-claim
  (forall ((x R) (y T))
    (= (step (|:>:| (Atom A) x) B) (step (|:>:| Nil x) y))))
(assert-claim
  (forall ((x R) (y T))
    (= (step (|:>:| (Atom A) x) C) (step (|:>:| Nil x) y))))
(assert-claim
  (forall ((x R) (y T))
    (= (step (|:>:| (Atom B) x) C) (step (|:>:| Nil x) y))))
(assert-claim
  (forall ((x T))
    (= (step (|:>:| Eps (Atom A)) B) (step (|:>:| Nil (Atom A)) x))))
(assert-claim
  (forall ((x T))
    (= (step (|:>:| Eps (Atom A)) C) (step (|:>:| Nil (Atom A)) x))))
(assert-claim
  (forall ((x T))
    (= (step (|:>:| Eps (Atom B)) A) (step (|:>:| Nil (Atom B)) x))))
(assert-claim
  (forall ((x T))
    (= (step (|:>:| Eps (Atom B)) C) (step (|:>:| Nil (Atom B)) x))))
(assert-claim
  (forall ((x T))
    (= (step (|:>:| Eps (Atom C)) A) (step (|:>:| Nil (Atom C)) x))))
(assert-claim
  (forall ((x T))
    (= (step (|:>:| Eps (Atom C)) B) (step (|:>:| Nil (Atom C)) x))))
(assert-claim
  (forall ((x T))
    (= (step (|:>:| Eps (Star Eps)) A)
      (step (|:>:| Eps (Star Eps)) x))))
(assert-claim
  (forall ((x T))
    (= (step (|:>:| Eps (Star Nil)) A)
      (step (|:>:| Eps (Star Nil)) x))))
(assert-claim
  (forall ((x T))
    (= (step (|:>:| (Star Eps) Eps) A)
      (step (|:>:| (Star Eps) Eps) x))))
(assert-claim
  (forall ((x T))
    (= (step (|:>:| (Star Eps) Nil) A)
      (step (|:>:| (Star Eps) Nil) x))))
(assert-claim
  (forall ((x T))
    (= (step (|:>:| (Star Nil) Eps) A)
      (step (|:>:| (Star Nil) Eps) x))))
(assert-claim
  (forall ((x T))
    (= (step (|:>:| (Star Nil) Nil) A)
      (step (|:>:| (Star Nil) Nil) x))))
(assert-claim
  (forall ((x T))
    (= (step (Star (|:+:| Eps Eps)) A)
      (step (Star (|:+:| Eps Eps)) x))))
(assert-claim
  (forall ((x T))
    (= (step (Star (|:+:| Eps Nil)) A)
      (step (Star (|:+:| Eps Nil)) x))))
(assert-claim
  (forall ((x T))
    (= (step (Star (|:+:| Nil Eps)) A)
      (step (Star (|:+:| Nil Eps)) x))))
(assert-claim
  (forall ((x T))
    (= (step (Star (|:+:| Nil Nil)) A)
      (step (Star (|:+:| Nil Nil)) x))))
(assert-claim
  (forall ((x R) (y R) (z T))
    (= (|:+:| (step x z) (step y z)) (step (|:+:| x y) z))))
(assert-claim
  (forall ((x R) (y R) (z R) (x2 list))
    (= (rec (|:+:| x (|:+:| z y)) x2) (rec (|:+:| x (|:+:| y z)) x2))))
(assert-claim
  (forall ((x R) (y R) (z R) (x2 list))
    (= (rec (|:+:| y (|:+:| x z)) x2) (rec (|:+:| x (|:+:| y z)) x2))))
(assert-claim
  (forall ((x R) (y R) (z list))
    (= (rec (|:+:| x (|:+:| x y)) z) (rec (|:+:| x y) z))))
(assert-claim
  (forall ((x R) (y R) (z R) (x2 list))
    (= (rec (|:+:| x (|:>:| z y)) x2) (rec (|:+:| x (|:>:| y z)) x2))))
(assert-claim
  (forall ((x R) (y R) (z R) (x2 list))
    (= (rec (|:>:| x (|:+:| z y)) x2) (rec (|:>:| x (|:+:| y z)) x2))))
(assert-claim
  (forall ((x R) (y R) (z list))
    (= (rec (|:>:| x (|:+:| y y)) z) (rec (|:>:| x y) z))))
(assert-claim
  (forall ((x R) (y T) (z list))
    (= (rec (|:>:| x (step x y)) z) (rec (|:>:| x x) (cons y z)))))
(assert-claim
  (forall ((x R) (y R) (z R) (x2 list))
    (= (rec (|:>:| (|:>:| x y) z) x2) (rec (|:>:| x (|:>:| y z)) x2))))
(assert-claim
  (forall ((x R) (y T))
    (= (|:+:| (|:>:| Nil x) (step x y)) (step (|:>:| Eps x) y))))
(assert-claim
  (forall ((y R2) (z sk) (x2 R2))
    (= (eps2 (|:+:2| x2 (|:>:2| y (Atom2 z)))) (eps2 x2))))
(assert-claim
  (forall ((y sk) (z R2) (x2 R2))
    (= (eps2 (|:>:2| z (|:+:2| x2 (Atom2 y)))) (eps2 (|:>:2| z x2)))))
(assert-claim
  (forall ((x R) (y R) (z T))
    (= (eps (|:+:| x (step (Star y) z))) (eps (|:+:| x (step y z))))))
(assert-claim
  (forall ((x R) (y T) (z T))
    (= (eps (step (|:>:| x (Atom y)) z))
      (eps (|:>:| x (step (Atom y) z))))))
(assert-claim
  (forall ((x R) (y T))
    (= (eps (step (|:>:| x (Star x)) y)) (eps (step x y)))))
(assert-claim
  (forall ((x R) (y R) (z list))
    (= (rec (|:+:| x (|:>:| y Eps)) z) (rec (|:+:| x y) z))))
(assert-claim
  (forall ((x R) (y R) (z list))
    (= (rec (|:+:| y (|:>:| x Nil)) z) (rec y z))))
(assert-claim
  (forall ((x R) (y R) (z list))
    (= (rec (|:+:| x (Star (Star y))) z) (rec (|:+:| x (Star y)) z))))
(assert-claim
  (forall ((x R) (y T) (z list))
    (= (rec (|:+:| Eps (step x y)) z) (rec (Star (step x y)) z))))
(assert-claim
  (forall ((x R) (y R) (z list))
    (= (rec (|:>:| x (|:+:| y Eps)) z) (rec (|:+:| x (|:>:| x y)) z))))
(assert-claim
  (forall ((x R) (y R) (z list))
    (= (rec (|:>:| x (|:+:| y Nil)) z) (rec (|:>:| x y) z))))
(assert-claim
  (forall ((x R) (y R) (z list))
    (= (rec (|:>:| x (Star (Star y))) z) (rec (|:>:| x (Star y)) z))))
(assert-claim
  (forall ((x R) (y R) (z list))
    (= (rec (|:>:| (Star x) (Star y)) z)
      (rec (|:+:| (Star x) (Star y)) z))))
(assert-claim
  (forall ((x R) (y R) (z list))
    (= (rec (Star (|:+:| x (Star y))) z) (rec (Star (|:+:| x y)) z))))
(assert-claim
  (forall ((x R) (y list))
    (= (rec (Star (|:>:| x (Star x))) y) (rec (Star x) y))))
(assert-claim
  (forall ((x R) (y R) (z T))
    (= (step (|:+:| x (|:+:| y Nil)) z)
      (step (|:+:| x (|:+:| y Eps)) z))))
(assert-claim
  (forall ((x R) (y R) (z T))
    (= (step (|:+:| x (|:+:| Nil y)) z)
      (step (|:+:| x (|:+:| Eps y)) z))))
(assert-claim
  (forall ((x R) (y R) (z T))
    (= (step (|:+:| (|:+:| x Nil) y) z)
      (step (|:+:| (|:+:| x Eps) y) z))))
(assert-claim
  (forall ((x R) (y R) (z T))
    (= (step (|:+:| (|:+:| Nil x) y) z)
      (step (|:+:| (|:+:| Eps x) y) z))))
(assert-claim
  (forall ((x T) (y T))
    (= (step (|:+:| (Atom y) (Atom y)) x)
      (step (|:+:| (Atom x) (Atom x)) y))))
(assert-claim
  (forall ((x R) (y T))
    (= (|:+:| (|:>:| (step x y) Eps) Nil) (step (|:>:| x Eps) y))))
(assert-claim
  (forall ((x R) (y T))
    (= (|:+:| (|:>:| (step x y) Nil) Nil) (step (|:>:| x Nil) y))))
(assert-claim
  (forall ((x T) (y list))
    (= (rec (Star (step (Atom x) A)) y) (rec Eps y))))
(assert-claim
  (forall ((x R) (y T))
    (= (step (|:+:| x (|:+:| Eps Eps)) y)
      (|:+:| (step x y) (|:+:| Nil Nil)))))
(assert-claim
  (forall ((x R) (y T))
    (= (step (|:+:| x (|:>:| Nil Eps)) y)
      (step (|:+:| x (|:>:| Eps Eps)) y))))
(assert-claim
  (forall ((x R) (y T))
    (= (step (|:+:| x (|:>:| Nil Nil)) y)
      (step (|:+:| x (|:>:| Eps Nil)) y))))
(assert-claim
  (forall ((x R) (y T))
    (= (step (|:+:| (|:+:| Eps Eps) x) y)
      (|:+:| (|:+:| Nil Nil) (step x y)))))
(assert-claim
  (forall ((x R) (y T))
    (= (step (|:+:| (|:>:| Nil Eps) x) y)
      (step (|:+:| (|:>:| Eps Eps) x) y))))
(assert-claim
  (forall ((x R) (y T))
    (= (step (|:+:| (|:>:| Nil Nil) x) y)
      (step (|:+:| (|:>:| Eps Nil) x) y))))
(assert-claim
  (forall ((x T) (y T))
    (= (step (|:+:| (Atom y) (Star Eps)) x)
      (step (|:+:| (Atom x) (Star Eps)) y))))
(assert-claim
  (forall ((x T) (y T))
    (= (step (|:+:| (Atom y) (Star Nil)) x)
      (step (|:+:| (Atom x) (Star Nil)) y))))
(assert-claim
  (forall ((x T) (y T))
    (= (step (|:+:| (Star Eps) (Atom y)) x)
      (step (|:+:| (Star Eps) (Atom x)) y))))
(assert-claim
  (forall ((x T) (y T))
    (= (step (|:+:| (Star Nil) (Atom y)) x)
      (step (|:+:| (Star Nil) (Atom x)) y))))
(assert-claim
  (forall ((x R) (y T))
    (= (step (|:>:| (|:+:| x Nil) Eps) y)
      (step (|:>:| (|:+:| x Eps) Eps) y))))
(assert-claim
  (forall ((x R) (y T))
    (= (step (|:>:| (|:+:| x Nil) Nil) y)
      (step (|:>:| (|:+:| x Eps) Nil) y))))
(assert-claim
  (forall ((x R) (y T))
    (= (step (|:>:| (|:+:| Eps Nil) x) y)
      (step (|:>:| (|:+:| Eps Eps) x) y))))
(assert-claim
  (forall ((x R) (y T))
    (= (step (|:>:| (|:+:| Nil x) Eps) y)
      (step (|:>:| (|:+:| Eps x) Eps) y))))
(assert-claim
  (forall ((x R) (y T))
    (= (step (|:>:| (|:+:| Nil x) Nil) y)
      (step (|:>:| (|:+:| Eps x) Nil) y))))
(assert-claim
  (forall ((x R) (y T))
    (= (step (|:>:| (|:+:| Nil Eps) x) y)
      (step (|:>:| (|:+:| Eps Eps) x) y))))
(assert-claim
  (forall ((x R) (y R) (z T))
    (= (step (|:>:| (|:>:| Nil x) y) A)
      (step (|:>:| (|:>:| Nil x) y) z))))
(assert-claim
  (forall ((x R) (y T))
    (= (step (|:>:| (|:>:| Nil Nil) x) y)
      (step (|:>:| (|:>:| Eps Nil) x) y))))
(assert-claim
  (forall ((x T) (y T))
    (= (step (step (Star (Atom y)) x) x)
      (step (step (Star (Atom y)) x) y))))
(assert-claim
  (forall ((x T) (y R))
    (= (step (|:>:| (|:+:| Nil Nil) y) x)
      (|:+:| (|:>:| (|:+:| Nil Nil) y) Nil))))
(assert-claim
  (forall ((x T))
    (= (step (|:+:| (Star Eps) (Star Eps)) x)
      (step (|:>:| Eps (Star Eps)) x))))
(assert-claim
  (forall ((x T))
    (= (step (|:+:| (Star Nil) (Star Nil)) x)
      (step (|:>:| Eps (Star Nil)) x))))
(assert-claim
  (forall ((x T))
    (= (step (|:>:| (|:>:| Nil Eps) Eps) x)
      (step (|:>:| (|:>:| Eps Eps) Eps) x))))
(assert-claim
  (forall ((x T))
    (= (step (|:>:| (|:>:| Nil Eps) Nil) x)
      (step (|:>:| (|:>:| Eps Eps) Nil) x))))
(assert-claim
  (forall ((x R))
    (= (step (Star (|:>:| (Atom A) x)) C)
      (step (Star (|:>:| (Atom A) x)) B))))
(assert-claim
  (forall ((x R))
    (= (step (Star (|:>:| (Atom B) x)) C)
      (step (Star (|:>:| (Atom B) x)) A))))
(assert-claim
  (forall ((x R))
    (= (step (Star (|:>:| (Atom C) x)) B)
      (step (Star (|:>:| (Atom C) x)) A))))
(assert-claim
  (forall ((x T))
    (= (step (step (Star (Atom x)) A) C)
      (step (step (Star (Atom x)) A) B))))
(assert-claim
  (forall ((x T))
    (= (step (step (Star (Atom x)) B) C)
      (step (step (Star (Atom x)) B) A))))
(assert-claim
  (forall ((x T))
    (= (step (step (Star (Atom x)) C) B)
      (step (step (Star (Atom x)) C) A))))
(assert-claim
  (forall ((x T))
    (= (step (step (Star (Atom A)) x) C)
      (step (step (Star (Atom A)) x) B))))
(assert-claim
  (forall ((x T))
    (= (step (step (Star (Atom B)) x) C)
      (step (step (Star (Atom B)) x) A))))
(assert-claim
  (forall ((x T))
    (= (step (step (Star (Atom C)) x) B)
      (step (step (Star (Atom C)) x) A))))
(assert-claim
  (forall ((x T) (y T))
    (= (step (step (Star (Star Eps)) x) A)
      (step (step (Star (Star Eps)) x) y))))
(assert-claim
  (forall ((x T) (y T))
    (= (step (step (Star (Star Nil)) x) A)
      (step (step (Star (Star Nil)) x) y))))
(assert-claim
  (forall ((x T))
    (= (step (|:+:| (Star Eps) (Star Nil)) A)
      (step (|:+:| (Star Eps) (Star Nil)) x))))
(assert-claim
  (forall ((x T))
    (= (step (|:+:| (Star Nil) (Star Eps)) A)
      (step (|:+:| (Star Nil) (Star Eps)) x))))
(assert-claim
  (forall ((x T))
    (= (step (|:>:| Eps (|:+:| Eps Eps)) A)
      (step (|:>:| Eps (|:+:| Eps Eps)) x))))
(assert-claim
  (forall ((x T))
    (= (step (|:>:| Eps (|:+:| Eps Nil)) A)
      (step (|:>:| Eps (|:+:| Eps Nil)) x))))
(assert-claim
  (forall ((x T))
    (= (step (|:>:| Eps (|:+:| Nil Eps)) A)
      (step (|:>:| Eps (|:+:| Nil Eps)) x))))
(assert-claim
  (forall ((x T))
    (= (step (|:>:| Eps (|:+:| Nil Nil)) A)
      (step (|:>:| Eps (|:+:| Nil Nil)) x))))
(assert-claim
  (forall ((x T))
    (= (step (|:>:| (Star Eps) (Star Eps)) A)
      (step (|:>:| (Star Eps) (Star Eps)) x))))
(assert-claim
  (forall ((x T))
    (= (step (|:>:| (Star Eps) (Star Nil)) A)
      (step (|:>:| (Star Eps) (Star Nil)) x))))
(assert-claim
  (forall ((x T))
    (= (step (|:>:| (Star Nil) (Star Eps)) A)
      (step (|:>:| (Star Nil) (Star Eps)) x))))
(assert-claim
  (forall ((x T))
    (= (step (|:>:| (Star Nil) (Star Nil)) A)
      (step (|:>:| (Star Nil) (Star Nil)) x))))
(assert-claim
  (forall ((x T))
    (= (step (Star (|:+:| Eps (Star Eps))) A)
      (step (Star (|:+:| Eps (Star Eps))) x))))
(assert-claim
  (forall ((x T))
    (= (step (Star (|:+:| Eps (Star Nil))) A)
      (step (Star (|:+:| Eps (Star Nil))) x))))
(assert-claim
  (forall ((x T))
    (= (step (Star (|:+:| Nil (Star Eps))) A)
      (step (Star (|:+:| Nil (Star Eps))) x))))
(assert-claim
  (forall ((x T))
    (= (step (Star (|:+:| Nil (Star Nil))) A)
      (step (Star (|:+:| Nil (Star Nil))) x))))
(assert-claim
  (forall ((x T))
    (= (step (Star (|:+:| (Star Eps) Eps)) A)
      (step (Star (|:+:| (Star Eps) Eps)) x))))
(assert-claim
  (forall ((x T))
    (= (step (Star (|:+:| (Star Eps) Nil)) A)
      (step (Star (|:+:| (Star Eps) Nil)) x))))
(assert-claim
  (forall ((x T))
    (= (step (Star (|:+:| (Star Nil) Eps)) A)
      (step (Star (|:+:| (Star Nil) Eps)) x))))
(assert-claim
  (forall ((x T))
    (= (step (Star (|:+:| (Star Nil) Nil)) A)
      (step (Star (|:+:| (Star Nil) Nil)) x))))
