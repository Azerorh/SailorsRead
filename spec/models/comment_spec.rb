require 'rails_helper'

describe Comment do
  describe "validations" do
    it { should validate_presence_of :author }
    it { should validate_presence_of :body }
    it { should validate_length_of(:body).is_at_most(4000) }
  end

  describe "associations" do
    it { should belong_to :article }
  end
end