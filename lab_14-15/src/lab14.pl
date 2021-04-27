domains
  surname, phone, city, street, house, apartment = string
  address = address(city, street, house, apartment)
  model, color, cost = string
  bank, sum = string
  
predicates
  man(surname, phone, address)
  car(surname, model, color, cost)
  deposit(surname, bank, sum)

  name_city_bank_phone_by_model_color(model, color, surname, city, bank, phone)
  
clauses
  man("Alexey", "89096412389", address("Krasnogorsk", "Lesnaya", "17", "5")).
  man("Vladimir", "890955550987", address("Moscow", "Sovetskaya", "134", "15")).
  man("Mikhail", "8100500321", address("Khimki", "Lesnaya", "27", "501")).
  man("Pavel", "87654329867", address("Moscow", "Tikhaya", "105", "52")).
  man("Alexander", "89096421389", address("Moscow", "Baumanskaya", "170", "1")).
  man("Andrey", "89999999999", address("Ekaterinburg", "Lenina", "140", "21")).
  
  car("Alexey", "AMG", "Black", "100000").
  car("Alexey", "Volvo", "Red", "50000").
  car("Pavel", "Nissan", "White", "709000").
  car("Andrey", "Nissan", "White", "205000").
  car("Mikhail", "Cadillac", "Black", "1000000").
  car("Dmirty", "Honda", "Red", "100500").
  
  deposit("Alexey", "Tinkoff", "10000000000").
  deposit("Andrey", "Sber", "100500").
  deposit("Pavel", "Sber", "0").
  deposit("Mikhail", "Alpha", "10").
   
  name_city_bank_phone_by_model_color(Model, Color, Surname, City, Bank, Phone) :-
   car(Surname, Model, Color, _),
   man(Surname, Phone, address(City, _, _, _)),
   deposit(Surname, Bank, _).
  
goal
  %name_city_bank_phone_by_model_color("AMG", "Black", Surname, City, Bank, Phone).
  %name_city_bank_phone_by_model_color("Nissan", "White", Surname, City, Bank, Phone).
  %name_city_bank_phone_by_model_color("Honda", "Red", Surname, City, Bank, Phone).
