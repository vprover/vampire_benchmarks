(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T) (proj3f1 T))
  (f2 (proj0f2 T))
  (f3 (proj0f3 T) (proj1f3 T) (proj2f3 T) (proj3f3 T))
  (f4 (proj0f4 T) (proj1f4 T) (proj2f4 T) (proj3f4 T)))))
(assert (exists ((y1399 T) (y1398 T) (y1396 T) (y1395 T) (y1394 T) (y1393 T) (y1392 T) (y1391 T) (y1390 T) (y1409 T) (y1408 T) (y1407 T) (y1406 T) (y1405 T) (y1404 T) (y1402 T) (y1400 T) (y1375 T) (y1377 T) (y1376 T) (y1371 T) (y1370 T) (y1373 T) (y1372 T) (y1379 T) (y1378 T) (y1388 T) (y1389 T) (y1380 T) (y1381 T) (y1382 T) (y1383 T) (y1384 T) (y1385 T) (y1386 T) (y1410 T) (y1411 T) (y1413 T) (y1414 T) (y1415 T) (y1416 T) (y1417 T) (y1366 T) (y1367 T) (y1368 T) (y1369 T)) (forall ((x1421 T) (x1420 T) (x1418 T) (x1422 T) (x1423 T) (x1424 T) (x1425 T) (x1426 T) (x1427 T)) 
  (or 
    (and (= y1366 (f3 (f1 (f3 (f4 y1368 (f4 x1426 x1426 x1426 x1426) x1426 (f2 x1426)) (f2 x1426) (f1 x1426 x1426 x1426 x1426) (f1 x1426 (f2 x1426) (f3 x1426 x1426 x1426 x1426) (f2 x1426))) (f1 x1426 (f2 x1426) (f1 x1426 x1426 x1426 x1426) (f1 x1426 x1426 x1426 x1426)) (f3 x1426 (f2 x1426) x1426 (f2 x1426)) (f3 x1426 x1426 x1426 x1426)) (f1 x1426 x1426 x1426 x1426) (f4 x1426 x1426 (f2 x1426) (f1 x1426 x1426 x1426 x1426)) (f4 x1426 x1426 x1426 x1426))) (= y1368 (f1 y1366 x1426 x1426 x1426)) (= y1367 (f3 y1369 (f1 x1426 x1426 x1426 x1426) (f4 x1426 x1426 (f2 x1426) (f1 x1426 x1426 x1426 x1426)) (f4 x1426 x1426 x1426 x1426))) (= y1369 (f1 y1370 (f1 x1426 (f2 x1426) (f1 x1426 x1426 x1426 x1426) (f1 x1426 x1426 x1426 x1426)) (f3 x1426 (f2 x1426) x1426 (f2 x1426)) (f3 x1426 x1426 x1426 x1426))) (= y1370 (f3 y1371 (f2 x1426) (f1 x1426 x1426 x1426 x1426) (f1 x1426 (f2 x1426) (f3 x1426 x1426 x1426 x1426) (f2 x1426)))) (= y1371 (f4 y1372 (f4 x1426 x1426 x1426 x1426) x1426 (f2 x1426))) (= y1372 (f1 y1367 x1426 x1426 x1426)) (distinct y1366 y1367)) 
    (and (= y1373 (f1 y1373 x1426 y1373 x1426)) (= x1420 (f1 x1420 x1426 x1420 x1426)) (distinct y1373 x1420)) 
    (and (= y1375 (f4 y1377 (f3 (f2 x1426) x1426 x1426 x1426) (f2 x1426) (f1 (f2 x1426) x1426 (f2 x1426) x1426))) (= y1377 (f1 y1378 x1426 x1426 x1426)) (= y1378 (f4 y1379 (f3 x1426 x1426 x1426 x1426) x1426 (f4 x1426 x1426 x1426 x1426))) (= y1379 (f4 y1375 x1426 x1426 x1426)) (= y1376 (f4 y1380 (f3 (f2 x1426) x1426 x1426 x1426) (f2 x1426) (f1 (f2 x1426) x1426 (f2 x1426) x1426))) (= y1380 (f1 y1381 x1426 x1426 x1426)) (= y1381 (f4 y1382 (f3 x1426 x1426 x1426 x1426) x1426 (f4 x1426 x1426 x1426 x1426))) (= y1382 (f4 y1376 x1426 x1426 x1426)) (distinct y1375 y1376)) 
    (and (= y1383 (f1 (f4 y1385 x1426 (f1 (f4 x1426 x1426 x1426 x1426) x1426 (f3 x1426 x1426 x1426 x1426) x1426) (f1 (f1 (f1 x1426 x1426 x1426 x1426) x1426 (f2 x1426) x1426) (f1 x1426 x1426 x1426 x1426) (f2 (f1 x1426 x1426 x1426 x1426)) x1426)) (f4 (f3 y1383 x1426 x1426 x1426) y1383 x1426 (f4 x1426 x1426 x1426 x1426)) (f3 x1426 x1426 x1426 x1426) (f1 (f4 x1426 (f2 x1426) x1426 x1426) (f4 (f4 x1426 x1426 x1426 x1426) (f3 x1426 x1426 x1426 x1426) (f4 x1426 x1426 x1426 x1426) x1426) (f1 (f1 x1426 (f4 x1426 x1426 x1426 x1426) x1426 x1426) (f1 x1426 x1426 x1426 (f2 x1426)) x1426 (f3 (f4 x1426 x1426 x1426 x1426) x1426 (f4 x1426 x1426 x1426 x1426) (f1 x1426 x1426 x1426 x1426))) (f4 x1426 x1426 x1426 x1426)))) (= y1385 (f4 y1386 x1426 x1426 (f2 x1426))) (= y1386 (f3 x1423 (f4 x1426 x1426 x1426 x1426) x1426 (f2 x1426))) (= x1423 (f4 y1383 x1426 x1426 x1426)) (= y1384 (f1 (f4 y1388 x1426 (f1 (f4 x1426 x1426 x1426 x1426) x1426 (f3 x1426 x1426 x1426 x1426) x1426) (f1 (f1 (f1 x1426 x1426 x1426 x1426) x1426 (f2 x1426) x1426) (f1 x1426 x1426 x1426 x1426) (f2 (f1 x1426 x1426 x1426 x1426)) x1426)) (f4 (f3 y1384 x1426 x1426 x1426) y1384 x1426 (f4 x1426 x1426 x1426 x1426)) (f3 x1426 x1426 x1426 x1426) (f1 (f4 x1426 (f2 x1426) x1426 x1426) (f4 (f4 x1426 x1426 x1426 x1426) (f3 x1426 x1426 x1426 x1426) (f4 x1426 x1426 x1426 x1426) x1426) (f1 (f1 x1426 (f4 x1426 x1426 x1426 x1426) x1426 x1426) (f1 x1426 x1426 x1426 (f2 x1426)) x1426 (f3 (f4 x1426 x1426 x1426 x1426) x1426 (f4 x1426 x1426 x1426 x1426) (f1 x1426 x1426 x1426 x1426))) (f4 x1426 x1426 x1426 x1426)))) (= y1388 (f4 y1389 x1426 x1426 (f2 x1426))) (= y1389 (f3 y1390 (f4 x1426 x1426 x1426 x1426) x1426 (f2 x1426))) (= y1390 (f4 y1384 x1426 x1426 x1426)) (distinct y1383 y1384)) 
    (and (= y1391 (f1 y1393 x1426 (f2 (f2 x1426)) x1426)) (= y1393 (f1 y1394 x1426 (f4 x1426 x1426 (f1 (f3 x1426 x1426 x1426 x1426) x1426 (f2 x1426) x1426) x1426) (f3 x1426 x1426 (f2 x1426) (f2 x1426)))) (= y1394 (f1 y1395 (f4 x1426 x1426 x1426 x1426) (f3 x1426 (f2 x1426) (f2 x1426) (f2 x1426)) (f2 (f4 x1426 x1426 x1426 x1426)))) (= y1395 (f3 y1396 (f4 x1426 x1426 x1426 x1426) (f4 x1426 x1426 x1426 x1426) x1426)) (= y1396 (f3 y1391 x1426 x1426 x1426)) (= y1392 (f1 x1425 x1426 (f2 (f2 x1426)) x1426)) (= x1425 (f1 y1398 x1426 (f4 x1426 x1426 (f1 (f3 x1426 x1426 x1426 x1426) x1426 (f2 x1426) x1426) x1426) (f3 x1426 x1426 (f2 x1426) (f2 x1426)))) (= y1398 (f1 y1399 (f4 x1426 x1426 x1426 x1426) (f3 x1426 (f2 x1426) (f2 x1426) (f2 x1426)) (f2 (f4 x1426 x1426 x1426 x1426)))) (= y1399 (f3 y1400 (f4 x1426 x1426 x1426 x1426) (f4 x1426 x1426 x1426 x1426) x1426)) (= y1400 (f3 y1392 x1426 x1426 x1426)) (distinct y1391 y1392)) 
    (and (= x1421 (f2 x1421)) (= y1402 (f2 y1402)) (distinct x1421 y1402)) 
    (and (= x1427 (f2 x1427)) (= y1404 (f2 y1404)) (distinct x1427 y1404)) 
    (and (= y1405 x1424) (= y1407 (f1 (f1 (f2 y1405) x1426 (f2 x1426) (f2 x1426)) y1408 (f4 (f1 x1426 x1426 x1426 x1426) x1426 x1426 (f2 x1426)) x1426)) (= y1408 (f4 y1409 x1426 (f1 x1426 x1426 x1426 x1426) (f4 x1426 x1426 x1426 x1426))) (= y1409 (f3 y1405 x1426 y1405 x1426)) (= y1406 (f2 y1410)) (= y1410 (f1 (f1 (f2 y1406) x1426 (f2 x1426) (f2 x1426)) y1411 (f4 (f1 x1426 x1426 x1426 x1426) x1426 x1426 (f2 x1426)) x1426)) (= y1411 (f4 x1422 x1426 (f1 x1426 x1426 x1426 x1426) (f4 x1426 x1426 x1426 x1426))) (= x1422 (f3 y1406 x1426 y1406 x1426)) (distinct y1405 y1406)) 
    (and (= y1413 (f4 (f4 (f4 (f2 y1413) x1426 x1426 x1426) x1426 x1418 x1426) x1426 x1426 (f3 x1426 x1426 x1426 x1426))) (= y1414 (f4 y1415 x1426 x1426 (f3 x1426 x1426 x1426 x1426))) (= y1415 (f4 y1416 x1426 x1418 x1426)) (= y1416 (f4 y1417 x1426 x1426 x1426)) (= y1417 (f2 y1414)) (distinct y1413 y1414))))))
(check-sat)