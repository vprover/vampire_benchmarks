(set-logic UFDT)

(declare-datatypes ((nat 0)) (((succ (dec nat)) (zero))))

(declare-fun plus (nat nat) nat)
(assert (forall ((x nat)) (= (plus zero x) x))) 
(assert (forall ((x nat)(y nat)) (= (plus (succ x) y) (succ (plus x y)))))

(assert-not (forall ((x nat) (y nat) (z nat)) (exists ((u nat)) (= (plus (plus x y) z) (plus x u)))))
