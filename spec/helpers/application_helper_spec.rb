require "rails_helper"

describe "Application helper" do
  it "returns true if mobile device" do
    session[:mobile_param] = '1'
    request.user_agent = ' OperaGX '
    expect(helper.mobile_device?).to eq true
  end

  it "returns OS if not a mobile device" do
    session[:mobile_param] = false
    request.user_agent = ' webOS '
    expect(helper.mobile_device?).to eq 1
  end
end