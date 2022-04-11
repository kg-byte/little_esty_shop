require 'rails_helper'

RSpec.describe Item, type: :model do

  describe 'associations' do
	  it {should have_many :invoice_items}
    it {should belong_to :merchant}
  end

  describe 'validations' do
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:description)}
    it { should validate_presence_of(:unit_price)}
    it { should validate_numericality_of(:unit_price).only_integer }
    it {should validate_numericality_of(:unit_price).is_greater_than(0)}
  end


  describe 'instance methods' do 

    before (:each) do
      @merchant1 = Merchant.create!(name: "Klein, Rempel and Jones")
      @merchant2 = Merchant.create!(name: "Williamson Group")

      @item1 = @merchant1.items.create!(name: "Item Ea Voluptatum", description: "A thing that does things", unit_price: 7654)
      @item2 = @merchant1.items.create!(name: "Item Quo Magnam", description: "A thing that does nothing", unit_price: 10099)
      @item3 = @merchant1.items.create!(name: "Item Voluptatem Sint", description: "A thing that does everything", unit_price: 8790)
      @item4 = @merchant2.items.create!(name: "Item Rerum Est", description: "A thing that barks", unit_price: 3455)
      @item5 = @merchant2.items.create!(name: "Item Itaque Consequatur", description: "A thing that makes noise", unit_price: 7900)
    end
    describe '.selling_price' do 
      it 'returns selling_price as big decimal' do 
        expect(@item1.selling_price).to eq(76.54.to_d)
      end
    end
  end
end
