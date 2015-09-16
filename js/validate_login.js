// JavaScript Document
// Form Validation
function formValidator(){
 // Make quick references to our fields
 
 var username = document.getElementById('username');
 var password = document.getElementById('password'); 
 // Check each input in the order that it appears in the form!
    if(lengthRestriction(username, 6, 8)){
      if(notEmpty(password, "Please Enter Password")){
       return true;
      } 
 
   }
 return false;
function notEmpty(elem, helperMsg){
 if(elem.value.length == 0){
  alert(helperMsg);
  elem.focus(); // set the focus to this input
  return false;
 }
 return true;
}

function lengthRestriction(elem, min, max){
 var uInput = elem.value;
 if(uInput.length >= min && uInput.length <= max){
  return true;
 }else{
  alert("Please enter between " +min+ " and " +max+ " characters");
  elem.focus();
  return false;
 }
}
}