# Prolog
Prolog program for AI course taken in Fall 2020

Short intro to prolog in comments of main file.

The answer to the HW assignment is as follows:
Represent these facts in predicate logic and then convert them into clause form and enter them into a Prolog program:

memb() denotes that person is a member of the Elm St. Gobblet Club
Married(x,y) denotes that x and y are married to each other
Bro(x,y) denotes that x is the brother of y
House(x, y) denotes that x owns the house y
prevMeeting() denotes where the previous meeting took place

Memb(Joe)
Memb(Sally)
Memb(Bill)
Memb(Ellen)
Married(Joe, Sally)
bro(Bill, Ellen)
(∀ x,y)  [married(x,y)^memb(x)]  ⇒ memb(y)
(∀y)  prevMeeting(y) ⇒ House(joe, y)
We infer:
A person will not be married to their brother
(∀ x,y) bro(x,y) ⇒ ~married(x,y)
Marriage is a bidirectional relationship 
(∀ x,y) married(y,x) ⇒ married(x,y)
Married people live in the same house
(∀ x,y) married(x,y)^house(x,a) ⇒ house(y,a)
People cannot marry themselves
(∀ x) ~married(x,x)
Clause Form:
Memb(Joe)
Memb(Sally)
Memb(Bill)
Memb(Ellen)
Married(Joe, Sally)
bro(Bill, Ellen)
 ~married(x,y) v ~memb(x)  v memb(y)
~prevMeeting(y) v house(joe, y)
inferred:
~bro(x,y) v ~married(x,y)
~married(y,x) v married(x,y)
~married(x,y) v ~house(x,a) v house(y,a)
~married(x,x)
Answer Part B
From the facts given above, most people would be able to decide on the truth of the following additional statements:
Predicate Form
(∀y)  prevMeeting(y) ⇒ House(Sally, y)
(∀y) ~(married(ellen, y)) 
Clause Form
 ~prevMeeting(y) v House(Sally, y)
~(married(ellen, y)) 
Resolution 1
To be Proved: ~prevMeeting(a) v House(Sally, a)
Negated to be proved: ~(~prevMeeting(a) v House(Sally, a))
			       :    prevMeeting(y) ^ ~House(Sally, y)
~married(x,y) v ~house(x,a) v house(y,a)
Married(Joe, Sally)
~prevMeeting(a) v house(joe, y)
prevMeeting(a) ^ ~House(Sally, a)
Contradiction: Therefore the conclusion is true
Resolution 2
To be proved: ~(married(ellen, y)) 
Negated to be proved: married(ellen, y)
~married(x,y) v ~memb(x)  v memb(y)
~married(y,x) v married(x,y)
~married(x,y) v ~married(x,z) v ~married(y,z)
Memb(Ellen)
Memb(Joe)
Memb(Sally)
Married(Joe, Sally)
married(ellen, y)
NIL
~married(x,x)
married(ellen, y)
NIL
~bro(bill,ellen) v ~married(bill, ellen)
~bro(x,y) v ~married(x,y)
married(ellen, y)
NIL

there are three cases possible:
First we establish that if Ellen is married to someone then they must be a member of the club
~married(x,y) v ~memb(x)  v memb(y)
Memb(Ellen)
Memb(Joe)
Memb(Sally)
Memb(Bill)
~married(y,x) v married(x,y) 
Ellen isn’t married to herself	
~married(x,x)
~married(y,x) v married(x,y)
married(ellen, y)
Ellen isn’t married to either Joe or Sally who are married to each other
~married(x,y) v ~married(x,z) v ~married(y,z)
~married(y,x) v married(x,y) 
Married(Joe, Sally)
married(ellen, y)
Ellen isn’t married to her brother:
~bro(bill,ellen) v ~married(bill, ellen)
~bro(x,y) v ~married(x,y)
married(ellen, y)
