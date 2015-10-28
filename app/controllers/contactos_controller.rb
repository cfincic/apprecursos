#encoding: utf-8
class ContactosController < ApplicationController
	def create
    @agente = Agente.find(params[:agente_id])
    @contacto = @agente.contactos.create(contacto_params)
    redirect_to agente_path(@agente)
  end
 
  private
    def contacto_params
      params.require(:contacto).permit(:telefono, :email)
    end
end
