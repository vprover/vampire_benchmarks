(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T)))))
(assert (exists ((y227 T) (y226 T) (y225 T) (y224 T) (y223 T) (y222 T) (y221 T) (y220 T)) 
  (or 
    (and (= y220 (f1 y221 (f1 (f1 PLACEHOLDER PLACEHOLDER) (f1 (f1 PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER))))) (= y221 (f1 y222 (f1 (f1 PLACEHOLDER PLACEHOLDER) PLACEHOLDER))) (= y222 (f1 y223 (f1 PLACEHOLDER PLACEHOLDER))) (= y223 (f1 y220 PLACEHOLDER))) 
    (and (= y224 (f1 y225 PLACEHOLDER)) (= y225 (f1 y224 PLACEHOLDER))) 
    (and (= y226 (f1 y227 PLACEHOLDER)) (= y227 (f1 y226 PLACEHOLDER))))))
(check-sat)
