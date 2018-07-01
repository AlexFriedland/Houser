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

#2007

@h = House.create!(name: "Bayberry", info: "Bayberry house notes", total_income: 0, total_expenses: 0, market_value: 0, purchase_price: 0, value: 0)
@h.years << Year.create!(house_id: @h.id, year: 2007, total_income: 0)
@y = @h.years.last

csv_text = File.read(Rails.root.join('lib', 'seeds', '/Users/Alexander/desktop/dev/houser/lib/seeds/Bayberry07.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

total_income = 0

csv.each do |row|

  if row['Rental'] != nil
    @y.weeks << Week.create(closed?: true, date: "#{row['Rental Week']}")
    week = @y.weeks.last

    week.renters << Renter.create!(week_id: week.id, name: row['Renter'])
    week.deposits << Deposit.create!(week_id: week.id, amount: row['Deposit'].split(" ")[1].gsub(",", "").split(".")[0], returned: true)
    week.rincomes << Rincome.create!(week_id: week.id, amount: row['Rental'].split(" ")[1].gsub(",", "").split(".")[0], percentPaid: 100)
    week.rincomes.last.payments << Payment.create!(rincome_id: week.rincomes.last.id, payment_type: row['Paid'], amount: row['Rental'].split(" ")[1].gsub(",", "").split(".")[0])
    total_income += week.rincomes.last.amount if week.rincomes.last.amount > 0
    week.save
  end
end
@y.total_income = total_income
@y.save
csv_text = nil
csv = nil



#------------------



@h.years << Year.create!(house_id: @h.id, year: 2008, total_income: 0)
@y = @h.years.last

csv_text = File.read(Rails.root.join('lib', 'seeds', '/Users/Alexander/desktop/dev/houser/lib/seeds/Bayberry08.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')



total_income = 0

csv.each do |row|

  if row['Rental'] != nil
    @y.weeks << Week.create(closed?: true, date: "#{row['Rental Week']}")
    week = @y.weeks.last

    week.renters << Renter.create!(week_id: week.id, name: row['Renter'])
    week.deposits << Deposit.create!(week_id: week.id, amount: row['Deposit'].split(" ")[1].gsub(",", "").split(".")[0], returned: true, notes: "#{row['Misc']} #{row['Description']}")
    week.rincomes << Rincome.create!(week_id: week.id, amount: row['Rental'].split(" ")[1].gsub(",", "").split(".")[0])
    week.rincomes.last.payments << Payment.create!(rincome_id: week.rincomes.last.id, payment_type: nil, amount: row['Rental'].split(" ")[1].gsub(",", "").split(".")[0])
    total_income += week.rincomes.last.amount if week.rincomes.last.amount > 0

    week.save
  end
end

@y.total_income = total_income
@h.save
@y.save
csv_text = nil
csv = nil


#------------------
#2009


@h.years << Year.create!(house_id: @h.id, year: 2009, total_income: 0)
@y = @h.years.last

csv_text = File.read(Rails.root.join('lib', 'seeds', '/Users/Alexander/desktop/dev/houser/lib/seeds/Bayberry09.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')



total_income = 0

csv.each do |row|

  if row['Rental'] != nil
    @y.weeks << Week.create(closed?: true, date: "#{row['Rental Week']}")
    week = @y.weeks.last

    week.renters << Renter.create!(week_id: week.id, name: row['Renter'])
    if row['Deposit']
      week.deposits << Deposit.create!(week_id: week.id, amount: row['Deposit'].split(" ")[1].gsub(",", "").split(".")[0], returned: true, notes: "#{row['Misc']}: #{row['Description']}")
    else
      week.deposits << Deposit.create!(week_id: week.id, amount: 0, returned: true, notes: "#{row['Misc']}: #{row['Description']}")
    end
    week.rincomes << Rincome.create!(week_id: week.id, amount: row['Rental'].split(" ")[1].gsub(",", "").split(".")[0])
    week.rincomes.last.payments << Payment.create!(rincome_id: week.rincomes.last.id, payment_type: nil, amount: row['Rental'].split(" ")[1].gsub(",", "").split(".")[0], notes: row['Notes'])
    total_income += week.rincomes.last.amount if week.rincomes.last.amount > 0

    week.save
  end
end

@y.total_income = total_income
@h.save
@y.save
csv_text = nil
csv = nil



puts "done"
puts "years: #{Year.count}"
puts "new weeks: #{Year.last.weeks.count}"

puts "#{@y.total_income}"


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
