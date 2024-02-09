(set-logic UFDT)

; TYPE OF NATURAL NUMBERS
(declare-datatypes ((nat 0)) (((zero) (s (s0 nat)))))

(declare-fun half (nat) nat)

; HALF AXIOMS
(assert (= (half zero) zero))
(assert (= (half (s zero)) zero))
(assert (forall ((x nat)) (= (half (s (s x))) (s (half x)))))

; SPECIFICATION
(assert-not (forall ((x nat)) (exists ((y nat)) (= (half y) x))))

(check-sat)
