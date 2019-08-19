FROM tiangolo/uwsgi-nginx-flask:python3.6-alpine3.7
RUN apk --update add bash nano nano curl
ENV STATIC_URL /static
ENV STATIC_PATH /app/static
RUN mkdir /var/uwsgi 
RUN chown nginx /var/uwsgi 
COPY ./requirements.txt /var/www/requirements.txt
COPY ./nginx.conf /etc/nginx/conf.d/nginx.conf
RUN pip install -r /var/www/requirements.txt


