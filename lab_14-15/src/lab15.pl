domains
  city, street, phone, surname, name = string
  house, flat = integer
  address = addr(city, street, house, flat)
  mark, color, bank = string
  id, amount, price = integer

  object = building(name, price);
    region(name, price);
    water_transport(mark, color, price);
    car(mark, color, price).
  
predicates
  phone(surname, phone, address)
  bank_depositor(surname, bank, id, amount)
  owner(surname, object)

  all_objects(surname, name)
  all_objects_price(surname, name, price)
  
clauses
  man("Pavel", "+798523415232", addr("Moscow", "Bassmannaya", 34, 12)).
  man("Alexey", "+79752345123", addr("Moscow", "Lesnaya", 41, 37)).
  man("Mikhail", "+75012354433", addr("Krasnogorsk", "Lenina", 73, 13)).
  man("Dmirty", "+79752341432", addr("Sochi", "Sovetskata", 14, 88)).

  owner("Mikhail", car("BMW", "Green", 1000)).
  owner("Mikhail", region("Nothung", 0)).
  owner("Mikhail", building("Moscow-city", 100500)).
  owner("Alexey", car("BMW", "green", 1000)).
  owner("Alexey", region("Krasnogorsk", 10000)).
  owner("Alexey", building("Mail.ru Office", 20000)).
  owner("Alexey", water_transport("Yacht", "Red", 10000)).
  owner("Dmitry", car("Cadillac", "Black", 304000)).
  owner("Dmitry", building("BMSTU", 200000)).
  owner("Pavel", car("Mercedes", "White", 30000)).
  owner("Pavel", building("Tree", 10)).

  deposit("Mikhail", "Tinkoff", 22, 1000).
  deposit("Dmitry", "Sber", 33, 10000).
  deposit("Dmitry", "Alfa", 44, 20000).
  deposit("Alexey", "Sper", 238, 10).
  deposit("Pavel", "Maza", 1, 10000).

  all_objects(Surname, Name) :- owner(Surname, car(Name, _, _)).
  all_objects(Surname, Name) :- owner(Surname, building(Name, _)).
  all_objects(Surname, Name) :- owner(Surname, region(Name, _)).
  all_objects(Surname, Name) :- owner(Surname, water_transport(Name, _, _)).

  all_objects_price(Surname, Name, Price) :- owner(Surname, car(Name, _, Price)).
  all_objects_price(Surname, Name, Price) :- owner(Surname, building(Name, Price)).
  all_objects_price(Surname, Name, Price) :- owner(Surname, region(Name, Price)).
  all_objects_price(Surname, Name, Price) :- owner(Surname, water_transport(Name, _, Price)).

goal
  %all_objects("Alexey", Name).
  %all_objects_with_price("Pavel", Name, Price).
