FactoryBot.define do
  factory :proposal do
    resume { 'Tenho 5 anos de experiência com lojas virtuais' }
    payment_hour { 100 }
    week_hours { 30 }
    conclusion_date { 30.days.from_now }
  end
end
