<?php
//initialisation du session
session_start();

//initialisation de tableau des participants
// $list_participants2=[];

 // Trouver ou créer le tableau dans Session
 //nom
 if( isset( $_SESSION['liste_nomS'] ) ) {
    $liste_nom =  $_SESSION['liste_nomS'] ;
 }elseif(isset($liste_nom)) {
   $_SESSION['liste_nomS'] =  $liste_nom;
 }
//prenom
if( isset( $_SESSION['liste_prenomS'] ) ) {
    $liste_prenom =  $_SESSION['liste_prenomS'] ;
 }elseif(isset($liste_prenom)) {
   $_SESSION['liste_prenomS'] =  $liste_prenom;
 }

   //Email
if( isset( $_SESSION['liste_emailS'] ) ) {
    $liste_email =  $_SESSION['liste_emailS'] ;
 }elseif(isset($liste_email)) {
   $_SESSION['liste_emailS'] =  $liste_email;
 }

 




  // Ajouter le nom et email dans le tableau
  if (isset($_POST["nom"])||isset($_POST["prenom"])||isset($_POST["email"])) {
    $liste_nom[] = $_POST["nom"];
    $liste_prenom[] = $_POST["prenom"];
    $liste_email[] = $_POST["email"];
    
   
     
  }

  
  // Enregistrer le tableau dans la session
  if (isset($liste_nom)&&isset($liste_prenom)&&isset($liste_email) ){
    $_SESSION['liste_nomS'] =  $liste_nom;
    $_SESSION['liste_prenomS'] =  $liste_prenom;
    $_SESSION['liste_emailS'] =  $liste_email;
    
  }
// session_destroy()

?>
<!doctype html>
<html>
<head>
<meta charset="utf-8" />
<link rel='stylesheet' type='text/css' href='style.css'>
<title>Formulaire v2</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
</head>
<body>

<h1>list des participants : </h1>


    <div class="table">
    <table >
      <thead>
        <tr>
          <th>Nom</th>
          <th>Prénom</th>
          <th>Email</th>
          
        </tr>
      </thead>
    </table>
  </div>
  <div class="table">
    <table >
      <tbody>
      <?php 
        //affichage des participant
        if (empty($liste_nom)) {
          echo "Aucun participant a enregistrer ";
        }else {
          $j=0;
          for ($i=0; $i <sizeof($liste_nom); $i++){     
          if($j==0){
            echo "<tr >";
            echo "<td>".$liste_nom[$i]."</td>";
            echo "<td>".$liste_prenom[$i]."</td>";
            echo "<td>".$liste_email[$i]."</td>";
            
            
            echo "<tr>";
            $j++;
          }else{
              echo "<tr>";
              echo "<td>".$liste_nom[$i]."</td>";
              echo "<td>".$liste_prenom[$i]."</td>";
              echo "<td>".$liste_email[$i]."</td>";
              
              
              echo "<tr>";
              $j=0;
            }       
            }
        }
    ?> 
      </tbody>
    </table>
  </div>


    <div class="btns">
    <button id="print" type="button" value="Imprimer" onclick="window.print()">Print
   
   
    
 
</body>

</html>

<?php
    
 ?>