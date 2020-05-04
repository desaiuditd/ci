FROM php:7.4

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - \
  && apt-get update && apt-get install -y wget git zip unzip nodejs openssh-client \
  && git config --global user.name "desaiuditd/ci" \
  && wget https://composer.github.io/installer.sig -O - -q | tr -d '\n' > installer.sig \
  && php -r "copy( 'https://getcomposer.org/installer', 'composer-setup.php' );" \
  && php -r "if ( hash_file( 'SHA384', 'composer-setup.php' ) === file_get_contents( 'installer.sig' ) ) { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink( 'composer-setup.php' ); } echo PHP_EOL;" \
  && php composer-setup.php \
  && php -r "unlink( 'composer-setup.php' ); unlink( 'installer.sig' );" \
  && mv composer.phar /usr/local/bin/composer