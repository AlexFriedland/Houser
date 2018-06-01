# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


@y = Year.create(year: 2007)
@y.weeks << Week.create(date: "June 2", closed?: true)
@y.weeks << Week.create(date: "June 9", closed?: true)
@y.weeks << Week.create(date: "June 16", closed?: true)
@y.weeks << Week.create(date: "June 23", closed?: true)
@y.weeks << Week.create(date: "June 23", closed?: true)


@y.weeks << @w1
