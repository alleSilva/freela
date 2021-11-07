FactoryBot.define do
  factory :project do
    title { 'Loja virtual' }
    description { 'Loja virtual com várias opções de frete e pagamaentos' }
    skills { 'HTML, CSS, Javascript' }
    max_payment_hour { 80 }
    remote { true }
    limit_bid_date  { 7.days.from_now }
    project_owner
  end
end
