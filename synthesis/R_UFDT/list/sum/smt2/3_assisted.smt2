(set-logic UFDT)

(declare-datatype nat ((s (s0 nat)) (zero)))
(declare-datatype lst ((nil) (cons (cons0 nat) (cons1 lst))))

(define-fun-rec add ((x nat) (y nat)) nat
  (match y ((zero x)
           ((s y0) (s (add x y0))))))

(define-fun-rec mult ((x nat) (y nat)) nat
  (match y ((zero zero)
           ((s y0) (add (mult x y0) x)))))

(define-fun-rec double ((x nat)) nat
  (match x ((zero zero)     
           ((s x0) (s (s (double x0)))))))

(define-fun-rec sum ((x lst)) nat
  (match x ((nil zero) 
           ((cons x0 x1) (add (sum x1) x0)))))

; LEMMA
(assert-claim (forall ((n nat)) (= (mult (s n) (s n)) (add (mult n n) (s (double n))))))

; SPECIFICATION
(assert-synth ((x nat)) ((y lst)) (= (sum y) (mult x x)))



