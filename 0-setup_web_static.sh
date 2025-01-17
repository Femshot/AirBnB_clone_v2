#!/usr/bin/env bash
# Sets up your web servers for the deployment of web_static

sudo apt-get update
sudo apt-get -y install nginx

sudo mkdir -p /data/web_static/releases/test
sudo mkdir -p /data/web_static/shared

echo '<html>
  <head>
	<title>Test Page</title>
  </head>
  <body>
    <h1>A SIMPLE PAGE</h1>
  </body>
</html>' > /data/web_static/releases/test/index.html

sudo ln -sf /data/web_static/releases/test /data/web_static/current
sudo chown -hR ubuntu:ubuntu /data


sudo sed -i "53 i \\\tlocation /hbnb_static/ {\n\t\talias /data/web_static/current/;\n\t}\n" /etc/nginx/sites-available/default

sudo service nginx start
