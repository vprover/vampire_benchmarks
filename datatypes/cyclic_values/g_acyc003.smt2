(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T))
  (f2 (proj0f2 T)))))
(assert (exists ((y444 T) (y458 T) (y459 T) (y449 T) (y448 T) (y447 T) (y455 T) (y445 T) (y457 T) (y450 T) (y442 T) (y441 T) (y440 T) (y452 T) (y439 T) (y453 T) (y463 T) (y462 T) (y464 T) (y465 T) (y454 T) (y443 T) (y466 T) (y461 T) (y460 T) (y438 T) (y446 T) (y437 T) (y456 T) (y451 T)) 
  (or 
    (and (= y437 (f2 y438)) (= y438 (f1 y439 (f2 PLACEHOLDER))) (= y439 (f1 y437 PLACEHOLDER))) 
    (and (= y440 (f1 y441 (f2 (f2 PLACEHOLDER)))) (= y441 (f1 y442 (f1 PLACEHOLDER PLACEHOLDER))) (= y442 (f1 y443 PLACEHOLDER)) (= y443 (f2 y444)) (= y444 (f1 y440 PLACEHOLDER))) 
    (and (= y445 (f2 y446)) (= y446 (f1 y447 (f2 PLACEHOLDER))) (= y447 (f1 y445 PLACEHOLDER))) 
    (and (= y448 (f1 y449 (f1 (f1 PLACEHOLDER PLACEHOLDER) PLACEHOLDER))) (= y449 (f1 y450 (f1 PLACEHOLDER PLACEHOLDER))) (= y450 (f1 y448 PLACEHOLDER))) 
    (and (= y451 (f1 y452 (f1 PLACEHOLDER (f2 PLACEHOLDER)))) (= y452 (f2 y453)) (= y453 (f2 y454)) (= y454 (f2 y451))) 
    (and (= y455 (f1 y456 PLACEHOLDER)) (= y456 (f2 y457)) (= y457 (f2 y455))) (= y458 (f1 (f2 (f2 (f2 (f2 y458)))) (f1 (f1 (f1 (f1 PLACEHOLDER PLACEHOLDER) PLACEHOLDER) (f2 (f2 PLACEHOLDER))) (f1 (f2 (f1 PLACEHOLDER PLACEHOLDER)) (f1 (f1 PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER)))))) 
    (and (= y459 (f1 y460 (f1 PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER)))) (= y460 (f1 y461 PLACEHOLDER)) (= y461 (f2 y462)) (= y462 (f2 y463)) (= y463 (f2 y459))) 
    (and (= y464 (f1 y465 (f1 PLACEHOLDER PLACEHOLDER))) (= y465 (f1 y466 PLACEHOLDER)) (= y466 (f2 y464))))))
(check-sat)
