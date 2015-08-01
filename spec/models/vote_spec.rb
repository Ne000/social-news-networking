describe Vote do
	describe "validations" do
		describe "value validation" do
		
			before do
				def valid?
					(Vote.new = 1) || (Vote.new = -1)
				end
			end
			
			it "is valid for value of -1 or 1 as values" do
				expect(Vote.new.valid?).to eq(true)	
			end
		end
	end
end