/**
 * Created by mindundi on 11/02/16.
 */
$(document).ready(function(){
    $("#login").on('click',function(){
        $("#modal").modal({show:true});
    });
    /*
    $("#square").on('click',function(){
        $("#modal").modal({show:true});
    });
    //*/
    $("#close").on('click',function(){
        $("#modal").modal('hide');
    });
});