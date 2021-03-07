#Best practice not to run container as a root 
FROM nginxinc/nginx-unprivileged:1-alpine

#Copy configuration to location where ngnix will look for configurations
COPY ./default.conf /etc/nginx/conf.d/default.conf
COPY ./uwsgi_params /etc/nginx/uwsgi_params

USER root 

#Create a new static folder 
RUN mkdir -p /vol/static

#Owner will have full access other users have read-only
RUN chmod 755 /vol/static

#Switch back to unprivileged user
USER nginx