# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create(email: "admin@email.com",
             password: "password",
             password_confirmation: "password"
            )

User.create(name: "tester",
            email: "tester@email.com",
            password: "password",
            password_confirmation: "password",
            nickname: "tester",
            gender: "male"
           )

StoreManager.create(email: "store_manager@email.com",
                    name: "store_manager",
                    password: "password"
                   )

5.times do |n|
  Store.create(store_name: "abc_store-#{n}",
             adress: "japan-aichi-nagoya#{n}",
             store_phonenumber: "08012345678#{n}",
             store_description: SecureRandom.alphanumeric(120),
             store_manager_id: 1
            )
end

Masseur.create(masseur_name: "cororo",
               email: "cororo@email.com",
               password: "password",
               password_confirmation: "password",
               store_id: 1
              )

Favorite.create(user_id: 1,
                masseur_id: 1
               )

Review.create(review: "so good",
               rate: 3.5,
               user_id: 1,
               masseur_id: 1
               )

Category.create(category_name: "オステオパシー"
               )

MasseurCategory.create(
                       masseur_id: 1,
                       category_id: 1,
                      )
