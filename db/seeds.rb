# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or create!d alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create!([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create!(name: 'Luke', movie: movies.first)


=begin
#create! house  and year
@h = House.create!!(name: "Bayberry")
@h.years << Year.create!!(house_id: @h.id, year: 2007, total_income: 0)
@y = @h.years.first

#add empty weeks
@y.weeks << Week.create!(year_id: @y.id, date: "June 2", closed?: true)
@y.weeks << Week.create!(year_id: @y.id, date: "June 9", closed?: true)
@y.weeks << Week.create!(year_id: @y.id, date: "June 16", closed?: true)
@y.weeks << Week.create!(year_id: @y.id, date: "June 23", closed?: true)
@y.weeks << Week.create!(year_id: @y.id, date: "June 23", closed?: true)

#add first rented week, 2007
@y.weeks << Week.create!(year_id: @y.id, date: "June 30", closed?: true)

#add renter to week
@y.weeks.last.renters << Renter.create!(week_id: @y.weeks.last.id, name: "Steven Vondran", notes: "$400 more")

#add deposit to week
@y.weeks.last.deposits << Deposit.create!(week_id: @y.weeks.last.id, amount: 500)

#add rental income to week, and payment to rentalincome
@y.weeks.last.rental_incomes << RentalIncome.create!(week_id: @y.weeks.last.id, amount: 5895, percentPaid: 100)

#******
@y.weeks.last.rental_incomes.last.payments << Payment.create!(rental_income_id: @y.weeks.last.rental_incomes.last.id, amount: 5895, payment_type: "CK")


@week.renters << @renter
@renter.weeks << @week
@week.deposits << @deposit

@rental_income.payments << @payment
@week.rental_incomes << @rental_income
=end
