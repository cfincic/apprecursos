//USE ESTA
var ready = function() {

$('#agente_cuil').inputmask('99-99999999-9', { clearMaskOnLostFocus: true, placeholder: ' ' });
$('#agente_num_legajo').inputmask('9999', { clearMaskOnLostFocus: true, placeholder: ' ' });
$('#agente_numero_doc').inputmask('99.999.999', { clearMaskOnLostFocus: true, placeholder: ' ' });

$("#agente_apellido").on('railsAutocomplete.select', function(event, data){ 
  if(data.item.id != "")
   {traer_agente_buscado(data.item.id);}
  else
   {}
});

  function traer_agente_buscado(agente_id)
  {
      $.ajax({
      type: "get",
      dataType: "json",
      url: "/agentes/traer_lista_de_agentes",    
      data: { agente_id: agente_id },
      success: function(data){         
            if (data  == "")
              { alert("No se encontraron resultados") }
            else
            { 
              $('#tabla_agentes').html(data); 
              $("#agente_apellido").val("");
            }   
      },
      error: function (request, status, error) 
          { 
          }
    });       
  }


setear_control_fecha("agente_fecha_nac");
setear_control_fecha("agente_expira_certificado");


function setear_control_fecha(nombre_control) 
{
  var currentDate = new Date();

  $('#'+nombre_control).datepicker
  ({
    showOn: 'both',  
    autoclose: true,    
    format: 'dd/mm/yyyy',
    language: "es"
  });

  //$('#'+nombre_control).datepicker("setDate", currentDate);
}

// agente_provincia_id
// agente_localidad_id
  (function() {
    jQuery(function() {
      var localidades, llenarLocalidades; 
      llenarLocalidades = function(localidades) {
        var provincia, options;
        provincia = $('#agente_provincia_id :selected').text();
        options = $(localidades).filter("optgroup[label='" + provincia + "']").html();
        if (options) {
          $('#agente_localidad_id').html('<option value="">seleccione...</option>');
          return $('#agente_localidad_id').append(options);
        } 
        else {
          return $('#agente_localidad_id').empty();
        }
      };
      localidades = $('#agente_localidad_id').html();
      llenarLocalidades(localidades);
      return $('#agente_provincia_id').change(function() {
        return llenarLocalidades(localidades);
      });
    }); 
  }).call(this);
};

$(document).ready(ready);
$(document).on('page:load', ready);

