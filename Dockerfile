FROM python:3.7-stretch
RUN pip3 install --user ansible
ENV PATH=$PATH:/root/.local/bin

WORKDIR /root

COPY ./entrypoint.sh ./entrypoint.sh
COPY ./playbook.yml ./playbook/playbook.yml

RUN chmod +x ./entrypoint.sh

ENTRYPOINT [ "/root/entrypoint.sh" ]

CMD [ "ansible-playbook", "./playbook/playbook.yml" ]