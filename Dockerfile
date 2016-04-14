    # Pull base image.
    FROM centos

    
    RUN yum install wget -y

    RUN  wget http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
    RUN  rpm -ivh epel-release-7-5.noarch.rpm

    RUN  wget http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el7.rf.x86_64.rpm
    RUN  rpm -Uvh rpmforge-release-0.5.3-1.el7.rf.x86_64.rpm

    RUN wget http://dag.wieers.com/rpm/packages/RPM-GPG-KEY.dag.txt
    RUN rpm --import RPM-GPG-KEY.dag.txt

    RUN  yum install httpd -y

    RUN wget https://raw.githubusercontent.com/Legun/Docker-Webserver/master/httpd.conf -O /etc/httpd/conf/httpd.conf

    RUN rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm    
    RUN yum install -y php56w php56w-opcache php56w-mysqlnd

#    RUN firewall-cmd --add-port=8080/tcp --permanent


    RUN yum install nginx -y
#    RUN yum install git -y

    RUN wget https://raw.githubusercontent.com/Legun/Docker-Webserver/master/nginx.conf -O /etc/nginx/nginx.conf





#    RUN firewall-cmd --add-service=http --permanent


    # Define mountable directories.
    VOLUME [ "/var/www/html"]

    # Define working directory.
    WORKDIR /etc/nginx

    # Define default command.
    CMD ["nginx"]

    # Expose ports.
    EXPOSE 80
    EXPOSE 443
    EXPOSE 8080
