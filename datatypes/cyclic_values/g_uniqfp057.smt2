(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T))
  (f2 (proj0f2 T)))))
(assert (exists ((y6020 T) (y6021 T) (y6022 T) (y6023 T) (y6024 T) (y6025 T) (y6026 T) (y6027 T) (y6028 T) (y6029 T) (y6031 T) (y6030 T) (y6019 T) (y6018 T) (y6015 T) (y6014 T) (y6017 T) (y6016 T)) 
  (or 
    (and (= y6014 (f2 y6016)) (= y6016 (f2 y6017)) (= y6017 (f1 y6014 PLACEHOLDER)) (= y6015 (f2 (f2 (f1 y6015 PLACEHOLDER)))) (distinct y6014 y6015)) 
    (and (= y6018 (f1 y6020 (f2 (f1 PLACEHOLDER PLACEHOLDER)))) (= y6020 (f1 y6021 (f2 (f1 PLACEHOLDER (f2 PLACEHOLDER))))) (= y6021 (f2 y6022)) (= y6022 (f2 y6023)) (= y6023 (f1 y6018 PLACEHOLDER)) (= y6019 (f1 (f1 y6024 (f2 (f1 PLACEHOLDER (f2 PLACEHOLDER)))) (f2 (f1 PLACEHOLDER PLACEHOLDER)))) (= y6024 (f2 y6025)) (= y6025 (f2 y6026)) (= y6026 (f1 y6019 PLACEHOLDER)) (distinct y6018 y6019)) 
    (and (= y6027 (f1 (f2 y6027) PLACEHOLDER)) (= y6028 (f1 y6029 PLACEHOLDER)) (= y6029 (f2 y6028)) (distinct y6027 y6028)) 
    (and (= y6030 (f2 y6030)) (= y6031 (f2 y6031)) (distinct y6030 y6031)))))
(check-sat)
