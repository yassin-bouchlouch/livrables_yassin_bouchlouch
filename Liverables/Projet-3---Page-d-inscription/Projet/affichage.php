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

<title>Formulaire v2</title>

<link rel="stylesheet" href="affichage.css">
</head>
<body>




    <div class="tbl-header">
    <table cellpadding="0" cellspacing="0" border="0">
      <thead>
        <tr>
          <th>Nom</th>
          <th>Prénom</th>
          <th>Email</th>
          
        </tr>
      </thead>
    </table>
  </div>
  <div class="tbl-content">
    <table cellpadding="0" cellspacing="0" border="0">
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
    <a href="index.php"><button href="" type="button" value="Retour">Back</a>
    
    <button type="button" value="Fermer" onclick="window.close()">Close


    </div>
    
    <script>
   
    var background=document.getElementsByName()("tr");
        background.style.backgroundColor="red";

        // '.tbl-content' consumed little space for vertical scrollbar, scrollbar width depend on browser/os/platfrom. Here calculate the scollbar width .
$(window).on("load resize ", function() {
  var scrollWidth = $('.tbl-content').width() - $('.tbl-content table').width();
  $('.tbl-header').css({'padding-right':scrollWidth});
}).resize();

   </script>
   
</body>

</html>

<?php
    
 ?>