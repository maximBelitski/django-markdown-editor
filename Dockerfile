FROM python:3.7.10-slim-buster

# copy source and install dependencies
RUN mkdir -p /opt/app/martor_demo
COPY requirements.txt /opt/app/
COPY martor_demo /opt/app/martor_demo/
WORKDIR /opt/app
RUN pip install -r requirements.txt 
RUN chown -R www-data:www-data /opt/app
USER www-data
# start server
EXPOSE 8000
CMD ["python","/opt/app/martor_demo/manage.py", "runserver", "0.0.0.0:8000"]