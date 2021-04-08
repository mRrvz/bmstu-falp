domains
  name = string
  city = string
  street = string
  home = integer
  phone = integer

predicates
  record(name, city, street, home, phone)

clauses
  record("Alexey", "Krasnogorsk", "Lesnaya", 15, 8965258).
  record("Pavel", "Moscow", "Inessa Armand", 79, 8996666).
  record("Dmitry", "Moscow", "Golubinskaya", 140, 8853535).
  record("Sergey", "Moscow", "Dorms 5", 655, 8578728).
  record("Mikhail", "Ekaterinburg", "Sovetskaya", 140, 8920909).

goal
  record(Name, "Moscow", Street, Home, Phone).