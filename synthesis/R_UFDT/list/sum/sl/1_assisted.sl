(set-logic UFDT)
(set-feature :recursion true)

(declare-datatype nat ((s (s0 nat)) (zero)))
(declare-datatype lst ((nil) (cons (cons0 nat) (cons1 lst))))

(declare-var x nat)

(define-fun-rec add ((x nat) (y nat)) nat (match y ((zero x) ((s y0) (s (add x y0))))))

(define-fun-rec mult ((x nat) (y nat)) nat (match y ((zero zero) ((s y0) (add (mult x y0) x)))))

(define-fun-rec half ((x nat)) nat (match x ((zero zero) ((s x0) (match x0 ((zero zero) ((s x1) (s (half x1)))))))))

(define-fun-rec sum ((x lst)) nat (match x ((nil zero) ((cons x0 x1) (add (sum x1) x0)))))

(assume (forall ((n nat)) (= (half (mult (s n) (s (s n)))) (add (half (mult n (s n))) (s n)))))

(synth-fun fy ((x nat)) lst)

(constraint (= (sum (fy x)) (half (mult x (s x)))))

(check-synth)
