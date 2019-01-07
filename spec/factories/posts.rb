FactoryBot.define do 
	factory :post do 
		caption "nofilter"
		image Rack::Test::UploadedFile.new(Rails.root + 'spec/files/images/grad_photo1.jpg', 'image/jpg')
		association :user
  	end 
end 