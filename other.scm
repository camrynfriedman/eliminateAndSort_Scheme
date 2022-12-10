
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