FROM python:3.10

ARG DJANGO_SECRET_KEY

LABEL version ="1.0"
LABEL maintainer="gouzigou"

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

ENV DJANGO_SECRET_KEY $DJANGO_SECRET_KEY

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN mkdir /djangoworkflowtest
RUN mkdir /static  
COPY .  /djangoworkflowtest

WORKDIR /djangoworkflowtest

RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple -r requirements.txt 
#CMD python manage.py runserver 0.0.0.0:8000  
RUN python manage.py collectstatic 

CMD  uwsgi --ini  uwsgi.ini