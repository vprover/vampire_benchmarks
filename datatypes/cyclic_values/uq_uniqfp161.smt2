(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T))
  (f2 (proj0f2 T)))))
(assert (exists ((y17226 T) (y17240 T) (y17229 T) (y17236 T) (y17237 T) (y17235 T) (y17232 T) (y17233 T) (y17230 T) (y17231 T)) (forall ((x17244 T) (x17247 T) (x17250 T) (x17248 T) (x17249 T)) 
  (or 
    (and (= y17226 (f1 (f1 y17226 PLACEHOLDER) (f2 PLACEHOLDER))) (= x17247 (f1 x17250 (f2 PLACEHOLDER))) (= x17250 (f1 x17247 PLACEHOLDER)) (distinct y17226 x17247)) 
    (and (= y17229 (f1 (f2 (f1 y17229 PLACEHOLDER)) PLACEHOLDER)) (= y17230 (f1 y17231 PLACEHOLDER)) (= y17231 (f2 y17232)) (= y17232 (f1 y17230 PLACEHOLDER)) (distinct y17229 y17230)) 
    (and (= y17233 (f2 (f1 (f2 (f2 (f2 y17233))) (f1 (f1 (f1 PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER)) (f2 (f1 PLACEHOLDER PLACEHOLDER)))))) (= x17244 (f2 (f1 y17235 (f1 (f1 (f1 PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER)) (f2 (f1 PLACEHOLDER PLACEHOLDER)))))) (= y17235 (f2 y17236)) (= y17236 (f2 y17237)) (= y17237 (f2 x17244)) (distinct y17233 x17244)) 
    (and (= x17249 (f1 (f1 y17240 PLACEHOLDER) (f2 PLACEHOLDER))) (= y17240 (f2 x17249)) (= x17248 (f1 (f1 (f2 x17248) PLACEHOLDER) (f2 PLACEHOLDER))) (distinct x17249 x17248))))))
(check-sat)
