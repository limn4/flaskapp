FROM ubuntu:16.04
LABEL updated_on="2019-10-18 09:00"

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install python3 python3-setuptools python3-pip gunicorn3
RUN apt-get -y install python-setuptools python-dev build-essential python-pip
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 10

COPY virt-assign3 /flaskapp
WORKDIR /flaskapp

RUN pip install --upgrade pip
RUN pip3 install -r requirements.txt

EXPOSE 8080
RUN chmod 775 startup.sh
ENTRYPOINT "./startup.sh"
