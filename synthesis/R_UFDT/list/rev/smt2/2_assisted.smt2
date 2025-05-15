(set-logic UFDT)

(declare-datatype nat ((s (s0 nat)) (zero)))
(declare-datatype lst ((nil) (cons (cons0 nat) (cons1 lst))))

(define-fun-rec app ((x lst) (y lst)) lst
  (match x ((nil y)
            ((cons x0 x1) (cons x0 (app x1 y))))))

(define-fun-rec rev ((x lst)) lst
  (match x ((nil nil)
            ((cons x0 x1) (app (rev x1) (cons x0 nil))))))

;LEMMAS
(assert-claim (forall ((x lst)) (= (app x nil) x)))
(assert-claim (forall ((x lst) (y lst) (z lst)) (= (app (app x y) z) (app x (app y z)))))
(assert-claim (forall ((x0 nat) (x1 lst)) (= (rev (app x1 (cons x0 nil))) (app (cons x0 nil) (rev x1)))))

; SPECIFICATION
(assert-synth ((x lst)) ((y lst)) (= y (rev (rev x))))

(set-option :uncomputable (rev))


