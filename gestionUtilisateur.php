<?php
$bdd = new PDO('mysql:host=localhost;dbname=cyberbase;charset=utf8', 'root', '');
$reponse = $bdd->query('SELECT * FROM utilisateur');
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>CyberBase</title>
	<style type="text/css" media="screen, print">
        @font-face {
          font-family: "Bebas";
          src: url("Police/BEBAS___.TTF");
        }
    </style>
<link href="styles.css" rel="stylesheet" type="text/css" />
</head>

    <body>
    	<div class="Container">
        
            <header>
            	<a href="index.html"><img class="Logo" src="img/cyberbaselogo.png"/></a>
        
                <div class="Menu">
                    
                    <ul>
                        <li>
                            <a href="gestionUtilisateur.php">GESTION DES UTILISATEUR</a>
                        </li>
                        <li>
                            GESTION DU PARC
                        </li>
                        <li>
                            <a href="gestionUsager.php">GESTION DES USAGERS</a>
                        </li>
                        <li>
                            GESTION DES PLANNINGS
                        </li>
                        <li>
                            STATISTIQUES
                        </li>
                    </ul>
                    
                 </div>
                 
             </header>
            
            <a href="AjouterUtilisateur.php"><div style="width:30px; height:30px; background-color: grey; display: block; float: left; margin-left: 100px; margin-top: 50px; font-size: 20px; font-family: Bebas; color: white ">+</div></a>

             <div  class="Corps">
                 
                 
             	<div class="TableauUtilisateur">
                
                		<div class="LigneUtilisateur"><div class="Tab0">Nom</div><div class="Tab0">Prenom</div><div class="Tab0">Site de reference</div><div class="Tab0">Structure</div></div>
				<?php
				while ($donnees = $reponse->fetch())
				 {
				?>
                		<div class="LigneUtilisateur">
                        <div class="Tab1"><?php echo $donnees['Nom'];?></div><div class="Tab1"><?php echo $donnees['Prenom'];?></div><div class="Tab1"><?php echo $donnees['idSite'];?></div><div class="Tab1"><?php echo $donnees['Structure'];?></div>
                        </div>
                <?php
                }
				$reponse->closeCursor();
                ?>        
           		
				</div>
			</div>
		</div>
        
	</body>
</html>
