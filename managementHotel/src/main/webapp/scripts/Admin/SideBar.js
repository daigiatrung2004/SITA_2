$(document).ready(function(){
   $(".item#anchor-hr").click(function(){
            // alert("co click vao day");
            $("#div-hr-amdin").slideToggle();
   });
   $("#menu-hotel").click(function(){
      $("#div-manager-hotel-admin").slideToggle();
   });
   $("#menu-transport").click(function(){
      $("#div-manager-trans-admin").slideToggle();
   });
});