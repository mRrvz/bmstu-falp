% Есть БД слов. Вывести такие слова, в которых символы из списка содержатся с указанным процентом.

word("aaabbbc").
word("abc").
word("aabb").
word("aaabbb").
word("aab").
word("abccc").
word("a").
word("defg").
word("abcdeg").

diff(N1, N2, Res) :- Res = abs(N1 - N2).

char_cnt([], _, 0) :- !.
char_cnt([H | T], H, N) :-
    !, char_cnt(T, H, NN), N is NN + 1.
char_cnt([_ | T], C, N) :-
    char_cnt(T, C, N).

remove([X | Xs], N, [X | ResXs]) :- X \= N, !, remove(Xs, N, ResXs).
remove([_ | Xs], N, Result) :- remove(Xs, N, Result).
remove([], _, []).

unique_list([X | Xs], [X | Result]) :- remove(Xs, X, Ys), !, unique_list(Ys, Result).
unique_list([], []).

get_percentage(Word, Sym, Percentage) :-
    string_chars(Word, ConvertedWord),
    char_cnt(ConvertedWord, Sym, Cnt),
    string_length(Word, Len),
    Percentage is Cnt / Len * 100.

get_total_percentage(_, [], 0).
get_total_percentage(Word, [X | Xs], SumPercentage) :-
    get_percentage(Word, X, Percentage),
    get_total_percentage(Word, Xs, Acc),
    SumPercentage is Acc + Percentage.

full_occurrence(_, []) :- !.
full_occurrence(Word, [X | _]) :-
    string_chars(Word, ConvertedWord),
    char_cnt(ConvertedWord, X, N), N > 0.

is_valid_percentage(_, _, Percentage) :-
    diff(100, Percentage, Eps), Eps > 1e-5, !.
is_valid_percentage(Word, List, _) :- full_occurrence(Word, List).

get_symbols_percentage(List, Percentage, Word) :-
    unique_list(List, UniqueList),
    word(Word),
    get_total_percentage(Word, UniqueList, PercentageTotal),
    diff(Percentage, PercentageTotal, Eps), Eps < 1e-5,
    is_valid_percentage(Word, UniqueList, Percentage).

%get_symbols_percentage(['c', 'c', 'c', 'b', 'a', 'a', 'a', 'a'], 100, Word).
