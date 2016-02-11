/**
 * Created by mindundi on 11/02/16.
 */
<script>
$(document).ready(function(){
    $("#login").on('click',function(){
        $("#modal").modal({show:true});
    });
    $("#close").on('click',function(){
        $("#modal").modal('hide');
    });
});
</script>