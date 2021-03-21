FROM anisfathallah/py-ubuntu:base

# Ansible versions : https://pypi.org/project/ansible/#history
ARG ANSIBLE_VERSION
ENV ANSIBLE_VERSION=${ANSIBLE_VERSION}
LABEL ansible_version=${ANSIBLE_VERSION}

RUN pip install --no-cache-dir ansible==$ANSIBLE_VERSION \
    && adduser --system ansible

ENV PATH $PATH:/home/ansible/.local/bin

USER ansible
WORKDIR /home/ansible

CMD    ["/bin/bash"]