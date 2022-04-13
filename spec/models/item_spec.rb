require 'rails_helper'

RSpec.describe Item, type: :model do

  describe 'associations' do
	  it {should have_many :invoice_items}
    it {should belong_to :merchant}
    it {should have_many(:invoices).through(:invoice_items)}
  end

  describe 'validations' do
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:description)}
    it { should validate_presence_of(:unit_price)}
    it { should validate_numericality_of(:unit_price).only_integer }
    it { should validate_numericality_of(:unit_price).is_greater_than(0)}
      let!(:status) { %i[disabled enabled] }
  end

  describe 'class methods' do 
    before :each do 
    @merchant1 = Merchant.create!(name: "Schroeder-Jerde")
    @item1 = @merchant1.items.create!(name: "Item Qui Esse", description: "Nihil autem sit odio inventore deleniti. Est lauda...", unit_price: 75107)
    @item2 = @merchant1.items.create!(name: "Item Autem Minima", description: "Cumque consequuntur ad. Fuga tenetur illo molestia...", unit_price: 67076)
    @item3 = @merchant1.items.create!(name: "Item Ea Voluptatum", description: "Sunt officia eum qui molestiae. Nesciunt quidem cu...", unit_price: 32301)
    @item4 = @merchant1.items.create!(name: "Yabba Dabba", description: "Eat your vitamins", unit_price: 30000, status: 'disabled')
    end
    describe '#enabled_items' do 
      it 'returns all items with enabled status' do 
        expect(@merchant1.items.enabled_items).to eq([@item1, @item2, @item3])
      end
    end

      describe '#disabled_items' do 
      it 'returns all items with disabled status' do 
        expect(@merchant1.items.disabled_items).to eq([@item4])
      end
    end
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
