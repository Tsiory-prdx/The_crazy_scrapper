require_relative '../lib/cher_depute'

describe "the generate_depute_infos method" do
  it "should return an array" do
    expect(generate_depute_infos).to be_instance_of Array
  end
  it "should not be nil" do 
  	expect(generate_depute_infos).not_to be_nil
  end

end