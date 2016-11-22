# service management
docker_service:
  service.running:
    - name: docker
    - enable: True

libvirt_service:
  service.running:
    - name: libvirtd
    - enable: True
