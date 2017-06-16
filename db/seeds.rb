# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Rake::Task['db:drop'].invoke
Rake::Task['db:create'].invoke
Rake::Task['db:migrate'].invoke

def random_brand_id
  Brand.offset(rand(Brand.count)).first.id
  # brands_quantity = Brand.count
  # brands_random_offset = rand(brands_quantity)
  # random_brand = Brand.offset(brands_random_offset).first
  # random_brand_id = random_brand_id
  # random_brand_id
end

def upload_fake_logo
  uploader = LogoUploader.new(Brand.new, :logo)
  uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'lib/tasks/logos', '*')).sample))
  uploader
end

def upload_fake_image
  uploader = ImageUploader.new(Sneaker.new, :image)
  uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'lib/tasks/sneakers', '*')).sample))
  uploader
end



Brand.create([
  {
    name: 'NIKE',
    logo: upload_fake_logo
  }, {
    name: 'ADIDAS',
    logo: upload_fake_logo
  }, {
    name: 'NEW BALANCE',
    logo: upload_fake_logo
  } , {
    name: 'REEBOK',
    logo: upload_fake_logo
  } , {
    name: 'PUMA',
    logo: upload_fake_logo
  } , {
    name: 'ASICS',
    logo: upload_fake_logo
  } , {
    name: 'Jordan',
    logo: upload_fake_logo
  }
])

def create_brand
  Brand.create(
    logo:    upload_fake_logo
  )
end

@sneaker_models = ['huarache', 'air', 'superstar']

@sneaker_sexes = ['men', 'women']

def sneaker_price
  rand(3600..9900)
end

def create_sneaker
  Sneaker.create(
    brand_id: random_brand_id,
    model:    @sneaker_models.sample,
    sex:      @sneaker_sexes.sample,
    price:    sneaker_price,
    image:    upload_fake_image
  )
end

100.times do
  sneaker = create_sneaker
  puts "Sneaker #{sneaker.id} created"
end
