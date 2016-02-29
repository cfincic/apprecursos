var ready = function() {

setear_control_fecha("dato_laboral_fecha_acto");
setear_control_fecha("dato_laboral_fecha_ingreso");
setear_control_fecha("dato_laboral_fecha_apto_fisico");
setear_control_fecha("dato_laboral_fecha_examen_periodico");
setear_control_fecha("dato_laboral_fecha_curriculum");
setear_control_fecha("dato_laboral_fecha_antecedentes_penales");
setear_control_fecha("dato_laboral_periodo_de_contratacion_attributes_fecha_desde");
setear_control_fecha("dato_laboral_periodo_de_contratacion_attributes_fecha_hasta");

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

  $('#dato_laboral_fecha_curriculum').prop('disabled', true);
  $('#dato_laboral_fecha_apto_fisico').prop('disabled', true);
  $('#dato_laboral_fecha_antecedentes_penales').prop('disabled', true);

      
  $('#sino_fecha_antecedentes_penales').change(function() {
      //you have an error here in closing the bracket,  also the condition is not proper
      $('#dato_laboral_fecha_antecedentes_penales').val("");
      if (this.checked) 
        {$('#dato_laboral_fecha_antecedentes_penales').prop('disabled', false);}
      else
        {$('#dato_laboral_fecha_antecedentes_penales').prop('disabled', true);}
  }); 

  $('#sino_fecha_apto_fisico').change(function() {
      //you have an error here in closing the bracket,  also the condition is not proper
      $('#dato_laboral_fecha_apto_fisico').val("");
      if (this.checked) 
        {$('#dato_laboral_fecha_apto_fisico').prop('disabled', false);}          
      else
        {$('#dato_laboral_fecha_apto_fisico').prop('disabled', true);}          
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


   $("#dato_laboral_sede_id").change(function() {
    var id = $("#dato_laboral_sede_id").val();                
    traer_datos_de_sede(id)         
  }); 

  function traer_datos_de_sede(sede_id)  
  {    
    $.ajax({
      url: "/dato_laborals/obtener_datos_de_sede",
      dataType: "json",
      //contentType: "application/json", no va, si no envias un jsSSon!!!
      type: "get",
      data: { sede_id: sede_id },                
      success:function(data){                                                
          $("#dato_laboral_direccion_laboral").val(data.direccion)
          $("#dato_laboral_telefono").val(data.telefono1)
          $("#dato_laboral_interno").val(data.telefono2)        
        }, 
        error: function (request, status, error) 
          { 
            //blanquear_campos();
          }
      });   
  }

};

$(document).ready(ready);
$(document).on('page:load', ready);

