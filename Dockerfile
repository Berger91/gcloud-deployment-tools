FROM google/cloud-sdk

RUN apt-get install -qqy zip

RUN export HELM_VERSION="2.12.3" \
      && mkdir -p /var/tmp/helm-setup \
      && curl -fsSL https://storage.googleapis.com/kubernetes-helm/helm-v${HELM_VERSION}-linux-amd64.tar.gz -o /var/tmp/helm-setup/archive.tar.gz \
      && tar -zxf /var/tmp/helm-setup/archive.tar.gz -C /var/tmp/helm-setup \
      && mv /var/tmp/helm-setup/linux-amd64/helm /usr/local/bin/helm \
      && rm -rf /var/tmp/helm-setup \
      && chmod a+rx /usr/local/bin/helm

#vault (https://releases.hashicorp.com/vault/)
RUN export VAULT_VERSION="1.0.0" \
      && mkdir -p /var/tmp/vault-setup \
      && curl -fsSL https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip -o /var/tmp/vault-setup/archive.zip \
      && unzip /var/tmp/vault-setup/archive.zip -d /var/tmp/vault-setup \
      && mv /var/tmp/vault-setup/vault /usr/local/bin/vault \
      && rm -rf /var/tmp/vault-setup \
      && chmod a+rx /usr/local/bin/vault