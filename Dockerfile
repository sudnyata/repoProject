FROM python 
RUN pip install flask
WORKDIR /src
COPY . .
EXPOSE 5000
CMD python3 flaskproj.py

