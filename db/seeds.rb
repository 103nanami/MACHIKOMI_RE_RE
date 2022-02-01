# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = {email: '123@1234',password: '123456'}
Admin.create_with(admin).find_or_create_by!(email: admin[:email])

citys = [
      {id: 1, name: '中野'},
      {id: 2, name: '高円寺'},
      {id: 3, name: '阿佐ヶ谷'},
      {id: 4, name: '荻窪'},
      {id: 5, name: '西荻窪'},
      {id: 6, name: '吉祥寺'},
      {id: 7, name: '三鷹'}
   ]

   citys.each do |city|
      City.create_with(city).find_or_create_by!(name: city[:name])
   end


 columns = [
      {id: 1, title: '中野', text: 'ここにテキストが入ります', city_id: 1, image: open("app/assets/images/nakano_city.jpeg")},
      {id: 2, title: '高円寺', text: 'ここにテキストが入ります', city_id: 2, image: open("app/assets/images/nakano_city.jpeg")},
      {id: 3, title: '阿佐ヶ谷', text: 'ここにテキストが入ります', city_id: 3, image: open("app/assets/images/nakano_city.jpeg")},
      {id: 4, title: '荻窪', text: 'ここにテキストが入ります', city_id: 4, image: open("app/assets/images/nakano_city.jpeg")},
      {id: 5, title: '西荻窪', text: 'ここにテキストが入ります', city_id: 5, image: open("app/assets/images/nakano_city.jpeg")},
      {id: 6, title: '吉祥寺', text: 'ここにテキストが入ります', city_id: 6, image: open("app/assets/images/nakano_city.jpeg")},
      {id: 7, title: '三鷹', text: 'ここにテキストが入ります', city_id: 7, image: open("app/assets/images/nakano_city.jpeg")}
   ]

   columns.each do |column|
      Column.create_with(column).find_or_create_by!(title: column[:title], text: column[:text], city_id: column[:city_id])
   end
   
   
     
