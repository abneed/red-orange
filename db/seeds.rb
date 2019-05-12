# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Employee.create([
  {
    name: "Guillermo Abneed Rodríguez Velázquez",
    jobTitle: "Desarrollador de software",
    subsidiary: "Red Orange - Nuevo Laredo",
    department: "Ingeniería",
    currency: "MXN",
    phone: "(867) 225-20-31",
    dateOfHire: Time.now
  },
  {
    name: "Claudia Aidee Verdugo",
    jobTitle: "Desarrollador de software",
    subsidiary: "Red Orange - Nuevo Laredo",
    department: "Ingeniería",
    currency: "MXN",
    phone: "(867) 905-04-62",
    dateOfHire: 3.months.ago
  },
  {
    name: "Vianey Patiño",
    jobTitle: "Desarrollador de software",
    subsidiary: "Red Orange - Nuevo Laredo",
    department: "Ingeniería",
    currency: "MXN",
    phone: "(867) 243-38-36",
    dateOfHire: 3.months.ago
  },
  {
    name: "Paulina Alejandra Ponce",
    jobTitle: "Supervisor de linea",
    subsidiary: "Red Orange - Nuevo Laredo",
    department: "Manufactura",
    currency: "MXN",
    phone: "(867) 243-45-90",
    dateOfHire: 6.months.ago
  }
])

Skill.create([
  {
    name: "Liderazgo",
    description: "Capacidad de liderar en un grupo de personas.",
    degree_of_difficulty: 2
  },
  {
    name: "Ensamblado de piezas",
    description: "Destreza para ensamblar piezas en tiempo limite.",
    degree_of_difficulty: 3
  },
  {
    name: "Doblez Manual",
    description: "Doblar piezas de forma manual.",
    degree_of_difficulty: 3
  },
  {
    name: "Checar hi-pot",
    description: "Efectividad en revisar el hi-pot.",
    degree_of_difficulty: 1
  },
  {
    name: "Verificar engage",
    description: "Efectividad en revisar el engage.",
    degree_of_difficulty: 1
  },
  {
    name: "Dobladora automatica",
    description: "Efectividad y destreza en utilizar la dobladora automatica.",
    degree_of_difficulty: 3
  },
  {
    name: "Etiquetas",
    description: "Manejo de etiquetas.",
    degree_of_difficulty: 1
  },
  {
    name: "Empaque",
    description: "Efectividad y rapidez en empaquetar.",
    degree_of_difficulty: 2
  },
])

employee = Employee.find_by(name: "Guillermo Abneed Rodríguez Velázquez")
employee.dominates.create(
  skill_id: Skill.find_by(name: "Liderazgo").id,
  degree_of_dominance: 3
)
employee.dominates.create(
  skill_id: Skill.find_by(name: "Empaque").id,
  degree_of_dominance: 4
)
employee.dominates.create(
  skill_id: Skill.find_by(name: "Ensamblado de piezas").id,
  degree_of_dominance: 3
)

employee = Employee.find_by(name: "Claudia Aidee Verdugo")
employee.dominates.create(
  skill_id: Skill.find_by(name: "Dobladora automatica").id,
  degree_of_dominance: 3
)
employee.dominates.create(
  skill_id: Skill.find_by(name: "Verificar engage").id,
  degree_of_dominance: 4
)
employee.dominates.create(
  skill_id: Skill.find_by(name: "Etiquetas").id,
  degree_of_dominance: 3
)

employee = Employee.find_by(name: "Vianey Patiño")
employee.dominates.create(
  skill_id: Skill.find_by(name: "Checar hi-pot").id,
  degree_of_dominance: 3
)
employee.dominates.create(
  skill_id: Skill.find_by(name: "Verificar engage").id,
  degree_of_dominance: 4
)
employee.dominates.create(
  skill_id: Skill.find_by(name: "Dobladora automatica").id,
  degree_of_dominance: 3
)

employee = Employee.find_by(name: "Paulina Alejandra Ponce")
employee.dominates.create(
  skill_id: Skill.find_by(name: "Liderazgo").id,
  degree_of_dominance: 3
)
employee.dominates.create(
  skill_id: Skill.find_by(name: "Ensamblado de piezas").id,
  degree_of_dominance: 4
)
employee.dominates.create(
  skill_id: Skill.find_by(name: "Dobladora automatica").id,
  degree_of_dominance: 3
)
employee.dominates.create(
  skill_id: Skill.find_by(name: "Etiquetas").id,
  degree_of_dominance: 4
)
employee.dominates.create(
  skill_id: Skill.find_by(name: "Empaque").id,
  degree_of_dominance: 4
)