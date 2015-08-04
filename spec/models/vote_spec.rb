
require 'rails_helper'

RSpec.describe Vote, type: :model do
	describe "validations" do
		describe "value validation" do
			before do
            	@vote_1 = Vote.create(value:'hi')
            	@vote_2 = Vote.create(value: 1)
            	@vote_3 = Vote.create(value: -1)
            	@vote_4 = Vote.create
            		
           	end
			describe "valid?" do
			
				it "is not valid for value of string" do
					expect(@vote_1.valid?).to eq(false)						
				end
					
				it "is valid for value of 1" do
					expect(@vote_2.valid?).to eq(true)
				end
					
				it "is valid for value of -1" do
					expect(@vote_3.valid?).to eq(true)
				end
					
				it "is not valid when missing a value" do
					expect(@vote_4.valid?).to eq(false)
				end
			end
		
		end
	end
end