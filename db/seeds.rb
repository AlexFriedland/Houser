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

@week = Week.create(date: "June 30", closed?: true)
@renter = Renter.create(name: "Steven Vondran", notes: "$400 more")
@deposit = Deposit.create(amount: 500)

@rental_income = RentalIncome.create(amount: 5895, percentPaid: 100)
@payment = Payment.create(amount: 5895, payment_type: "CK")

@week.renters << @renter
@renter.weeks << @week
@week.deposits << @deposit

@rental_income.payments << @payment
@week.rental_incomes << @rental_income
