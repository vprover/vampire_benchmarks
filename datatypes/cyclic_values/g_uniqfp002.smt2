(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T))
  (f2 (proj0f2 T) (proj1f2 T) (proj2f2 T))
  (f3 (proj0f3 T)))))
(assert (exists ((y236 T) (y237 T) (y235 T) (y230 T) (y233 T) (y231 T) (y234 T) (y218 T) (y219 T) (y232 T) (y229 T) (y228 T) (y227 T) (y226 T) (y225 T) (y224 T) (y223 T) (y222 T) (y221 T) (y220 T)) 
  (or 
    (and (= y218 (f2 y220 (f1 (f1 (f1 PLACEHOLDER))) (f2 (f1 PLACEHOLDER) (f1 PLACEHOLDER) PLACEHOLDER))) (= y220 (f1 y221)) (= y221 (f1 y222)) (= y222 (f2 y218 PLACEHOLDER PLACEHOLDER)) (= y219 (f2 y223 (f1 (f1 (f1 PLACEHOLDER))) (f2 (f1 PLACEHOLDER) (f1 PLACEHOLDER) PLACEHOLDER))) (= y223 (f1 y224)) (= y224 (f1 y225)) (= y225 (f2 y219 PLACEHOLDER PLACEHOLDER)) (distinct y218 y219)) 
    (and (= y226 (f1 y228)) (= y228 (f2 y229 (f1 (f3 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (f1 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER)))) (= y229 (f3 y230)) (= y230 (f2 y231 y226 PLACEHOLDER)) (= y231 (f1 y226)) (= y227 (f1 (f2 (f3 (f2 y232 y227 PLACEHOLDER)) (f1 (f3 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (f1 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER))))) (= y232 (f1 y227)) (distinct y226 y227)) 
    (and (= y233 (f1 (f2 (f1 y235) PLACEHOLDER PLACEHOLDER))) (= y235 (f2 y233 y233 PLACEHOLDER)) (= y234 (f1 (f2 y236 PLACEHOLDER PLACEHOLDER))) (= y236 (f1 y237)) (= y237 (f2 y234 y234 PLACEHOLDER)) (distinct y233 y234)))))
(check-sat)
