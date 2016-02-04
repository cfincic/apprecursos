var ready = function() {

setear_control_fecha("hijo_fecha_nac");

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
};

}

$(document).ready(ready);
$(document).on('page:load', ready);

