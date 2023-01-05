FROM python:3.12.0a1-alpine

# Add scripts to the path of the running container
ENV PATH="/scripts:${PATH}"

COPY ./requirements.txt ./requirements.txt
#Required Alpine packages to install uWSGI
#Using no cahce to keep the container light weight
#virtual tmp allows to store this dependecies in tmp folder and remove them later
RUN apk add --update --no-cache --virtual .tmp gcc libc-dev linux-headers
RUN pip install -r /requirements.txt

#delete uneeded dependecies
RUN apk del .tmp

RUN mkdir /app
COPY ./app /app
WORKDIR /app

# Add scripts and make them exceutable
COPY ./scripts /scripts
RUN chmod +x /scripts/*

#Creates directories inside docker image
RUN mkdir -p /vol/web/media
RUN mkdir -p /vol/web/static

#create a new non-root user as root of /vol application
RUN adduser -D user
RUN chown -R user:user /vol
#Other users can only read but not modify
RUN chmod -R 755 /vol/web
USER user

CMD ["entrypoint.sh"]