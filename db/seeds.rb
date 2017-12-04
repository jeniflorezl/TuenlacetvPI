# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
City.create(nombre: 'MEDELLIN', codigo: '05001', usuario: 'admin')
City.create(nombre: 'BOGOTA', codigo: '11001', usuario: 'admin')
City.create(nombre: 'CALI', codigo: '76001', usuario: 'admin')
City.create(nombre: 'BUCARAMANGA', codigo: '68001', usuario: 'admin')
City.create(nombre: 'PEREIRA', codigo: '66001', usuario: 'admin')
Company.create(tipo: '01', nit: '1236737382', nombre: 'ENLACE INFORMÁTICO', direccion: 'Calle 54A #43-23', 
telefono1: '4540312', telefono2: '', fax: '', contacto: '321342343', correo: 'enlaceinformatico@gmail.com',
regimen: '', actividade: '', contribuyente: '', resolucionCntv: '', representante: 'Jeniffer Flórez', 
idciudad: 1, prefijo: '', titulo1: '', titulo2: '', logo: '', usuario: 'admin')
Concept.create(descripcion: 'SUSCRIPCION', operacion: '+', clase: 'O', iva: 0, tipodoc: 'AFI', observa: '',
usuario: 'admin')
Concept.create(descripcion: 'MENSUALIDAD', operacion: '+', clase: 'P', iva: 0, tipodoc: 'FAC', observa: '',
usuario: 'admin')
Concept.create(descripcion: 'PUNTO ADICIONAL', operacion: '+', clase: 'O', iva: 0, tipodoc: 'ETV', observa: '',
usuario: 'admin')
Zone.create(city_id: 1, nombre: 'ZONA GENERAL', usuario: 'admin')
Zone.create(city_id: 1, nombre: 'ZONA NORTE', usuario: 'admin')
Zone.create(city_id: 1, nombre: 'ZONA CENTRO', usuario: 'admin')
Zone.create(city_id: 1, nombre: 'ZONA SUR', usuario: 'admin')
Zone.create(city_id: 1, nombre: 'ZONA SUROESTE', usuario: 'admin')
Neighborhood.create(zone_id: 1, nombre: 'PRADO', usuario: 'admin')
Neighborhood.create(zone_id: 2, nombre: 'MIRADOR', usuario: 'admin')
Neighborhood.create(zone_id: 3, nombre: 'TRAPICHE', usuario: 'admin')
Neighborhood.create(zone_id: 4, nombre: 'SANTA ANA', usuario: 'admin')
Neighborhood.create(zone_id: 5, nombre: 'BOSTON', usuario: 'admin')
User.create(login: 'jeniferfl', nombre: 'JENIFFER FLÓREZ LONDOÑO', clave: '123', nivel: '1', usuario: 'admin')
User.create(login: 'melinamb', nombre: 'MELINA MEJÍA BEDOYA', clave: '123', nivel: '1', usuario: 'admin')
User.create(login: 'estefafl', nombre: 'ESTEFANIA FLÓREZ LONDOÑO', clave: '123', nivel: '2', usuario: 'admin')
User.create(login: 'camilodp', nombre: 'CAMILO DURAN PEREZ', clave: '123', nivel: '2', usuario: 'admin')
User.create(login: 'danielld', nombre: 'DANIEL LONDOÑO DAVID', clave: '123', nivel: '3', usuario: 'admin')
Plan.create(nombre: 'Plan tv', usuario: 'admin')
Function.create(nombre: 'Suscriptor', usuario: 'admin')
Function.create(nombre: 'Empleado', usuario: 'admin')
Function.create(nombre: 'Proveedor', usuario: 'admin')
Function.create(nombre: 'Cliente', usuario: 'admin')
Function.create(nombre: 'Vendedor', usuario: 'admin')
Function.create(nombre: 'Esal', usuario: 'admin')
Function.create(nombre: 'Tecnico', usuario: 'admin')
Function.create(nombre: 'Cobrador', usuario: 'admin')
Technology.create(nombre: 'Análoga', usuario: 'admin')
Technology.create(nombre: 'Digital', usuario: 'admin')
TypeDocument.create(nombre: 'Cédula de Ciudadanía', usuario: 'admin')
TypeDocument.create(nombre: 'Cédula de Extranjería', usuario: 'admin')
TypeDocument.create(nombre: 'Pasaporte', usuario: 'admin')
TypeDocument.create(nombre: 'NIT', usuario: 'admin')
TypeInstallation.create(nombre: 'Casa', usuario: 'admin')
TypeInstallation.create(nombre: 'Edificio', usuario: 'admin')
TypeInstallation.create(nombre: 'Hotel', usuario: 'admin')
TypeInstallation.create(nombre: 'Negocio', usuario: 'admin')
Rate.create(zone_id: 1, concept_id: 1, plan_id: 1, valor: 10000, estado: 'A', usuario: 'admin')
Rate.create(zone_id: 1, concept_id: 2, plan_id: 1, valor: 20000, estado: 'A', usuario: 'admin')
Rate.create(zone_id: 1, concept_id: 3, plan_id: 1, valor: 10000, estado: 'A', usuario: 'admin')
Rate.create(zone_id: 2, concept_id: 1, plan_id: 1, valor: 20000, estado: 'A', usuario: 'admin')
Rate.create(zone_id: 2, concept_id: 2, plan_id: 1, valor: 30000, estado: 'A', usuario: 'admin')
Rate.create(zone_id: 2, concept_id: 3, plan_id: 1, valor: 20000, estado: 'A', usuario: 'admin')
Rate.create(zone_id: 3, concept_id: 1, plan_id: 1, valor: 5000, estado: 'A', usuario: 'admin')
Rate.create(zone_id: 3, concept_id: 2, plan_id: 1, valor: 15000, estado: 'A', usuario: 'admin')
Rate.create(zone_id: 3, concept_id: 3, plan_id: 1, valor: 10000, estado: 'A', usuario: 'admin')
Person.create(type_document_id: 1, documento: '1020470055', nombre1: 'JENIFFER', nombre2: '',
apellido1: 'FLÓREZ', apellido2: 'LONDOÑO', direccion: 'Cra 47 #53-41', neighborhood_id: 1, zone_id: 1, 
telefono1: '4540312', telefono2: '', correo: 'jeniferfl@gmail.com', fechanac: '13/07/1995', 
tipopersona: 'N', estrato: '3', usuario: 'admin')
Person.create(type_document_id: 1, documento: '1029293828', nombre1: 'MELINA', nombre2: 'MARIA',
apellido1: 'MEJÍA', apellido2: 'BEDOYA', direccion: 'Cra 34A #23-45', neighborhood_id: 2, zone_id: 2, 
telefono1: '1223434', telefono2: '', correo: 'melinamb@gmail.com', fechanac: '19/11/1995', 
tipopersona: 'N', estrato: '3', usuario: 'admin')
Person.create(type_document_id: 1, documento: '2039483944', nombre1: 'ESTEFANIA', nombre2: '',
apellido1: 'FLÓREZ', apellido2: '', direccion: 'Calle 47', neighborhood_id: 3, zone_id: 4, 
telefono1: '6432444', telefono2: '', correo: 'estefaniafl@gmail.com', fechanac: '29/08/2000', 
tipopersona: 'N', estrato: '3', usuario: 'admin')
Entity.create(function_id: 1, person_id: 1, usuario: 'admin')
Entity.create(function_id: 1, person_id: 2, usuario: 'admin')
Entity.create(function_id: 1, person_id: 3, usuario: 'admin')
SignalTv.create(entity_id: 1, contrato: '1029302', direccion: 'Calle 11 #24-23', urbanizacion: '', torre: '', 
apto: '', estrato: '4', vivienda: 'P', telefono1: '4540312', telefono2: '', contacto: '', 
neighborhood_id: 1, zone_id: 1, fechacontrato: '01/01/2017', numerotvs: 2, estado: 'A', rate_id: 1, 
precinto: '12321', type_installation_id: 1, technology_id: 1, tiposervicio: 'residencial', 
areainstalacion: 'urbana', usuario: 'admin')
SignalTv.create(entity_id: 2, contrato: '7478382', direccion: 'Cra 34 #98-23', urbanizacion: '', torre: '', 
apto: '', estrato: '3', vivienda: 'P', telefono1: '3298384', telefono2: '', contacto: '', 
neighborhood_id: 2, zone_id: 2, fechacontrato: '04/09/2017', numerotvs: 1, estado: 'A', rate_id: 4, 
precinto: '38493', type_installation_id: 1, technology_id: 1, tiposervicio: 'residencial', 
areainstalacion: 'urbana', usuario: 'admin')
SignalTv.create(entity_id: 3, contrato: '9883923', direccion: 'Cra 78 #28-23', urbanizacion: '', torre: '', 
apto: '', estrato: '2', vivienda: 'A', telefono1: '7489202', telefono2: '', contacto: '', 
neighborhood_id: 3, zone_id: 3, fechacontrato: '15/07/2017', numerotvs: 4, estado: 'A', rate_id: 7, 
precinto: '24232', type_installation_id: 1, technology_id: 1, tiposervicio: 'residencial', 
areainstalacion: 'urbana', usuario: 'admin')





