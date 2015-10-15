//USE ESTA
var ready = function() {

  var currentDate = new Date();

  $('#dato_laboral_fecha_acto').datepicker
  ({
    showOn: 'both',  
    autoclose: true,    
    language: "es",
    format: 'dd/mm/yyyy',
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

   $('#dato_laboral_fecha_curriculum').datepicker
  ({
    showOn: 'both',  
    autoclose: true,    
    format: 'dd/mm/yyyy',
    language: "es"
  });


   $('#dato_laboral_periodo_de_contratacion_attributes_fecha_desde').datepicker
  ({
    showOn: 'both',  
    autoclose: true,    
    format: 'dd/mm/yyyy',
    language: "es"
  });


   $('#dato_laboral_periodo_de_contratacion_attributes_fecha_hasta').datepicker
  ({
    showOn: 'both',  
    autoclose: true,    
    format: 'dd/mm/yyyy',
    language: "es"
  });

  $('#dato_laboral_fecha_curriculum').prop('disabled', true);
  $('#dato_laboral_fecha_apto_fisico').prop('disabled', true);

  $('#sino_fecha_apto_fisico').change(function() {
      //you have an error here in closing the bracket,  also the condition is not proper
      $('#dato_laboral_fecha_apto_fisico').val("");
      if (this.checked) 
        {
          $('#dato_laboral_fecha_apto_fisico').prop('disabled', false);}
      else
        {
          $('#dato_laboral_fecha_apto_fisico').prop('disabled', true);}
  }); 


  $('#sino_fecha_curriculum').change(function() {
      //you have an error here in closing the bracket,  also the condition is not proper
      $('#dato_laboral_fecha_curriculum').val("");
      if (this.checked) 
        {$('#dato_laboral_fecha_curriculum').prop('disabled', false);}
      else
        {$('#dato_laboral_fecha_curriculum').prop('disabled', true);}
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
  }

  $('#area_area_id').change(function() {
           
    $.ajax({
      type: "get",
      dataType: "json",
      url: "/dato_laborals/obtener_direccion_madre" ,      
      data: { area_id: $("#area_area_id").val() },        
      success: function(result){  
                      $("#dato_laboral_depende_direccion").val(result.madre);
                      $("#dato_laboral_jefe_directo").val(result.jefe);  
                      $("#dato_laboral_area").val(result.descripcion);
                  },
      error: function (request, status, error) 
          {             
 
          }
    });             
  });   
};

$(document).ready(ready);
$(document).on('page:load', ready);

