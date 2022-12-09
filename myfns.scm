; CSE 3341 Scheme Project
; @author Camryn Friedman 12/9/22

#|
Problem: Write a function, eliminateNSort[], that takes two parameters, L1 and L2,
both of which are lists of integers, and returns a list, L, that is sorted and
has all the elements of L1 except those that are in L2.
|#

 ; -------------------------------------------------

#|
    PSEUDOCODE FOR CUT1:
    cut1[x, L]::
        [ null? [L] -> L;
        | =[x, car[L]] -> cut1[x, cdr[L]];
        | #t -> cons[car[L], cut1[x, cdr[L]]];
        ]
|#
;Functionality: removes element x from L
(define (cut1 x L)
    (cond 
        ((null? L) L)
        ((= x (car L)) (cut1 x (cdr L)))
        (#t (cons (car L) (cut1 x (cdr L))))
    )
)

#|
    PSEUDOCODE FOR eliminate:
    eliminate[L1, L2]::
        [ null?[L2] -> L1
        | #t -> eliminate[cut1[car[L2], L1];, cdr[L2]]
        ]
|#
;Functionality: removes all elements of L1 that are in L2
(define (eliminate L1 L2)
    (cond
        ((null? L2) L1) ;if L2 is empty, nothing to remove so return L1
        ;check if first element of L1 is in L2. if so, remove from L1 and call recursively
        (#t (eliminate (cut1 (car L2) L1) (cdr L2)))
    )
)

#|
    PSEUDOCODE FOR qkSort:
    qkSort[L]::
        [ <[length[L], 2] -> L;
        | #t -> join[qkSort[lesser[car[L], cdr[L]]], car[L], qkSort[gEq[car[L], cdr[L]]]];
        ]
 |#
 ; Functionality: Employs the quickSort algorithm on a list 
(define (qkSort L)
    (cond (<((listLength L) 2) L)
        ;concatenates
        (#t (join (qkSort <((car L) (cdr L))) (car L) (qkSort >=((car L) (cdr L)))))
    )
)

#|
    PSEUDOCODE FOR listLength:
    listLength[L]::
        [ null?[L] -> 0
        | #t -> +[1, length[cdr[L]]];
        ]
|#
; Functionality: helper function for qkSort. returns the length of the list.
(define (listLength L)
    (cond 
        ((null? L) 0)
        (#t (+ 1(length (cdr L))))
    )
)

 ; L is list of all elements of the given list that are less than x.
 ; x is first element of the given list
 ; M is the list of all elements of the given list that are greater than or equal to x.
(define (join L x M)
    ; if L1 is empty, return L2
    (cond 
        ((null? L) M)
        (#t (cons(car L) (join (cdr L) M)))
    )
)


 ; MAIN FUNCTION
(define (eliminateNsort L1 L2)
    ; body
    ; look through L1 and get all the elements that are also in L2
    ; 
    )
