FROM redis:5.0.5
FROM python:3.8

ENV DEBIAN_FRONTEND noninteractive

RUN apt update && apt install python3 curl netcat-openbsd -y
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py 
RUN python3 get-pip.py

COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt

COPY ./start.sh /
RUN chmod +x /start.sh

EXPOSE 3333

ENTRYPOINT ["/start.sh"]
