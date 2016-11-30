function Th = MetodoSimpson(func,extremoA,extremoB,error)

Th=((4*(MetodoTrapecio(func,extremoA,extremoB,(sqrt(error))/2)))-(MetodoTrapecio(func,extremoA,extremoB,error)))/3;