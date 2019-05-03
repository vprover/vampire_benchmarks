(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T))
  (f2 (proj0f2 T) (proj1f2 T) (proj2f2 T) (proj3f2 T))
  (f3 (proj0f3 T)))))
(assert (exists ((y4314 T) (y4309 T) (y4310 T) (y4311 T) (y4312 T) (y4313 T)) 
  (or 
    (and (= y4309 (f3 y4310)) (= y4310 (f2 y4311 PLACEHOLDER PLACEHOLDER (f3 PLACEHOLDER))) (= y4311 (f1 y4312 PLACEHOLDER)) (= y4312 (f3 y4313)) (= y4313 (f1 y4309 PLACEHOLDER))) (= y4314 (f2 (f1 (f1 y4314 PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)) PLACEHOLDER (f3 (f2 y4314 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f1 (f3 PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER)))))))
(check-sat)
