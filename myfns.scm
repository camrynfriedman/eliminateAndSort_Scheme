; CSE 3341 Scheme Project
; @author Camryn Friedman 12/9/22

#|
Problem: Write a function, eliminateNSort[], that takes two parameters, L1 and L2,
both of which are lists of integers, and returns a list, L, that is sorted and
has all the elements of L1 except those that are in L2.
|#


;-------------------------------------
;--------- REMOVE FUNCTIONS ---------
;-------------------------------------

#|
    PSEUDOCODE FOR CUT1:
    cut1[x, L]::
        [ null? [L] -> L;
        | =[x, car[L]] -> cut1[x, cdr[L]];
        | #t -> cons[car[L], cut1[x, cdr[L]]];]
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
        | #t -> eliminate[cut1[car[L2], L1];, cdr[L2]]]
|#
;Functionality: removes all elements of L1 that are in L2
(define (eliminate L1 L2)
    (cond
        ((null? L2) L1) ;if L2 is empty, nothing to remove so return L1
        ;check if first element of L1 is in L2. if so, remove from L1 and call recursively
        (#t (eliminate (cut1 (car L2) L1) (cdr L2)))
    )
)

;-------------------------------------
;--------- SORTING FUNCTIONS ---------
;-------------------------------------

#|
    PSEUDOCODE FOR selectionSort:
    selectionSort::
    [ null?[L] -> L
    | #t -> cons[smallestElmt[L, car[L]], selectionSort[removeFirst[L, smallestElmt[L, car[L]]]]]
|#
; Functionality: sorts the given list L by finding the smallest element, moving it to the first position in the list, then finding the next smallest and moving it into the next position, etc.
(define (selectionSort L)
    (cond
        ((null? L) L)
        (#t (cons(smallestElmt L (car L)) (selectionSort (removeFirst L (smallestElmt L (car L)))))) ;puts smallest element at front of list and sorts the rest of the list without the current smallest element
    )
)

#|
    PSEUDOCODE FOR smallestElmt:
    smallestElmt[L, x]::
        [ null?[L] -> x
        | <[car[L], x] -> smallestElmt[cdr[L], car[L]]
        | #t -> smallestElmt[cdr[L], x]]
|#
; Functionality: Returns the smallest element in the list, with x being the current smallest
(define (smallestElmt L x)
    (cond
        ((null? L) x) ;if the list is empty, then the smallest element is the current smallest (x)
        ((< (car L) x) (smallestElmt (cdr L) (car L))) ;if the first element of the list is less than the current smallest, recursively call smallestElmt on rest of the list (cdr L) and the new smallest aka the first element (car L)
        (#t (smallestElmt (cdr L) x)) ;else, recursively call smallestElmt on the rest of the list (cdr L) with the same smallest element (x).
    )
)

#|
    PSEUDOCODE FOR removeFirst:
    removeFirst[L, x]::
        [ null?[L] -> L
        | =[car[L], x] -> cdr[L]
        | #t -> cons[car[L], removeFirst[cdr[L], x]]]
|#
; Functionality: Returns a list with the the first occurrence of x removed from list L
(define (removeFirst L x)
    (cond
        ((null? L) L) ;if the list is empty, return it
        ((= (car L) x) (cdr L)) ;if the first element of L is x, remove it
        (#t (cons (car L) (removeFirst (cdr L) x))) ;else, construct new list with the first element and the rest of L with x removed (hopefully)
    )
)

;-------------------------------------
;---------- MAIN FUNCTION ------------
;-------------------------------------

#|
    PSEUDOCODE FOR eliminateNsort:
    eliminateNsort::
    [ selectionSort[eliminate[L1, L2]]]
|#
(define (eliminateNsort L1 L2)
    (selectionSort (eliminate L1 L2))
)
