
docker-coldfusion11
===================
Updated from idguk & naag. Added functionality to silently install ColdFusion hotfix to bring ColdFusion_11 up to the latest update/revision. 

The current build is 'ColdFusion 11, Update 11'. However, the 'update' can be changed by editing the update URL in the 'install-hotfix.sh' file. 

https://helpx.adobe.com/coldfusion/kb/coldfusion-11-updates.html


===================

Updated from naag original to work with later phusion/baseimage:0.9.17 i.e ubuntu Trusty
Also loads in php to work with Apache and adds modrewrite.
The variant of Apache2 that Trusty uses works slightly different so changes were made to accomodate that and a default conf host file overwrites the installed default one enabling /var/www as the root and enabling .htaccess functionality.

ColdFusion 11 as Docker image on Ubuntu 14.04. Run

Build the Docker container:

    docker build -t cf11 .

And run it with:

    docker run -d --name="mycf11" -p 80:80 -v /var/www:/var/www cf11
    
To expose cfadmin add -p 8500:8500

Issues:
-------
1. Password set in installer.properties still doesnt get picked up, so login to running container (docker exec -it mycf11 bash and reset password using /opt/coldfusion11/cfusion/bin/passwordreset.sh script - cd to that directory to run, then restart ./coldfusion stop) 

Useful commands
---------------
    docker rm $(docker ps -a -q)
    docker rmi cf11
    docker rm mycf11
    sudo service apache2 restart
