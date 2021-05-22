% Описать грамматику вида (существительное + описание существительного) + (глагол + описание действия).
% Определить, принадлежит ли предложение заданной граматике. При этом, граматика должна быть и пораждающей.

существительное(
    словоформа("мама"),
    род("женский"),
    число("единственное"),
    падеж("именительный")
).

существительное(
    словоформа("мамы"),
    род("женский"),
    число("множественное"),
    падеж("именительный")
).

существительное(
    словоформа("маму"),
    род("женский"),
    число("единственное"),
    падеж("винительный")
).

существительное(
    словоформа("мам"),
    род("женский"),
    число("множественное"),
    падеж("родительный")
).

существительное(
    словоформа("рама"),
    род("женский"),
    число("единственное"),
    падеж("именительный")
).

существительное(
    словоформа("раму"),
    род("женский"),
    число("единственное"),
    падеж("винительный")
).

существительное(
    словоформа("птицы"),
    род(""),
    число("множественное"),
    падеж("именительный")
).

существительное(
    словоформа("ночь"),
    род("женский"),
    число("единственное"),
    падеж("именительный")
).

существительное(
    словоформа("ночь"),
    род("женский"),
    число("единственное"),
    падеж("винительный")
).

глагол(
    словоформа("мыла"),
    род("женский"),
    число("единственное"),
    время("прошедшее")
).

глагол(
    словоформа("мыл"),
    род("мужской"),
    число("единственное"),
    время("прошедшее")
).

глагол(
    словоформа("мыли"),
    род(""),
    число("множественное"),
    время("прошедшее")
).

глагол(
    словоформа("купила"),
    род("женский"),
    число("единственное"),
    время("прошедшее")
).

глагол(
    словоформа("собьет"),
    род("женский"),
    число("единственное"),
    время("будущее")
).

глагол(
    словоформа("собьет"),
    род("мужской"),
    число("единственное"),
    время("будущее")
).

глагол(
    словоформа("сломают"),
    род(""),
    число("множественное"),
    время("будущее")
).

глагол(
    словоформа("сломает"),
    род("женский"),
    число("единственное"),
    время("будущее")
).

глагол(
    словоформа("сломает"),
    род("мужской"),
    число("единственное"),
    время("будущее")
).

наречие(словоформа("авторитетно")).
наречие(словоформа("агрессивно")).

предлог(
    словоформа("в"),
    падеж("винительный")
).

прилагательное(
    словоформа("абажурную"),
    род("женский"),
    число("единственное"),
    падеж("именительный")
).

прилагательное(
    словоформа("красивая"),
    род("женский"),
    число("единственное"),
    падеж("именительный")
).

прилагательное(
    словоформа("красивый"),
    род("мужской"),
    число("единственное"),
    падеж("именительный")
).

прилагательное(
    словоформа("красивых"),
    род(""),
    число("множественное"),
    падеж("родительный")
).

прилагательное(
    словоформа("красивую"),
    род("женский"),
    число("единственное"),
    падеж("винительный")
).

прилагательное(
    словоформа("красивые"),
    род(""),
    число("множественное"),
    падеж("именительный")
).

прилагательное(
    словоформа("темную"),
    род("женский"),
    число("единственное"),
    падеж("винительный")
).

прилагательное(
    словоформа("темная"),
    род("женский"),
    число("единственное"),
    падеж("именительный")
).

предложение(S0, S):- группа_существительного(S0, S1, R, C, P), группа_глагола(S1, S, R, C, P).

группа_существительного(S, S1, R, C, P) :-
    описание_существительного(S, [S0 | S1], R, C, P), существительное(словоформа(S0), R, C, P).

группа_глагола([S0 | S], S1, _, C, _) :- глагол(словоформа(S0), род(""), C, _), описание_действия(S, S1).
группа_глагола([S0 | S], S1, R, C, _) :- глагол(словоформа(S0), R, C, _), описание_действия(S, S1).
группа_глагола([S0, S1 | S2], S2, _, _, _) :- глагол(словоформа(S0), R, _, _), существительное(словоформа(S1), R, _, _).
группа_глагола([S0, S1 | S2], S2, _, _, _) :- глагол(словоформа(S0), _, _, _), наречие(словоформа(S1)).

описание_существительного([S0 | S], S, _, С, P) :- прилагательное(словоформа(S0), род(""), С, P); наречие(словоформа(S0)).
описание_существительного([S0 | S], S, R, С, P) :- прилагательное(словоформа(S0), R, С, P); наречие(словоформа(S0)).

описание_действия(S, S1) :-
    группа_существительного(S, S1, _, _, _).

описание_действия([S0 | S], S1) :-
    предлог(словоформа(S0), P), группа_существительного(S, S1, _, _, P).

описание_действия([S | S1], S1) :-
    наречие(словоформа(S)).

% Подходит:
% предложение(["красивые", "мамы", "мыли", "авторитетно"], X).
% предложение(["красивая", "мама", "мыла", "авторитетно"], X).
% предложение(["темная", "мама", "сломает", "в", "темную", "ночь"], X).
% предложение(["темная", "мама", "сломает", "красивую", "раму"], X).
% предложение(["красивую", "маму", "сломают", "птицы"], X).
% предложение(["красивую", "маму", "сломают", "авторитетно"], X).
% предложение(["красивые", "мамы", "мыли", "красивых", "мам"], X).

% Не подходит:
% предложение(["красивые", "мама", "мыла", "авторитетно"], X).
% предложение(["красивая", "мамы", "мыли", "авторитетно"], X).
% предложение(["красивая", "мама", "мыл", "мама"], X).
% предложение(["красивые", "мама", "мыли", "авторитетно"], X).
% предложение(["темная", "мама", "сломает", "красивые", "ночь"], X).
% предложение(["темная", "мама", "сломает", "в"], X).
% предложение(["темная", "мама", "сломает"], X).