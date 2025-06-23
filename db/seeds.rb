# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.create(username: 'user1', password: 'password')
# User.create(username: 'user2', password: 'password')
# User.create(username: 'admin', password: 'password', admin: true)
# User.create(username: 'admin2', password: 'password', admin: true)
admin_user = User.last
admin_user.items.create!(make: "Мінімийка високого тиску Karcher" , model: "K 3 Car & Home",
                                   price: 120, desc: "Мінімийка високого тиску K3 Car&Home легко справляється з будь-якими забрудненнями. Оснащена 6-метровим шлангом високого тиску, вона прекрасно підходить для періодичного прибирання навколо будинку і в саду, наприклад для очищення садових меблів, терас, доріжок і майданчиків, а також для миття автомобілів. Комплект для миття автомобіля та прибирання навколо будинку (Car&Home) містить мийну щітку для видалення з кузова нальоту бруду, насадку для пінного чищення, яка формує стійку піну з потужним очищувальним ефектом, автомобільний шампунь (500 мл), пристосування для очищення поверхонь T1 та мийний засіб Patio&Deck (500 мл). Струменева трубка Vario Power дає змогу легко регулювати тиск залежно від виду поверхні, що очищається. Фреза для бруду, що формує обертовий точковий струмінь, видаляє навіть стійкі забруднення. Насос захищений фільтром для води, що подається на вхід, гарантує довгий термін його служби. Завдяки колесам апарат можна легко переміщати до різних місць застосування.",
                                    image_url: "https://i.moyo.ua/img/products/5759/52_600.jpg")

