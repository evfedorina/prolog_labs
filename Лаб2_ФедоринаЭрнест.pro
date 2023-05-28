implement main
    open core, stdio

class facts - universityDb
    учится_в : (integer Group, integer Student).
    староста : (integer Group, integer Student).
    группа : (integer Group, string Direction, string Info).
    преподавание : (string Teacher, string, string Subject).
    оценка : (integer Subject, integer Student, integer Mark).
    предмет : (integer Subject_ID, string Subject, string Direction).
    студент : (integer Student, string Info, string Phone).

class predicates
    учитсявгруппе : (integer Student) nondeterm.
    староста_группы : (integer Group) nondeterm.
    направление_студента : (integer Student) nondeterm.
    инфо_студента : (integer Student) nondeterm.
    преподаватель_предмета : (string Subject) nondeterm.
    оценкапопредмету : (integer Subject, integer Student) nondeterm.
    предмет_студента : (integer Student) nondeterm.
    инфо_предмета : (string Subject) nondeterm.

clauses
    учитсявгруппе(Студент) :-
        учится_в(Группа, Студент),
        writef("Студент % учится в группе %", Студент, Группа).

    староста_группы(Группа) :-
        староста(Группа, Староста),
        writef("Староста группы % : %", Группа, Староста).

    направление_студента(Студент) :-
        учится_в(Группа, Студент),
        группа(Группа, Направление, _),
        writef("Студент % учится на направлении %", Студент, Направление).

    инфо_студента(Студент) :-
        студент(Студент, ФИО, Телефон),
        writef("Студент % ФИО: %, Телефон: %", Студент, ФИО, Телефон).

    преподаватель_предмета(Предмет) :-
        преподавание(ФИО, _, Предмет),
        writef("Преподаватель предмета % - %", Предмет, ФИО).

    оценкапопредмету(ID_предмета, Студент) :-
        оценка(ID_предмета, Студент, Оценка),
        writef("Студент % получил оценку % по предмету %", Студент, Оценка, ID_предмета).

    предмет_студента(Студент) :-
        учится_в(Группа, Студент),
        предмет(_, Предмет, Направление),
        группа(Группа, Направление, _),
        writef("Предмет студента: %", Предмет).

    инфо_предмета(Предмет) :-
        предмет(_, Предмет, _)
        or
        преподавание(Преподаватель, Кафедра, Предмет),
        writef("Преподаватель: %, Предмет : %, Кафедра:  %", Преподаватель, Предмет, Кафедра).

    run() :-
        file::consult("universitydb.txt", universityDb),
        fail.

    run() :-
        учитсявгруппе(123),
        fail.

    run() :-
        староста_группы(1),
        fail.

    run() :-
        направление_студента(123),
        fail.

    run() :-
        инфо_студента(123),
        fail.

    run() :-
        преподаватель_предмета("Дискретная математика"),
        fail.

    run() :-
        оценкапопредмету(3, 123),
        fail.

    run() :-
        предмет_студента(123),
        fail.

    run() :-
        инфо_предмета("Дискретная математика"),
        fail.

    run().

end implement main

goal
    console::runUtf8(main::run).
