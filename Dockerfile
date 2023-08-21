FROM python:3.10

LABEL version ="1.0"
LABEL maintainer="gouzigou"

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN mkdir /djangoworkflowtest
COPY .  /djangoworkflowtest

WORKDIR /djangoworkflowtest

RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple -r requirements.txt 
CMD python manage.py runserver 0.0.0.0:8000  