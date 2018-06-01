# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


=begin
#create house income and year
@h = House.create!(name: "Bayberry")
@h.years << Year.create!(year: 2007, total_income: 0)

#add income and year to house
@h.years << @y

#add empty weeks
@y.weeks << Week.create(date: "June 2", closed?: true)
@y.weeks << Week.create(date: "June 9", closed?: true)
@y.weeks << Week.create(date: "June 16", closed?: true)
@y.weeks << Week.create(date: "June 23", closed?: true)
@y.weeks << Week.create(date: "June 23", closed?: true)

#add first rented week, 2007
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
=end
