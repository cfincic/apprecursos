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

describe DatoContactosController do

  # This should return the minimal set of attributes required to create a valid
  # DatoContacto. As you add validations to DatoContacto, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "telefono_casa" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # DatoContactosController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all dato_contactos as @dato_contactos" do
      dato_contacto = DatoContacto.create! valid_attributes
      get :index, {}, valid_session
      assigns(:dato_contactos).should eq([dato_contacto])
    end
  end

  describe "GET show" do
    it "assigns the requested dato_contacto as @dato_contacto" do
      dato_contacto = DatoContacto.create! valid_attributes
      get :show, {:id => dato_contacto.to_param}, valid_session
      assigns(:dato_contacto).should eq(dato_contacto)
    end
  end

  describe "GET new" do
    it "assigns a new dato_contacto as @dato_contacto" do
      get :new, {}, valid_session
      assigns(:dato_contacto).should be_a_new(DatoContacto)
    end
  end

  describe "GET edit" do
    it "assigns the requested dato_contacto as @dato_contacto" do
      dato_contacto = DatoContacto.create! valid_attributes
      get :edit, {:id => dato_contacto.to_param}, valid_session
      assigns(:dato_contacto).should eq(dato_contacto)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new DatoContacto" do
        expect {
          post :create, {:dato_contacto => valid_attributes}, valid_session
        }.to change(DatoContacto, :count).by(1)
      end

      it "assigns a newly created dato_contacto as @dato_contacto" do
        post :create, {:dato_contacto => valid_attributes}, valid_session
        assigns(:dato_contacto).should be_a(DatoContacto)
        assigns(:dato_contacto).should be_persisted
      end

      it "redirects to the created dato_contacto" do
        post :create, {:dato_contacto => valid_attributes}, valid_session
        response.should redirect_to(DatoContacto.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved dato_contacto as @dato_contacto" do
        # Trigger the behavior that occurs when invalid params are submitted
        DatoContacto.any_instance.stub(:save).and_return(false)
        post :create, {:dato_contacto => { "telefono_casa" => "invalid value" }}, valid_session
        assigns(:dato_contacto).should be_a_new(DatoContacto)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        DatoContacto.any_instance.stub(:save).and_return(false)
        post :create, {:dato_contacto => { "telefono_casa" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested dato_contacto" do
        dato_contacto = DatoContacto.create! valid_attributes
        # Assuming there are no other dato_contactos in the database, this
        # specifies that the DatoContacto created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        DatoContacto.any_instance.should_receive(:update).with({ "telefono_casa" => "MyString" })
        put :update, {:id => dato_contacto.to_param, :dato_contacto => { "telefono_casa" => "MyString" }}, valid_session
      end

      it "assigns the requested dato_contacto as @dato_contacto" do
        dato_contacto = DatoContacto.create! valid_attributes
        put :update, {:id => dato_contacto.to_param, :dato_contacto => valid_attributes}, valid_session
        assigns(:dato_contacto).should eq(dato_contacto)
      end

      it "redirects to the dato_contacto" do
        dato_contacto = DatoContacto.create! valid_attributes
        put :update, {:id => dato_contacto.to_param, :dato_contacto => valid_attributes}, valid_session
        response.should redirect_to(dato_contacto)
      end
    end

    describe "with invalid params" do
      it "assigns the dato_contacto as @dato_contacto" do
        dato_contacto = DatoContacto.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        DatoContacto.any_instance.stub(:save).and_return(false)
        put :update, {:id => dato_contacto.to_param, :dato_contacto => { "telefono_casa" => "invalid value" }}, valid_session
        assigns(:dato_contacto).should eq(dato_contacto)
      end

      it "re-renders the 'edit' template" do
        dato_contacto = DatoContacto.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        DatoContacto.any_instance.stub(:save).and_return(false)
        put :update, {:id => dato_contacto.to_param, :dato_contacto => { "telefono_casa" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested dato_contacto" do
      dato_contacto = DatoContacto.create! valid_attributes
      expect {
        delete :destroy, {:id => dato_contacto.to_param}, valid_session
      }.to change(DatoContacto, :count).by(-1)
    end

    it "redirects to the dato_contactos list" do
      dato_contacto = DatoContacto.create! valid_attributes
      delete :destroy, {:id => dato_contacto.to_param}, valid_session
      response.should redirect_to(dato_contactos_url)
    end
  end

end