FactoryGirl.define do
  factory :sale do |s|
    s.buyer 'João Silva'
    s.description 'R$10 off R$20 of food'
    s.price 10.0
    s.quantity 2
    s.address '987 Fake St'
    s.provider 'Bobs Pizza'
  end
end