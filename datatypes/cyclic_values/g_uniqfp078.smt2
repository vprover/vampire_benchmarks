(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T))
  (f2 (proj0f2 T))
  (f3 (proj0f3 T) (proj1f3 T) (proj2f3 T))
  (f4 (proj0f4 T) (proj1f4 T) (proj2f4 T) (proj3f4 T)))))
(assert (exists ((y8390 T) (y8391 T) (y8392 T) (y8393 T) (y8394 T) (y8395 T) (y8396 T) (y8397 T) (y8398 T) (y8399 T) (y8389 T) (y8400 T) (y8401 T) (y8402 T) (y8403 T) (y8404 T)) 
  (or 
    (and (= y8389 (f2 y8391)) (= y8391 (f2 y8392)) (= y8392 (f2 y8393)) (= y8393 (f4 y8389 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (= y8390 (f2 y8394)) (= y8394 (f2 y8395)) (= y8395 (f2 y8396)) (= y8396 (f4 y8390 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (distinct y8389 y8390)) 
    (and (= y8397 (f4 y8399 PLACEHOLDER (f4 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y8399 (f1 y8400 PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y8400 (f1 y8401 PLACEHOLDER PLACEHOLDER)) (= y8401 (f1 y8397 y8397 PLACEHOLDER)) (= y8398 (f4 y8402 PLACEHOLDER (f4 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y8402 (f1 y8403 PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y8403 (f1 y8404 PLACEHOLDER PLACEHOLDER)) (= y8404 (f1 y8398 y8398 PLACEHOLDER)) (distinct y8397 y8398)))))
(check-sat)