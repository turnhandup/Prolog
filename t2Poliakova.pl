/** * Виконала Полякова Анна.
* Предметна область: Бібліотека. 
* Відношення-факти:Книга (шифр, автор, назва, видавництво, рік видання, кількість сторінок).
* Читач (ПІБ, адреса, телефон, вік, місце роботи).
* Облікова картка (ПІБ читача, шифр книги, дата взяття, дата повернення, факт повернення (так-ні)).
*/

/* Завдання 1 */

/* Імена тих, хто не повернув книги. Приклад запиту: noreturn(X). */
noreturn(X) :- card(X,_,_,_,no).
/* Хто взяв книгу. Приклад запиту: whotookthebook('451 Fahrenheit',Y,Z). */
whotookthebook(X,Y,Z) :- book(Y,_,X,_,_,_), card(Z,Y,_,_,_).
/* Номер телефону читача за його місцем роботи. Приклад запиту: numberbyworkplace(X,'Wendys'). */
numberbyworkplace(X,Y) :-reader(_,_,X,_,Y).
/* Автори, яких читає певний користувач. Приклад запиту: favoriteauthors('Ruslana Olegivna Pashko',Y,Z). */
favoriteauthors(X,Y,Z) :- card(X,Y,_,_,_), book(Y,Z,_,_,_,_).
/* Читачі, які читають даного автора. Приклад запиту: readersbyauthor('Ray Bradbury',Y,Z). */
readersbyauthor(X,Y,Z) :- book(Y,X,_,_,_,_), card(Z,Y,_,_,_).
book(1,'Ray Bradbury','451 Fahrenheit','Eksmo',1998,300).
book(2,'Lev Tolstoy','War and Piece','Leningrad',1987,1028).
book(3,'Jack Kerouak','In a road','Life',2016,400).
book(4,'Virginia Woolf','Missis Delloway','Komubook',2016,354).
book(5,'Steven King','It','Eksmo',2010,1006).
book(6,'Steven King','Under the Dome','Eksmo',2011,1022).
reader('Anna Anatoliivna Poliakova','Cvetaeboj St.14','+380638606654', 26,'McDonalds').
reader('Ruslana Olegivna Pashko','Cvetaeboj St.14','+380638698654', 29,'Wendys').
reader('Mykola Sergijovych Dekhtiarenko','Cvetaeboj St.14','+380634165438',27,'Kalahari').
card('Anna Anatoliivna Poliakova',1,'25 December 2016','25 January 2017',no).
card('Anna Anatoliivna Poliakova',6,'25 December 2016','15 January 2017',yes).
card('Anna Anatoliivna Poliakova',4,'25 December 2016','15 January 2017',yes).
card('Ruslana Olegivna Pashko',1,'20 December 2016','12 January 2017',yes).
card('Ruslana Olegivna Pashko',2,'20 December 2016','12 January 2017',no).
card('Mykola Sergijovych Dekhtiarenko',6,'20 December 2016','15 January 2017',no).


/* Завдання 2. З використанням структур */
/* Імена тих, хто не повернув книги. Приклад запиту: noreturn2(X,Y,Z). */
noreturn2(X,Y,Z) :- card2(user(X,Y,Z),_,_,_,no).
/* Хто взяв книгу. Приклад запиту: whotookthebook2('Under the Dome',Y,N,F,S).*/
whotookthebook2(X,Y,N,F,S) :- book2(Y,_,X,_,_,_), card2(user(N,F,S),Y,_,_,_).
/* Номер телефону читача за його місцем роботи. Приклад запиту: numberbyworkplace2(X,'Wendys').*/
numberbyworkplace2(X,Y) :-reader2(_,_,X,_,Y).
/* Автори, яких читає певний користувач. Приклад запиту: favoriteauthors2(X,'Mykola','Sergijovych','Dekhtiarenko',A,B). */
favoriteauthors2(X,N,F,S,A,B) :- book2(X,author(A,B),_,_,_,_),card2(user(N,F,S),X,_,_,_).
/* Читачі, які читають даного автора. Приклад запиту: readersbyauthor2('Steven','King',Y,N,F,S). */
readersbyauthor2(X,A,Y,N,F,S) :- book2(Y,author(X,A),_,_,_,_), card2(user(N,F,S),Y,_,_,_).
/* Використана структура author */
book2(1,author('Ray','Bradbury'), '451 Fahrenheit', 'Eksmo',1998,300).
book2(2,author('Lev','Tolstoy'),'War and Piece','Leningrad',1987,1028).
book2(3,author('Jack','Kerouak'),'In a road','Life',2016,400).
book2(4,author('Virginia','Woolf'),'Missis Delloway','Komubook',2016,354).
book2(5,author('Steven','King'),'It','Eksmo',2010,1006).
book2(6,author('Steven','King'),'Under the Dome','Eksmo',2011,1022).
/* Використана структура user */
reader2(user('Anna','Anatoliivna','Poliakova'),'Cvetaeboj St.14','+380638606654', 26,'McDonalds').
reader2(user('Ruslana','Olegivna','Pashko'),'Cvetaeboj St.14','+380638698654', 29,'Wendys').
reader2(user('Mykola','Sergijovych','Dekhtiarenko'),'Cvetaeboj St.14','+380634165438',27,'Kalahari').
/* Використані структури user, startdate, enddate */
card2(user('Anna','Anatoliivna','Poliakova'),1,startdate(25,'December',2016),enddate(25,'January',2017),no).
card2(user('Anna','Anatoliivna','Poliakova'),6,startdate(25,'December',2016),enddate(15,'January',2017),yes).
card2(user('Anna','Anatoliivna','Poliakova'),4,startdate(25,'December',2016),enddate(15,'January',2017),yes).
card2(user('Ruslana','Olegivna','Pashko'),1,startdate(20,'December',2016),enddate(12,'January',2017),yes).
card2(user('Ruslana','Olegivna','Pashko'),2,startdate(23,'December',2016),enddate(12,'January',2017),no).
card2(user('Mykola','Sergijovych','Dekhtiarenko'),6,startdate(29,'December',2016),enddate(15,'January',2017),no).
