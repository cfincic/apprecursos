//USE ESTA
var ready = function() {

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

