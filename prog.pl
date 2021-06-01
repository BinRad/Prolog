/*  Program 2 for AI at CCNY F20 By Binyamin Radensky
NOTES: (how to use prolog)
    1. a:-b means if a is true IF b is true
    2. load in program into prolog using [name_of_program].
    3. Atoms are people in the program like john etc
    4. Variables allow us to answer questions like loves(romeo, x)
    5. Never start atom with _
    6. if prolog gives an snwer with '?' at the end then you 
        can use ';' to scroll through its different answers
    7. if you ask for some(x), other(y). it will give you
        the different possible combinations of the two
    8. '.' is endline
    9. Rules is when facts are going to depend on oother facts
        Ex: jumps(john):- eating(john), happy(john).
        means: john jumps when he is eating AND he is happy.
    10. at the prompt '?-' we can ask questionss.
    11. If you have 2 conditional satemtns and one of the 
        comes back true then it will return true.
    12. listing(thing)gets list
    13. Variables are uppercase or start with _
    14. format('~w ~s stuff ~n', )
        ~w is variable
        ~s is a string
        ~n is a newline
*/
use_module(library(solution_sequences)).
/*Factst that classsify the members of the club, ***/
memb(joe, club).
memb(sally, club).
memb(bill, club).
memb(ellen, club).
memb(B, club) :- A @< B, married(A,B), memb(A, club).
/*Joe is married to Sally*/
married(joe, sally).
/*Marriage is a bidirectional relationship ** cant marry yourself*/
married(K,L) :-  K @< L, married(L,K) .
/*Bill is Ellens brother*/
bro(bill, ellen).
/*you do not marry your brother*/
not(married(G,H); married(H,G)) :- bro(G,H) ; bro(H, G).
/*Joes and who ever he is marrried to own his house*/
owns(joe, jh).
owns(E,jh) :- married(D,E), owns(D,jh).
/*The last meeting was in joes house*/
lastMeeting(club, jh).
/*The last meeting was at Sally's house*/
goal1 :- lastMeeting(club, jh), owns(sally, jh).
/*Ellen is married -- false, she is not*/
goal2 :- married(X, ellen), memb(X, club).

/*illustrate the program is getting the correct answer*/
notGoal1 :- married(X, joe), memb(X, club).
notGoal2 :- married(X, sally), memb(X, club).
notGoal3 :- married(X, bill), memb(X, club).