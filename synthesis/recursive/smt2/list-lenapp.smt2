(set-info :smt-lib-version 2.6)
(set-logic UFDT)
(set-info :category "crafted")
(declare-datatypes ((nat 0) (lst 0)) (((s (s0 nat)) (zero)) ((nil) (cons (cons0 nat) (cons1 lst)))))
(declare-fun app (lst lst) lst)
(declare-fun len (lst) nat)

(assert (forall ((a nat) (l lst) (r lst)) (= (app (cons a l) r) (cons a (app l r)))))
(assert (forall ((e nat) (l lst)) (= (len (cons e l)) (s (len l)))))
(assert (forall ((x lst)) (= (len (app nil x)) (len x))))

(assert-not (forall ((x lst) (y lst)) (exists ((z nat)) (= z (len (app x y))))))

(set-option :uncomputable (app))
(check-sat)
