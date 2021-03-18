FROM python:3.7.10-slim-buster

# copy source and install dependencies
RUN mkdir -p /opt/app/martor_demo
COPY requirements.txt start-server.sh /opt/app/
COPY martor_demo /opt/app/martor_demo/
WORKDIR /opt/app
RUN pip install -r requirements.txt 
RUN chown -R www-data:www-data /opt/app

# start server
EXPOSE 8020
CMD ["/opt/app/start-server.sh"]