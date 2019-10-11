require_relative '../lib/dark_trader'

describe "the get_symbol_with_price method" do
  it "should return an array" do
    expect(get_symbol_with_price).to be_instance_of Array
  end
  it "should not be nil" do 
  	expect(get_symbol_with_price).not_to be_nil
  end

end