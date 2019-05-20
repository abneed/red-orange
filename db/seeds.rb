# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

Employee.create({
  name: "Guillermo Abneed Rodríguez Velázquez",
  job_title: "Desarrollador de software",
  subsidiary: "Red Orange - Nuevo Laredo",
  department: "Ingeniería",
  currency: "MXN",
  phone: "(867) 225-20-31",
  date_of_hire: Time.now
}.values)

Employee.create({
  name: "Claudia Aidee Verdugo",
  job_title: "Desarrollador de software",
  subsidiary: "Red Orange - Nuevo Laredo",
  department: "Ingeniería",
  currency: "MXN",
  phone: "(867) 905-04-62",
  date_of_hire: 3.months.ago
}.values)

Employee.create({
    name: "Vianey Patiño",
    job_title: "Desarrollador de software",
    subsidiary: "Red Orange - Nuevo Laredo",
    department: "Ingeniería",
    currency: "MXN",
    phone: "(867) 243-38-36",
    date_of_hire: 3.months.ago
}.values)

Employee.create({
  name: "Paulina Alejandra Ponce",
  job_title: "Supervisor de linea",
  subsidiary: "Red Orange - Nuevo Laredo",
  department: "Manufactura",
  currency: "MXN",
  phone: "(867) 243-45-90",
  date_of_hire: 6.months.ago
}.values)

Skill.create({
  name: "Liderazgo",
  description: "Capacidad de liderar en un grupo de personas.",
  degree_of_difficulty: 2
}.values)

Skill.create({
  name: "Ensamblado de piezas",
  description: "Destreza para ensamblar piezas en tiempo limite.",
  degree_of_difficulty: 3
}.values)

Skill.create({
  name: "Doblez Manual",
  description: "Doblar piezas de forma manual.",
  degree_of_difficulty: 3
}.values)

Skill.create({
  name: "Checar hi-pot",
  description: "Efectividad en revisar el hi-pot.",
  degree_of_difficulty: 1
}.values)

Skill.create({
  name: "Verificar engage",
  description: "Efectividad en revisar el engage.",
  degree_of_difficulty: 1
}.values)

Skill.create({
  name: "Dobladora automatica",
  description: "Efectividad y destreza en utilizar la dobladora automatica.",
  degree_of_difficulty: 3
}.values)

Skill.create({
  name: "Etiquetas",
  description: "Manejo de etiquetas.",
  degree_of_difficulty: 1
}.values)

Skill.create({
  name: "Empaque",
  description: "Efectividad y rapidez en empaquetar.",
  degree_of_difficulty: 2
}.values)

Item.create({
  name: "Tornillo",
  description: "Tornillo de 3mm de grosor.",
  quantity: 30,
}.values)

Item.create({
  name: "Tubo de aluminio",
  description: "Tubo de aluminio de 5 cm de diametro, con una longitud de 1 metro.",
  quantity: 20,
}.values)

Item.create({
  name: "Lamina de aluminio",
  description: "Lamina de aluminio de 5mm de grosor, con dimensiones de 1 metro de largo y 1 metro de ancho.",
  quantity: 20,
}.values)

# employee = Employee.find_by(name: "Guillermo Abneed Rodríguez Velázquez")
# employee.dominates.create(
#   skill_id: Skill.find_by(name: "Liderazgo").id,
#   degree_of_dominance: 3
# )
# employee.dominates.create(
#   skill_id: Skill.find_by(name: "Empaque").id,
#   degree_of_dominance: 4
# )
# employee.dominates.create(
#   skill_id: Skill.find_by(name: "Ensamblado de piezas").id,
#   degree_of_dominance: 3
# )

# employee = Employee.find_by(name: "Claudia Aidee Verdugo")
# employee.dominates.create(
#   skill_id: Skill.find_by(name: "Dobladora automatica").id,
#   degree_of_dominance: 3
# )
# employee.dominates.create(
#   skill_id: Skill.find_by(name: "Verificar engage").id,
#   degree_of_dominance: 4
# )
# employee.dominates.create(
#   skill_id: Skill.find_by(name: "Etiquetas").id,
#   degree_of_dominance: 3
# )

# employee = Employee.find_by(name: "Vianey Patiño")
# employee.dominates.create(
#   skill_id: Skill.find_by(name: "Checar hi-pot").id,
#   degree_of_dominance: 3
# )
# employee.dominates.create(
#   skill_id: Skill.find_by(name: "Verificar engage").id,
#   degree_of_dominance: 4
# )
# employee.dominates.create(
#   skill_id: Skill.find_by(name: "Dobladora automatica").id,
#   degree_of_dominance: 3
# )

# employee = Employee.find_by(name: "Paulina Alejandra Ponce")
# employee.dominates.create(
#   skill_id: Skill.find_by(name: "Liderazgo").id,
#   degree_of_dominance: 3
# )
# employee.dominates.create(
#   skill_id: Skill.find_by(name: "Ensamblado de piezas").id,
#   degree_of_dominance: 4
# )
# employee.dominates.create(
#   skill_id: Skill.find_by(name: "Dobladora automatica").id,
#   degree_of_dominance: 3
# )
# employee.dominates.create(
#   skill_id: Skill.find_by(name: "Etiquetas").id,
#   degree_of_dominance: 4
# )
# employee.dominates.create(
#   skill_id: Skill.find_by(name: "Empaque").id,
#   degree_of_dominance: 4
# )