docker-tomcat
=============
This is a simple docker image file that gives you a repeatable 
[Java](http://java.com/en/download/index.jsp)/[Tomcat](http://tomcat.apache.org/download-70.cgi)
container running in a CentOS environment. Laying down your application or
any specific configuration details are beyond the scope of this example.

## Dependencies
You'll obviously need a working version of [Docker](http://docker.io) to follow
this example. You can follow the [documentation](http://docs.docker.io/installation/#installation)
to get it setup or, if you're on an Ubuntu 12.04 machine (my test box), you can simply:
```
curl -s https://get.docker.io/ubuntu/ | sudo sh
```

## Installation
```
$ git clone https://github.com/danielkennedy/docker-tomcat.git
$ cd docker-tomcat
$ wget http://download.oracle.com/otn-pub/java/jdk/7u55-b13/jdk-7u55-linux-x64.tar.gz
$ wget https://www.apache.org/dist/tomcat/tomcat-7/v7.0.53/bin/apache-tomcat-7.0.53.tar.gz
$ sudo docker build -t docker-tomcat .
$ sudo docker run -d -p 8080:8080 docker-tomcat
$ sudo docker ps
```

## Verification
Of course, the quickest way to verify that Tomcat is listening and the port is
exposed is to simply point a browser to [localhost on port 8080](http://localhost:8080). Beyond that, you can:
```
$ sudo netstat -antp | grep 8080
tcp6       0      0 :::8080                 :::*                    LISTEN      629/docker
$ wget localhost:8080
--2014-04-17 12:53:51--  http://localhost:8080/
Resolving localhost (localhost)... 127.0.0.1
Connecting to localhost (localhost)|127.0.0.1|:8080... connected.
HTTP request sent, awaiting response... 200 OK
Length: unspecified [text/html]
Saving to: `index.html'

    [ <=>                                                                                                ] 11,197      --.-K/s   in 0s      

2014-04-17 12:53:51 (137 MB/s) - `index.html' saved [11197]
```

## Next steps
Now you need to deployyour web application. Chef? More Docker? Your choice.
