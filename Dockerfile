FROM python:3.7-stretch

RUN apt-get update \
  && apt-get install -y libnss-wrapper gettext \
  && apt-get clean
COPY passwd.template /passwd.template

ENV LD_PRELOAD=libnss_wrapper.so \
  NSS_WRAPPER_PASSWD=/tmp/passwd \
  NSS_WRAPPER_GROUP=/etc/group

RUN pip3 install ansible

WORKDIR /

COPY ./entrypoint.sh ./entrypoint.sh
COPY ./playbook.yml ./playbook/playbook.yml

RUN chmod +x ./entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]

CMD [ "ansible-playbook", "./playbook/playbook.yml" ]