//USE ESTA
var ready = function() {

  var currentDate = new Date();

  $('#dato_laboral_fecha_acto').datepicker
  ({
    showOn: 'both',  
    autoclose: true,    
    format: 'dd/mm/yyyy',
    language: "es"
  });


  $('#dato_laboral_fecha_ingreso').datepicker
  ({
    showOn: 'both',  
    autoclose: true,    
    format: 'dd/mm/yyyy',
    language: "es"
  });

  $('#dato_laboral_fecha_apto_fisico').datepicker
  ({
    showOn: 'both',  
    autoclose: true,    
    format: 'dd/mm/yyyy',
    language: "es"
  });

   $('#dato_laboral_fecha_apto_curriculum').datepicker
  ({
    showOn: 'both',  
    autoclose: true,    
    format: 'dd/mm/yyyy',
    language: "es"
  });


  for (var i = 0; i <= 3; i++) {      
    var field_name = '#dato_laboral_situacion_revistas_attributes_'+i+'_fecha_alta'
    $(field_name).datepicker
    ({
      showOn: 'both',  
      autoclose: true,    
      format: 'dd/mm/yyyy',
      language: "es"
    }); 
    $(field_name).datepicker("setDate", currentDate); 
  }

};

$(document).ready(ready);
$(document).on('page:load', ready);

