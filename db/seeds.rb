# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or create!d alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create!([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create!(name: 'Luke', movie: movies.first)


#spreadsheet setup
require 'pry'
require 'csv'

@h = House.create!(name: "Bayberry", info: "Bayberry house notes")
@h.years << Year.create!(house_id: @h.id, year: 2007)
@y = @h.years.first

csv_text = File.read(Rails.root.join('lib', 'seeds', '/Users/Alexander/desktop/dev/houser/lib/seeds/Untitled.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  binding.pry
  week = Week.new(closed?: true, date: "#{row['Rental Week']}")
  if row['Rental'] != nil
    deposit = Deposit.new(amount: "#{row['Deposit']}", returned: true)
    rincome = Rincome.new(amount: "#{row['Rental']}")
    renter = Renter.new(name: "#{row['Renter']}")
    payment = Payment.new(paid: "#{row['Paid']}")
  end


  week.save;deposit.save;rincome.save;renter.save;payment.save
  @y.weeks << week
  puts "#{t.street}, #{t.city} saved"
end




=begin
old code
#create! house  and year
@h = House.create!(name: "Bayberry", info: "Bayberry house notes")
@h.years << Year.create!(house_id: @h.id, year: 2007)
@y = @h.years.first

weeks_array = [

]

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
