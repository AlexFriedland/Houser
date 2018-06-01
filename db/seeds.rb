# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@h = House.create(name: "Bayberry")
@y = Year.create(year: 2007)
@y.weeks << Week.create(date: "June 2", closed?: true)
@y.weeks << Week.create(date: "June 9", closed?: true)
@y.weeks << Week.create(date: "June 16", closed?: true)
@y.weeks << Week.create(date: "June 23", closed?: true)
@y.weeks << Week.create(date: "June 23", closed?: true)

@w = Week.create(date: "June 30", closed?: true)
@r = Renter.create(name: "Steven Vondran", notes: "$400 more")
@d = Deposit.create(amount: 500)

@ri = RentalIncome.create(amount: 5895, percentPaid: 100)
@p = Payment.create(amount: 5895, type: "CK")

@w.renters << @r
