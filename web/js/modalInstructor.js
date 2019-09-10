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
            //Se fuerza la validacion en caso de que el form este vacio
            var $form = $("#create-instructor-form"), 
                data = $form.data("yiiActiveForm");
            $.each(data.attributes, function() {
                this.status = 3;
            });
            $form.yiiActiveForm("validate");

         
            if ($('#create-instructor-form').find('.has-error').length==0)
            {   
                alert($('#modal').find('.has-error').length);
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