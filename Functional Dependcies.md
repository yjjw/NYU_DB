Procedure to find minimal set

1. Put the FDs in Standard Form

   e.g. A -> BC => A->B and A->C

2. Remove the redundant FD's

   e.g. {A->B, B->C, A->C} => {A->B, B->C}

3.  Minimize LHS of each FD

   A can be deleted if B+ contains A

   B can be deleted if A+ contains B

   if there was any removal of variables in step3, repeat 2

   eg F: {AB->C, A->B}

   A+ = ABC, B+ = B

   Therefore, we get {A->C, A->B}

   

   e.g. {A->C, AC->D, E->AD, E->H}

   perform step1: {A->C, AC->D, E->A, E->D, E->H}

   perform step2: {A->C, AC->D, E->A, E->H}

   perform step3: A+ = ACD, C+ = CD we get {A->C, A->D, E->A, E->H}

   

   

