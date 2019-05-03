(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T))
  (f2 (proj0f2 T) (proj1f2 T) (proj2f2 T) (proj3f2 T))
  (f3 (proj0f3 T))
  (f4 (proj0f4 T) (proj1f4 T) (proj2f4 T)))))
(assert (exists ((y1351 T) (y1350 T) (y1348 T) (y1349 T) (y1344 T) (y1345 T) (y1346 T) (y1347 T) (y1342 T) (y1343 T)) 
  (or 
    (and (= y1342 (f1 y1344)) (= y1344 (f4 y1345 PLACEHOLDER (f1 PLACEHOLDER))) (= y1345 (f3 y1342)) (= y1343 (f1 y1346)) (= y1346 (f4 y1347 PLACEHOLDER (f1 PLACEHOLDER))) (= y1347 (f3 y1343)) (distinct y1342 y1343)) 
    (and (= y1348 (f3 (f2 (f2 y1348 PLACEHOLDER PLACEHOLDER PLACEHOLDER) y1348 PLACEHOLDER PLACEHOLDER))) (= y1349 (f3 y1350)) (= y1350 (f2 y1351 y1349 PLACEHOLDER PLACEHOLDER)) (= y1351 (f2 y1349 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (distinct y1348 y1349)))))
(check-sat)
