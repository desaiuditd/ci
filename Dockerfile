FROM php:7.4

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get update && apt-get install -y wget git zip unzip nodejs openssh-client
RUN eval $(ssh-agent -s)
RUN echo "$SSH_PRIVATE_KEY" | tr -d '\r' | ssh-add -
RUN mkdir -p ~/.ssh
RUN chmod 700 ~/.ssh
RUN git config --global user.email "desaiuditd+gitlabci@gmail.com"
RUN git config --global user.name "Gitlab CI ThinkPrint"
RUN wget https://composer.github.io/installer.sig -O - -q | tr -d '\n' > installer.sig
RUN php -r "copy( 'https://getcomposer.org/installer', 'composer-setup.php' );"
RUN php -r "if ( hash_file( 'SHA384', 'composer-setup.php' ) === file_get_contents( 'installer.sig' ) ) { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink( 'composer-setup.php' ); } echo PHP_EOL;"
RUN php composer-setup.php
RUN php -r "unlink( 'composer-setup.php' ); unlink( 'installer.sig' );"
