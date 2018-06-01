# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or create!d alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create!([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create!(name: 'Luke', movie: movies.first)


=begin
#create! house  and year
@h = House.create!(name: "Bayberry")
@h.years << Year.create!(house_id: @h.id, year: 2007, total_income: 0)
@y = @h.years.first

#add empty weeks
@y.weeks << Week.create!(year_id: @y.id, date: "June 2", closed?: true)
@y.weeks << Week.create!(year_id: @y.id, date: "June 9", closed?: true)
@y.weeks << Week.create!(year_id: @y.id, date: "June 16", closed?: true)
@y.weeks << Week.create!(year_id: @y.id, date: "June 23", closed?: true)
@y.weeks << Week.create!(year_id: @y.id, date: "June 23", closed?: true)

#add first rented week, 2007
@y.weeks << Week.create!(year_id: @y.id, date: "June 30", closed?: true)

#create week variable
@w = @y.weeks.last

#add renter to week
@w.renters << Renter.create!(week_id: @w.id, name: "Steven Vondran", notes: "$400 more")

#add deposit to week
@w.deposits << Deposit.create!(week_id: @w.id, amount: 500)

#add rental income to week, and payment to rentalincome
@w.rincomes << Rincome.create!(week_id: @w.id, amount: 5895, percentPaid: 100)

#******
@w.rincomes.last.payments << Payment.create!(rincome_id: @w.rincomes.last.id, amount: 5895, payment_type: "CK")


=end
