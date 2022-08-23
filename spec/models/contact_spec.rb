require 'rails_helper'

describe Contact do
  describe "validations" do
    it { should validate_presence_of :email }
    it { should validate_presence_of :message }
  end
end