    # Pull base image.
    FROM dockerfile/centos

    
    RUN  yum install epel-release
    RUN  yum install httpd

    RUN cd /etc/httpd/conf/ && sed 's/Listen 80/Listen 88/g' httpd.conf
    
    RUN rpm -Uvh https://mirror.webtatic.com/yum/el7/epel-release.rpm
    RUN rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm
    RUN yum install -y php56w php56w-opcache php56w-mysqlnd

    RUN firewall-cmd --add-port=8080/tcp --permanent


    RUN yum install nginx





    RUN firewall-cmd --add-service=http --permanent


    # Define mountable directories.
    VOLUME [ "/var/www/html"]

    # Define working directory.
    WORKDIR /etc/nginx

    # Define default command.
    CMD ["nginx"]

    # Expose ports.
    EXPOSE 80
    EXPOSE 443