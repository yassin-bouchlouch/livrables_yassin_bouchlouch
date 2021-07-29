function clr() {
  document.getElementById("txt").value="";
}

//Pour afficher les nombre
function affiche(val) {
  val = document.getElementById("txt").value += val;
}

//Calculer
function calc() {
  var v = document.getElementById("txt").value;
  var y = eval(v);  
  document.getElementById("txt").value = y;
}