(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T))
  (f2 (proj0f2 T) (proj1f2 T)))))
(assert (exists ((y6289 T) (y6288 T) (y6290 T) (y6284 T) (y6280 T) (y6281 T) (y6282 T) (y6279 T) (y6285 T) (y6286 T) (y6269 T) (y6275 T) (y6274 T) (y6277 T) (y6276 T) (y6271 T) (y6270 T) (y6273 T) (y6272 T)) (forall ((x6296 T) (x6297 T) (x6294 T) (x6295 T) (x6292 T) (x6300 T) (x6298 T) (x6299 T)) 
  (or 
    (and (= x6296 (f1 y6269 (f1 x6296 x6298 x6298) (f1 x6298 x6298 x6298))) (= y6269 (f2 y6270 (f1 x6298 x6298 x6298))) (= y6270 (f1 x6296 x6298 x6298))) 
    (and (= y6271 x6297) (= y6272 (f2 y6273 x6298)) (= y6273 (f1 y6274 (f1 x6298 x6298 x6298) (f1 x6298 x6298 x6298))) (= y6274 (f2 y6275 x6298)) (= y6275 (f1 y6271 x6298 x6298))) (= y6276 (f1 y6276 x6298 x6298)) 
    (and (= y6277 (f2 x6295 (f1 x6298 x6298 x6298))) (= x6295 (f1 y6277 y6277 x6298))) 
    (and (= y6279 (f2 y6280 (f2 x6298 (f2 x6298 x6298)))) (= y6280 (f2 y6281 x6298)) (= y6281 (f1 y6279 y6279 x6298))) (= y6282 x6294) (= x6292 x6300) 
    (and (= y6284 (f1 y6285 (f1 (f1 x6298 x6298 x6298) (f2 x6298 (f1 x6298 x6298 x6298)) x6298) (f1 x6298 x6298 (f1 (f2 x6298 x6298) x6298 (f1 x6298 x6298 x6298))))) (= y6285 (f2 y6286 x6298)) (= y6286 (f1 x6299 y6284 x6298)) (= x6299 (f1 y6284 x6298 x6298))) 
    (and (= y6288 (f1 y6289 x6298 (f2 x6298 x6298))) (= y6289 (f1 y6290 (f2 x6298 x6298) x6298)) (= y6290 (f2 y6288 x6298)))))))
(check-sat)