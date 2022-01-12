FROM wordpress

# copy themes 
COPY ./themes /usr/src/wordpress/wp-content/themes

# copy plugins 
COPY ./plugins /usr/src/wordpress/wp-content/plugins

# add more stuff here if you want some other preinstalled wp-content