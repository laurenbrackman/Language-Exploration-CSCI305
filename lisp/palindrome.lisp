;List Homework, Kruize Christensen

;;;;reads the list inputed and returns T or NIL if its palindrome or not
(defun palindromep( aList )
(setq frst (first aList))
(setq lst (first (last aList)))
(cond
	( (equal nil aList) (princ t) )
	( (= 1 (length aList)) (princ t) )
	( (equal frst lst)
		(setq a2 (cdr aList)) 
		(setq a3 (reverse (cdr (reverse a2 ))))  
		(palindromep a3) )
	( (= 0 0) (princ nil)))
(terpri)
)

(defun main()
(
(setq aList (first (last (first (last read)))))
(setq n (first read))
(setq m (string n))
(cond
        ((equal pal m) (palindromep aList))
        ((= 0 0) (print "invalid function")))
)

(main)
