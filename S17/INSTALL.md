
# TSSR-2402-P3-G1-BuildYourInfra-BillU

## INSTALL GUIDE Infrastructure sécurisée pour BillU

### Sommaire

    -FreePBX

    -Apache
    

## 1 - FreePBX

👉 Installation

✔️ Pré-requis: 1 Go de RAM et 20 Go de disque dur

L'ISO peut se récupérer ![ici](https://www.freepbx.org/downloads/)

Au démarrage de la VM, dans la liste, choisir la version recommandée.

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G1-BuildYourInfra-BillU/blob/main/RESSOURCES/FreePBX001.png?raw=true)

Puis sélectionner `Graphical Installation - Output to VGA`.

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G1-BuildYourInfra-BillU/blob/main/RESSOURCES/FreePBX002.png?raw=true)

Enfin choisir `FreePBX Standard`

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G1-BuildYourInfra-BillU/blob/main/RESSOURCES/FreePBX003.png?raw=true)

Pendant l'installation, il faut configurer le mot de passe root (`Root password is not set` s'affiche).

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G1-BuildYourInfra-BillU/blob/main/RESSOURCES/FreePBX004.png?raw=true)

Clique sur ROOT PASSWORD et entre un mot de passe (robuste, est-il besoin de le préciser ?) pour le compte root.

Le clavier est en anglais donc attention aux lettres des touches du clavier QWERTY !

Puis rebbot la machine à la fin de l'installation

Au redémarrage de la machine, se connecter en root et changer le clavier en FR en tapant

``` bash
localectl set-locale LANG=fr_FR.utf8
localectl set-keymap fr
localectl set-x11-keymap fr
```

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G1-BuildYourInfra-BillU/blob/main/RESSOURCES/FreePBX007.png?raw=true)

Puis changer la configuration IP en tapant!

``` bash
nano /etc/sysconfig/network-scripts/ifcfg-eth0
```

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G1-BuildYourInfra-BillU/blob/main/RESSOURCES/FreePBX006.png?raw=true)

💻 Connexion en web

A partir de ton navigateur web, connecte-toi sur l'adresse du serveur et tu arriveras sur l'interface de gestion de FreePBX. Ici j'ai pointé le DNS pour pouvoir y accéder en tapant http://freepbx comme URL

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G1-BuildYourInfra-BillU/blob/main/RESSOURCES/FreePBX009.png?raw=true)

⚙️ Démarrage et première configuration

Par l'interface web, connecte-toi en root sur la VM avec le mot de passe associé (à mettre 2 fois).

Indique également une addresse mail pour les notifications et clique sur Setup System

Dans la fenêtre, clique sur FreePBX Administration et reconnecte-toi en root.

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G1-BuildYourInfra-BillU/blob/main/RESSOURCES/FreePBX010.png?raw=true)

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G1-BuildYourInfra-BillU/blob/main/RESSOURCES/FreePBX011.png?raw=true)

Laisse les langages par défaut et clique sur Submit

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G1-BuildYourInfra-BillU/blob/main/RESSOURCES/FreePBX012.png?raw=true)

A la fenêtre d'activation du firewall, clique sur Abort

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G1-BuildYourInfra-BillU/blob/main/RESSOURCES/FreePBX013.png?raw=true)

A la fenêtre de l'essais de SIP Station clique sur Not Now

Tu arrive sur le tableau de bord, clique sur Apply Config (en rouge)pour valider tout ce que tu viens de faire

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G1-BuildYourInfra-BillU/blob/main/RESSOURCES/FreePBX014.png?raw=true)

💻 Activation du serveur

Cette activation n'est pas obligatoire, mais elle permet d'avoir accès à l'ensemble des fonctionnalités du serveur.

Va dans le menu Admin puis System Admin.

[](https://github.com/WildCodeSchool/TSSR_Resources/blob/main/Ressources_quetes/freePBX-16.png?raw=true)

Un message indique que le système n'est pas activé.

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G1-BuildYourInfra-BillU/blob/main/RESSOURCES/FreePBX015.png?raw=true)

Clique sur Activation puis Activate

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G1-BuildYourInfra-BillU/blob/main/RESSOURCES/FreePBX016.png?raw=true)

Dans la fenêtre qui s'affiche, clique sur Activate

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G1-BuildYourInfra-BillU/blob/main/RESSOURCES/FreePBX017.png?raw=true)

Entre une adresse email et attend quelques instant.

Dans la fenêtre qui s'affiche, renseigne les différentes informations, et :

    Pour Which best describes you mets I use your products and services with my Business(s) and do not want to resell it
    Pour Do you agree to receive product and marketing emails from Sangoma ? coche No
    Clique sur Create

![](https://github.com/WildCodeSchool/TSSR_Resources/blob/main/Ressources_quetes/freePBX-19.png?raw=true)

Dans la fenêtre d'activation, clique sur Activate et attends que l'activation se fasse.

Dans les fenêtres qui s'affichent, clique sur Skip.

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G1-BuildYourInfra-BillU/blob/main/RESSOURCES/FreePBX018.png?raw=true)

🗓️ Update des modules du serveur

La fenêtre de mise-à-jour des modules va s'afficher automatiquement.

Clique sur Update Now.

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G1-BuildYourInfra-BillU/blob/main/RESSOURCES/FreePBX019.png?raw=true)

Attend la mise-à-jour de tous les modules.

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G1-BuildYourInfra-BillU/blob/main/RESSOURCES/FreePBX020.png?raw=true)

Une fois que tout est terminé, clique sur Apply config.

Il peut y avoir des erreurs sur le serveurs suite à la mise-à-jour des modules et dans ce cas, l'accès au serveur ne se fait pas.

Les modules incriminés sont précisés et il faut les réinstaller et les activer.

Dans ce cas, sur le serveur en CLI, exécute les commandes suivantes :

fwconsole ma install <module>

fwconsole ma enable <module>

Par exemple pour les modules userman, voicemail, et sysadmin :

fwconsole ma install userman

fwconsole ma enable userman

fwconsole ma install voicemail

fwconsole ma enable voicemail

fwconsole ma install sysadmin

fwconsole ma enable sysadmin

Va sur le serveur en CLI et exécute la commande yum update pour faire la mise-à-jour du serveur.

Répond y lorsque cela sera demandé.

Redémarre le serveur

🗓️ Update complémentaire des modules

Connecte-toi en root via la console web, et vas dans le Dashboard pour voir s'il te manque des modules.

Vas dans le menu Admin puis Modules Admin, et dans l'onglet Module Update.

Dans la fenêtre qui s'affiche, dans la colonne Status, sélectionne ceux qui sont en Disabled; Pending Upgrade... et qui ont une licence GPL.

Sélectionne alors le bouton Upgrade to ....

Quand tu as géré tous les modules, clique sur Process.

Dans la fenêtre qui apparaît, clique sur Confirm.

Quand tout est terminé, clique sur Apply config.

🏗️ Création d'utilisateurs et de lignes sur le serveur

Va dans le menu Applications puis Extensions

Va sur sur l'onglet SIP [chan_pjsip] Extensions puis ici je choisi un utilisateurs de l'AD (Erwan Faure et Camille Martin pour l'exemple )

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G1-BuildYourInfra-BillU/blob/main/RESSOURCES/FreePBX023.png?raw=true)

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G1-BuildYourInfra-BillU/blob/main/RESSOURCES/FreePBX021.png?raw=true)

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G1-BuildYourInfra-BillU/blob/main/RESSOURCES/FreePBX022.png?raw=true)

🔬 Installation du logiciel SIP sur les postes clients

Prendre la source ![ici](https://github.com/WildCodeSchool/TSSR-2402-P3-G4-BuildYourInfra-Pharmgreen/blob/main/Ressources/3cxphone6%20(1).msi)

⚙️ Configuration du logiciel SIP

Sur l'écran du SIP phone, clique sur Set account pour avoir la fenêtre Accounts.

En cliquant sur New, la fenêtre de création de compte Account settings apparaît.

💬 Communication entre les postes

En cliquant sur l'icone contact ( le troisieme en partant de la gauche en bas )

Nous ajoutons sur nos deux postes le contact de l'autre puis nous pouvons les appeller sans taper leur numéro

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G1-BuildYourInfra-BillU/blob/main/RESSOURCES/FreePBX024.png?raw=true)

![](https://github.com/WildCodeSchool/TSSR-2402-P3-G1-BuildYourInfra-BillU/blob/main/RESSOURCES/FreePBX026.png?raw=true)


## 2 - Apache2

👉 Installation

✔️ Pré-requis: 4 Go de RAM et 10 Go de disque dur 

On commence par `apt-get update`

On installe ensuite *Apache2*

![2024-07-02 16_35_40-wcs-cyber-node05 - Proxmox Console](https://github.com/WildCodeSchool/TSSR-2402-P3-G1-BuildYourInfra-BillU/assets/161461625/ba9c2780-4154-43a2-a844-6efe47993fe9)

On vérifie que tout fonctionne

![2024-07-02 16_36_56-wcs-cyber-node05 - Proxmox Console](https://github.com/WildCodeSchool/TSSR-2402-P3-G1-BuildYourInfra-BillU/assets/161461625/22bafd5c-38a2-416a-b277-c912ed69ff5a)

On peut ensuite avoir l'accès via un navigateur sur une autre machine avec l'adresse IP `172.19.11.5` ( celle du serveur )

![2024-07-02 16_38_45-QEMU (G1-WIN-Client) - noVNC](https://github.com/WildCodeSchool/TSSR-2402-P3-G1-BuildYourInfra-BillU/assets/161461625/7490b1c7-f2d5-4e37-8a7b-8879185bde7d)

On vient ensuite crée un dossier "répertoire" pour le site web

![2024-07-02 16_40_35-wcs-cyber-node05 - Proxmox Console](https://github.com/WildCodeSchool/TSSR-2402-P3-G1-BuildYourInfra-BillU/assets/161461625/508bdebc-d940-4bd3-9da2-4902d976bc52)

On se déplace dans le dossier en question

![2024-07-02 16_42_36-wcs-cyber-node05 - Proxmox Console](https://github.com/WildCodeSchool/TSSR-2402-P3-G1-BuildYourInfra-BillU/assets/161461625/8ad2b97d-ce4b-4b7c-ac56-38da8c56a654)

On va venir créer un fichier `index.html`

![2024-07-02 16_43_05-wcs-cyber-node05 - Proxmox Console](https://github.com/WildCodeSchool/TSSR-2402-P3-G1-BuildYourInfra-BillU/assets/161461625/b3146d30-db58-4614-99c6-95ad66909bbc)

On va l'éditer de façon basique

![2024-07-02 16_46_12-wcs-cyber-node05 - Proxmox Console](https://github.com/WildCodeSchool/TSSR-2402-P3-G1-BuildYourInfra-BillU/assets/161461625/75e9b3f1-811b-4519-8177-6882f672d62f)



![2024-07-02 16_55_46-wcs-cyber-node05 - Proxmox Console](https://github.com/WildCodeSchool/TSSR-2402-P3-G1-BuildYourInfra-BillU/assets/161461625/cee1c4c1-2a54-400b-b301-2235379c9f58)


On va créer ou éditer le fichier ci dessous 

![2024-07-02 17_57_23-wcs-cyber-node05 - Proxmox Console](https://github.com/WildCodeSchool/TSSR-2402-P3-G1-BuildYourInfra-BillU/assets/161461625/a6cb6fcc-14d9-42aa-aec5-4e21d339cb29)


On va activer l'hote virtuel avec la commande

```
a2ensite site-billu.conf

```

Relancer le service apache2


```
systemctl reload apache2
```


On vérifie les fichiers de configuration 


![2024-07-02 17_14_55-wcs-cyber-node05 - Proxmox Console](https://github.com/WildCodeSchool/TSSR-2402-P3-G1-BuildYourInfra-BillU/assets/161461625/22591f35-ea6b-488b-88f5-2a46f7b9bab8)

Relancer le service apache2 ( oui encore )


```
systemctl reload apache2
```

On retourne sur le client, on va éditer le fichier host en rajoutant l'IP et l'adresse


![2024-07-02 17_21_38-QEMU (G1-WIN-Client) - noVNC](https://github.com/WildCodeSchool/TSSR-2402-P3-G1-BuildYourInfra-BillU/assets/161461625/3f67c831-9176-4172-99b7-e893fc5fb842)


![2024-07-02 17_22_20-QEMU (G1-WIN-Client) - noVNC](https://github.com/WildCodeSchool/TSSR-2402-P3-G1-BuildYourInfra-BillU/assets/161461625/fc713cbb-2995-40a4-96d9-97415a0c3613)


![2024-07-02 17_22_32-QEMU (G1-WIN-Client) - noVNC](https://github.com/WildCodeSchool/TSSR-2402-P3-G1-BuildYourInfra-BillU/assets/161461625/d444f90c-8a55-4ed2-81fc-db1c4725fb9a)


Vous pouvez essayer avec l'adresse et c'est tout bon 


![2024-07-02 17_22_49-QEMU (G1-WIN-Client) - noVNC](https://github.com/WildCodeSchool/TSSR-2402-P3-G1-BuildYourInfra-BillU/assets/161461625/7d8017ca-d0d1-428b-a07b-3e03d62681bf)


Vous pouvez toujours éditer le fichier `index.htlm` pour une page plus qualitative.

Fin








 
