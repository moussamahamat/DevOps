FROM python:3.7
WORKDIR /data
ADD student_age.py /data
ADD student_age.json /data

ENV FLASK_APP student_age.py
ENV FLASK_RUN_HOST 0.0.0.0
COPY requirements.txt requirements.txt

RUN apt-get update && apt-get install -y libldap2-dev libsasl2-dev
RUN pip install flask-simpleldap
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install Flask-HTTPAuth
RUN pip3 install http-basic-auth

COPY . .
CMD ["flask", "run"]
