require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it "product will be created successfully" do
      product = Product.create({
        name: 'test',
        price: 2.5,
        quantity: 5,
        category_id: Category.create({name: 'Furniture'}).id
      })

      expect(product.valid?).to be true
    end

    it "Name is empty" do
      product = Product.create({
        price: 2.5,
        quantity: 5,
        category_id: Category.create({name: 'Furniture'}).id
      })

      expect(product.valid?).to be false
    end

    it "price is empty" do
      product = Product.create({
        name: 'test',
        quantity: 5,
        category_id: Category.create({name: 'Furniture'}).id
      })

      expect(product.valid?).to be false
    end

    it "quantity is empty" do
      product = Product.create({
        name: 'test',
        price: 2.5,
        category_id: Category.create({name: 'Furniture'}).id
      })

      expect(product.valid?).to be false
    end


    it "category_id is empty" do
      product = Product.create({
        name: 'test',
        price: 2.5,
        quantity: 2,
      })

      expect(product.valid?).to be false
    end
    
  end
end

# it validates :name, presence: true
# it validates :price, presence: true
# it validates :quantity, presence: true
# it validates :category, presence: true

# create_table "categories", force: :cascade do |t|
#   t.string   "name"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end
