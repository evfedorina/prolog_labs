implement main
    open core, stdio

class facts - universityDb
    учится_в : (integer Group, integer Student).
    староста : (integer Group, integer Student).
    группа : (integer Group, string Direction, integer Info).
    преподавание : (string Teacher, string, string Subject).
    оценка : (integer Subject, integer Student, integer Mark).
    предмет : (integer Subject_ID, string Subject, string Direction).
    студент : (integer Student, string Info, string Phone).

class predicates
    длина : (A*) -> integer N.
    сумма : (real* List) -> real Sum.
    среднее : (real* List) -> real Average determ.

class facts
    s : (integer Sum) single.

clauses
    s(0).
    длина([]) = 0.
    длина([_ | T]) = длина(T) + 1.

    сумма([]) = 0.
    сумма([H | T]) = сумма(T) + H.

    среднее(L) = сумма(L) / длина(L) :-
        длина(L) > 0.

class predicates
    сред_балл_группы : (integer Mark) -> real СРБАЛ nondeterm.
    всего_студентов_в_группе : (integer Count) -> integer ВСЕГОСТ nondeterm.
    преподаватели_студента : (integer Student) -> string* ПРЕП nondeterm.

clauses
    преподаватели_студента(X) = Prep :-
        студент(X, _, _),
        Prep =
            [ Teacher ||
                преподавание(Teacher, _, Subject),
                предмет(_, Subject, Direction),
                группа(Group, Direction, _),
                учится_в(Group, X)
            ].
    сред_балл_группы(X) =
            среднее(
                [ Mark ||
                    учится_в(X, Student),
                    оценка(_, Student, Mark)
                ]) :-
        учится_в(X, _).
    всего_студентов_в_группе(X) = длина([ Student || учится_в(X, Student) ]) :-
        учится_в(X, _).

clauses
    run() :-
        file::consult("C:/Users/huawei/Desktop/prolog_lab2/labb3/universitydb.txt", universityDb),
        fail.

    run() :-
        X = 2,
        L = сред_балл_группы(X),
        writef("\nСредний балл группы №% составил % баллов", X, L),
        nl,
        fail.

    run() :-
        X = 1,
        L = всего_студентов_в_группе(X),
        writef("\nВ группе №% - % студентов", X, L),
        nl,
        fail.

    run() :-
        X = 2,
        L = всего_студентов_в_группе(X),
        writef("\nВ группе №% - % студентов", X, L),
        nl,
        fail.
    run() :-
        X = 3,
        L = всего_студентов_в_группе(X),
        writef("\nВ группе №% - % студентов", X, L),
        nl,
        fail.

    run() :-
        X = 123,
        L = преподаватели_студента(X),
        writef("\n % -Преподаватели студента №%", L, X),
        nl,
        fail.

    run().

end implement main

goal
    console::runUtf8(main::run).
