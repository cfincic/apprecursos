require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe FamiliarsController do

  # This should return the minimal set of attributes required to create a valid
  # Familiar. As you add validations to Familiar, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "relacion" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # FamiliarsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all familiars as @familiars" do
      familiar = Familiar.create! valid_attributes
      get :index, {}, valid_session
      assigns(:familiars).should eq([familiar])
    end
  end

  describe "GET show" do
    it "assigns the requested familiar as @familiar" do
      familiar = Familiar.create! valid_attributes
      get :show, {:id => familiar.to_param}, valid_session
      assigns(:familiar).should eq(familiar)
    end
  end

  describe "GET new" do
    it "assigns a new familiar as @familiar" do
      get :new, {}, valid_session
      assigns(:familiar).should be_a_new(Familiar)
    end
  end

  describe "GET edit" do
    it "assigns the requested familiar as @familiar" do
      familiar = Familiar.create! valid_attributes
      get :edit, {:id => familiar.to_param}, valid_session
      assigns(:familiar).should eq(familiar)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Familiar" do
        expect {
          post :create, {:familiar => valid_attributes}, valid_session
        }.to change(Familiar, :count).by(1)
      end

      it "assigns a newly created familiar as @familiar" do
        post :create, {:familiar => valid_attributes}, valid_session
        assigns(:familiar).should be_a(Familiar)
        assigns(:familiar).should be_persisted
      end

      it "redirects to the created familiar" do
        post :create, {:familiar => valid_attributes}, valid_session
        response.should redirect_to(Familiar.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved familiar as @familiar" do
        # Trigger the behavior that occurs when invalid params are submitted
        Familiar.any_instance.stub(:save).and_return(false)
        post :create, {:familiar => { "relacion" => "invalid value" }}, valid_session
        assigns(:familiar).should be_a_new(Familiar)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Familiar.any_instance.stub(:save).and_return(false)
        post :create, {:familiar => { "relacion" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested familiar" do
        familiar = Familiar.create! valid_attributes
        # Assuming there are no other familiars in the database, this
        # specifies that the Familiar created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Familiar.any_instance.should_receive(:update).with({ "relacion" => "MyString" })
        put :update, {:id => familiar.to_param, :familiar => { "relacion" => "MyString" }}, valid_session
      end

      it "assigns the requested familiar as @familiar" do
        familiar = Familiar.create! valid_attributes
        put :update, {:id => familiar.to_param, :familiar => valid_attributes}, valid_session
        assigns(:familiar).should eq(familiar)
      end

      it "redirects to the familiar" do
        familiar = Familiar.create! valid_attributes
        put :update, {:id => familiar.to_param, :familiar => valid_attributes}, valid_session
        response.should redirect_to(familiar)
      end
    end

    describe "with invalid params" do
      it "assigns the familiar as @familiar" do
        familiar = Familiar.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Familiar.any_instance.stub(:save).and_return(false)
        put :update, {:id => familiar.to_param, :familiar => { "relacion" => "invalid value" }}, valid_session
        assigns(:familiar).should eq(familiar)
      end

      it "re-renders the 'edit' template" do
        familiar = Familiar.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Familiar.any_instance.stub(:save).and_return(false)
        put :update, {:id => familiar.to_param, :familiar => { "relacion" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested familiar" do
      familiar = Familiar.create! valid_attributes
      expect {
        delete :destroy, {:id => familiar.to_param}, valid_session
      }.to change(Familiar, :count).by(-1)
    end

    it "redirects to the familiars list" do
      familiar = Familiar.create! valid_attributes
      delete :destroy, {:id => familiar.to_param}, valid_session
      response.should redirect_to(familiars_url)
    end
  end

end