FactoryGirl.define do  

	factory :payment do
    user nil
    product nil
  end

	factory :product do
	  sequence(:name) { |n| "product #{n}"}

    factory :product_with_comments do
      transient do
        comments_count 5
      end

      after(:create) do |product, evaluator|
        create_list(:comment, evaluator.comments_count, product: product)
      end
    end
  end

	factory :user do
		sequence(:email) { |n| "person#{n}@email.com"}
		password "test1234"
	end

	factory :comment do
		rating 3
		body "Decent."
		user
		product
	end

end