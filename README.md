# apache-rails

Docker image 

Apache + passenger+ rails docker image.


This image consisting of Apache and passenger configured on the top of rails official image. 
To build this image Run Following Command

navigate to the root folder 



 docker build -t apache-rails .

To run this image


 docker run -tid -p 80:80  apache-rails


