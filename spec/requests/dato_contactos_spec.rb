require 'spec_helper'

describe "DatoContactos" do
  describe "GET /dato_contactos" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get dato_contactos_path
      response.status.should be(200)
    end
  end
end
