$(document).on('click', '#abrirModal', (function() 
{
    $.get(
        $(this).data('url'),
        function (data) 
        {
            $('.modal-body').html(data);
            $('#modal').modal();
        }
    ).done( function(data)
    {
        $(document).on('click', '#createButton', (function() 
        {
            //Se fuerza la validacion en el primer campo en caso de que el form este vacio
            $('#create-instructor-form input').trigger('blur');
            alert($('#modal').find('.has-error').length);
            if ( $('#modal').find('.has-error').length != 0)
            {   
                $.post( '/cur-instructor/ajax_create', $('#create-instructor-form').serialize())
                .done( function(data)
                {
                    $('#dropdown_ins').append(
                        $('<option></option>').val(data.id).html(data.nombre).attr('selected', true)
                    )

                    $('#modal').modal('hide'); 
                });
            }
        }));       
    });
}));