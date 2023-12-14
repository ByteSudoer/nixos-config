_:
{
  project.name = "webapp";
  services = {
    webserver = {
      service = {
        image = "httpd:latest";
        ports = [ "8000:80" ];
      };

    };
    phpmyadmin = {
      image.enableRecommendedContents = true;
      service = {
        image = "phpmyadmin:latest";
        ports = [ "3000:80" ];
        environment = {
          PMA_HOST = "mysql";
          PMA_USER = "root";
          PMA_PASSWORD = "root";
          PMA_PORT = "3306";

          PMA_ARBITRARY = "1";
        };
      };
    };
    mysql = {
      image.enableRecommendedContents = true;
      service = {
        image = "mysql:latest";
        ports = [ "3036:3036" ];
        volumes = [ "${toString ./.}/mysql:/var/lib/mysql" ];
        environment = {
          MYSQL_ROOT_PASSWORD = "root";
        };
      };

    };

  };
}
