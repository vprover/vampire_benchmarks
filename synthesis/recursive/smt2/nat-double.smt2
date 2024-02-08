(set-logic UFDT)

; type of natural numbers
(declare-datatypes ((nat 0)) (((zero) (s (s0 nat)))))

(declare-fun half (nat) nat)

(assert (= (half zero) zero))
(assert (= (half (s zero)) zero))
(assert (forall ((x nat)) (= (half (s (s x))) (s (half x)))))

(assert-not (forall ((x nat)) (exists ((y nat)) (= (half y) x))))

(check-sat)
