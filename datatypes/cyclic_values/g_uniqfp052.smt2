(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T))
  (f2 (proj0f2 T)))))
(assert (exists ((y5528 T) (y5529 T) (y5545 T) (y5539 T) (y5538 T) (y5537 T) (y5536 T) (y5535 T) (y5534 T) (y5533 T) (y5532 T) (y5531 T) (y5527 T) (y5546 T) (y5544 T) (y5530 T) (y5542 T) (y5543 T) (y5540 T) (y5541 T)) 
  (or 
    (and (= y5527 (f2 y5529)) (= y5529 (f2 y5527)) (= y5528 (f2 y5530)) (= y5530 (f2 y5528)) (distinct y5527 y5528)) 
    (and (= y5531 (f1 y5533 PLACEHOLDER)) (= y5533 (f2 y5534)) (= y5534 (f1 y5535 PLACEHOLDER)) (= y5535 (f2 y5531)) (= y5532 (f1 (f2 (f1 y5536 PLACEHOLDER)) PLACEHOLDER)) (= y5536 (f2 y5532)) (distinct y5531 y5532)) 
    (and (= y5537 (f1 (f2 (f1 y5537 PLACEHOLDER)) (f2 PLACEHOLDER))) (= y5538 (f1 y5539 (f2 PLACEHOLDER))) (= y5539 (f2 y5540)) (= y5540 (f1 y5538 PLACEHOLDER)) (distinct y5537 y5538)) 
    (and (= y5541 (f1 y5541 PLACEHOLDER)) (= y5542 (f1 y5542 PLACEHOLDER)) (distinct y5541 y5542)) 
    (and (= y5543 (f1 (f2 (f2 y5543)) (f1 (f1 PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER)))) (= y5544 (f1 y5545 (f1 (f1 PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER)))) (= y5545 (f2 y5546)) (= y5546 (f2 y5544)) (distinct y5543 y5544)))))
(check-sat)
