domains
  name, surname, university, group = string
  course = integer

predicates
  student(name, surname, university, group, course)

clauses
  student("Alexey", "Romanov", "BMSTU", "IU7-63B", 3).
  student("Pavel", "Perestoronin", "BMSTU", "IU7-63B", 5).
  student("Ivan", "Cvetkov", "BMSTU", "IU7-43B", 2).
  student("Alexey", "Romanov", "MSU", "VMK-1", 1).
  student("Pavel", "Perestoronin", "MAI", "EM-8", 2).
  student("Ilya", "Bryukhov", "MAI", "ACS12", 2).
  student("Vladimir", "Nesterov", "MIPT", Group, Course)
   :- student("Alexey", "Romanov", "BMSTU", Group, _),  student("Pavel", "Perestoronin", "BMSTU", Group, Course).

goal
  student(Name, Surname, "MIPT", Group, Course).