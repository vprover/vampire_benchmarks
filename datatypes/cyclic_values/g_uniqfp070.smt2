(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T))
  (f2 (proj0f2 T) (proj1f2 T) (proj2f2 T))
  (f3 (proj0f3 T) (proj1f3 T) (proj2f3 T) (proj3f3 T)))))
(assert (exists ((y7449 T) (y7448 T) (y7441 T) (y7440 T) (y7451 T) (y7428 T) (y7445 T) (y7444 T) (y7447 T) (y7446 T) (y7431 T) (y7471 T) (y7456 T) (y7470 T) (y7452 T) (y7472 T) (y7473 T) (y7474 T) (y7475 T) (y7429 T) (y7453 T) (y7478 T) (y7479 T) (y7476 T) (y7450 T) (y7458 T) (y7459 T) (y7438 T) (y7439 T) (y7434 T) (y7435 T) (y7436 T) (y7437 T) (y7430 T) (y7457 T) (y7432 T) (y7455 T) (y7483 T) (y7454 T) (y7477 T) (y7443 T) (y7433 T) (y7467 T) (y7466 T) (y7465 T) (y7464 T) (y7463 T) (y7462 T) (y7461 T) (y7460 T) (y7442 T) (y7482 T) (y7481 T) (y7480 T) (y7469 T) (y7468 T)) 
  (or 
    (and (= y7428 (f2 (f3 (f1 (f3 y7428 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER) PLACEHOLDER (f1 (f1 PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f1 PLACEHOLDER PLACEHOLDER)) y7428 (f3 (f3 (f1 PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)) PLACEHOLDER (f2 PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER) PLACEHOLDER) (f1 (f1 PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER))))) (= y7429 (f2 y7430 y7429 (f3 (f3 (f1 PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)) PLACEHOLDER (f2 PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER) PLACEHOLDER) (f1 (f1 PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER))))) (= y7430 (f3 y7431 PLACEHOLDER (f1 (f1 PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f1 PLACEHOLDER PLACEHOLDER))) (= y7431 (f1 y7432 PLACEHOLDER)) (= y7432 (f3 y7429 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (distinct y7428 y7429)) 
    (and (= y7433 (f1 y7435 (f1 (f1 PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER)))) (= y7435 (f2 y7436 PLACEHOLDER PLACEHOLDER)) (= y7436 (f3 y7433 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (= y7434 (f1 (f2 (f3 y7434 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER PLACEHOLDER) (f1 (f1 PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER)))) (distinct y7433 y7434)) 
    (and (= y7437 (f2 (f3 y7439 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f2 (f1 PLACEHOLDER PLACEHOLDER) (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f1 PLACEHOLDER (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER))) PLACEHOLDER (f1 (f1 PLACEHOLDER (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f3 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER))))) (= y7439 (f2 (f2 y7440 PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER)) PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER))) (= y7440 (f3 y7437 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (= y7438 (f2 (f3 (f2 (f2 (f3 y7438 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER)) PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER)) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f2 (f1 PLACEHOLDER PLACEHOLDER) (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f1 PLACEHOLDER (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER))) PLACEHOLDER (f1 (f1 PLACEHOLDER (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f3 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER))))) (distinct y7437 y7438)) 
    (and (= y7441 (f1 (f3 (f3 y7443 PLACEHOLDER PLACEHOLDER (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER PLACEHOLDER) (f2 (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER PLACEHOLDER))) (= y7443 (f2 y7441 PLACEHOLDER PLACEHOLDER)) (= y7442 (f1 y7444 (f2 (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER PLACEHOLDER))) (= y7444 (f3 y7445 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER PLACEHOLDER)) (= y7445 (f3 y7446 PLACEHOLDER PLACEHOLDER (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y7446 (f2 y7442 PLACEHOLDER PLACEHOLDER)) (distinct y7441 y7442)) 
    (and (= y7447 (f1 y7449 (f1 (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)))) (= y7449 (f1 y7450 (f1 PLACEHOLDER PLACEHOLDER))) (= y7450 (f3 y7447 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (= y7448 (f1 y7451 (f1 (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)))) (= y7451 (f1 y7452 (f1 PLACEHOLDER PLACEHOLDER))) (= y7452 (f3 y7448 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (distinct y7447 y7448)) 
    (and (= y7453 (f1 y7455 (f2 PLACEHOLDER PLACEHOLDER (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)))) (= y7455 (f3 (f1 (f2 (f3 y7453 PLACEHOLDER y7453 PLACEHOLDER) PLACEHOLDER PLACEHOLDER) (f3 (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER) (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER))) y7456 (f2 (f1 PLACEHOLDER PLACEHOLDER) PLACEHOLDER PLACEHOLDER) (f3 PLACEHOLDER (f2 (f1 PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER) PLACEHOLDER) PLACEHOLDER (f1 (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER))))) (= y7456 (f2 y7457 (f2 (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f2 PLACEHOLDER (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER)))) (= y7457 (f3 y7458 PLACEHOLDER (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER)) (= y7458 (f3 y7453 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (= y7454 (f1 y7459 (f2 PLACEHOLDER PLACEHOLDER (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)))) (= y7459 (f3 (f1 (f2 (f3 y7454 PLACEHOLDER y7454 PLACEHOLDER) PLACEHOLDER PLACEHOLDER) (f3 (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER) (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER))) y7460 (f2 (f1 PLACEHOLDER PLACEHOLDER) PLACEHOLDER PLACEHOLDER) (f3 PLACEHOLDER (f2 (f1 PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER) PLACEHOLDER) PLACEHOLDER (f1 (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER))))) (= y7460 (f2 y7461 (f2 (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f2 PLACEHOLDER (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER)))) (= y7461 (f3 y7462 PLACEHOLDER (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER)) (= y7462 (f3 y7454 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (distinct y7453 y7454)) 
    (and (= y7463 (f1 y7465 (f3 PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER) (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)))) (= y7465 (f2 y7463 y7466 (f3 PLACEHOLDER (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER)))) (= y7466 (f3 y7467 y7463 (f1 PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y7467 (f3 y7463 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (= y7464 (f1 (f2 y7464 (f3 (f3 y7464 PLACEHOLDER PLACEHOLDER PLACEHOLDER) y7464 (f1 PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f3 PLACEHOLDER (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (f3 PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER) (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)))) (distinct y7463 y7464)) 
    (and (= y7468 (f3 (f1 (f3 y7468 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER) y7470 (f3 (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f1 PLACEHOLDER PLACEHOLDER))) (= y7470 (f3 y7471 (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y7471 (f2 y7468 PLACEHOLDER PLACEHOLDER)) (= y7469 (f3 (f1 (f3 y7469 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER) (f3 y7472 (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f3 (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f1 PLACEHOLDER PLACEHOLDER))) (= y7472 (f2 y7469 PLACEHOLDER PLACEHOLDER)) (distinct y7468 y7469)) 
    (and (= y7473 (f2 y7475 PLACEHOLDER (f3 (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y7475 (f2 y7476 (f1 PLACEHOLDER PLACEHOLDER) PLACEHOLDER)) (= y7476 (f1 y7477 (f1 PLACEHOLDER PLACEHOLDER))) (= y7477 (f2 y7478 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER)) (= y7478 (f2 y7473 PLACEHOLDER PLACEHOLDER)) (= y7474 (f2 (f2 (f1 (f2 y7479 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER)) (f1 PLACEHOLDER PLACEHOLDER) PLACEHOLDER) PLACEHOLDER (f3 (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y7479 (f2 y7474 PLACEHOLDER PLACEHOLDER)) (distinct y7473 y7474)) 
    (and (= y7480 (f1 y7482 (f1 PLACEHOLDER PLACEHOLDER))) (= y7482 (f2 y7480 PLACEHOLDER PLACEHOLDER)) (= y7481 (f1 y7483 (f1 PLACEHOLDER PLACEHOLDER))) (= y7483 (f2 y7481 PLACEHOLDER PLACEHOLDER)) (distinct y7480 y7481)))))
(check-sat)
