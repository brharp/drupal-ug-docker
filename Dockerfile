FROM registry.access.redhat.com/rhel7:latest
COPY drupal.repo /etc/yum.repos.d/drupal.repo
RUN subscription-manager register --username=${RHN_USERNAME} --password=${RHN_PASSWORD}
RUN subscription-manager attach
RUN yum -y --enablerepo=drupal install php drupal*
RUN subscription-manager unregister
EXPOSE 80
COPY drupal.conf /etc/httpd/conf.d/drupal.conf
CMD httpd -DFOREGROUND
