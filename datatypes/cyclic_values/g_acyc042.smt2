(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T)))))
(assert (exists ((y4419 T) (y4418 T) (y4413 T) (y4412 T) (y4411 T) (y4410 T) (y4417 T) (y4416 T) (y4415 T) (y4414 T) (y4404 T) (y4405 T) (y4406 T) (y4407 T) (y4420 T) (y4403 T) (y4421 T) (y4408 T) (y4409 T)) 
  (or (= y4403 (f1 (f1 (f1 (f1 (f1 y4403 PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f1 y4403 y4403 PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER) PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) 
    (and (= y4404 (f1 y4405 (f1 PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y4405 (f1 y4406 PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y4406 (f1 y4404 PLACEHOLDER PLACEHOLDER))) 
    (and (= y4407 (f1 y4408 PLACEHOLDER (f1 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER)))) (= y4408 (f1 y4409 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER)) (= y4409 (f1 y4407 PLACEHOLDER PLACEHOLDER))) 
    (and (= y4410 (f1 y4411 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y4411 (f1 y4410 y4410 PLACEHOLDER))) 
    (and (= y4412 (f1 y4413 (f1 PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y4413 (f1 y4412 y4414 PLACEHOLDER)) (= y4414 (f1 y4412 PLACEHOLDER PLACEHOLDER))) (= y4415 (f1 y4415 y4415 PLACEHOLDER)) 
    (and (= y4416 (f1 y4417 PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y4417 (f1 y4418 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y4418 (f1 y4416 y4416 PLACEHOLDER))) 
    (and (= y4419 (f1 y4420 (f1 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) PLACEHOLDER)) (= y4420 (f1 y4421 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y4421 (f1 y4419 y4419 PLACEHOLDER))))))
(check-sat)
