(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T))
  (f2 (proj0f2 T) (proj1f2 T) (proj2f2 T) (proj3f2 T)))))
(assert (exists ((y4515 T) (y4509 T) (y4508 T) (y4518 T) (y4519 T) (y4505 T) (y4504 T) (y4507 T) (y4506 T) (y4512 T) (y4513 T) (y4510 T) (y4511 T) (y4516 T) (y4517 T) (y4514 T)) 
  (or 
    (and (= y4504 (f1 (f2 y4505 y4504 PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f2 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER))) (= y4505 (f1 y4506 PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y4506 (f2 y4507 PLACEHOLDER PLACEHOLDER (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y4507 (f2 y4504 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y4508 (f2 y4508 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) 
    (and (= y4509 (f1 (f1 (f1 (f2 y4510 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f2 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER)) (f2 PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f2 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f2 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f1 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)))) (f2 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y4510 (f1 y4509 PLACEHOLDER PLACEHOLDER))) 
    (and (= y4511 (f1 (f1 y4512 (f1 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f2 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER)) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER)) (= y4512 (f2 (f1 y4513 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER) PLACEHOLDER (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y4513 (f2 y4511 y4511 PLACEHOLDER PLACEHOLDER))) 
    (and (= y4514 (f2 y4515 (f1 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER)) (= y4515 (f1 y4516 y4514 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y4516 (f1 y4514 PLACEHOLDER PLACEHOLDER))) 
    (and (= y4517 (f2 y4518 y4517 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y4518 (f2 y4517 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y4519 (f1 y4519 PLACEHOLDER PLACEHOLDER)))))
(check-sat)