fuel-ssl-openstack
==================

This plugin implements selective TLS for OpenStack endpoints. It allows you to
enable/disable TLS per endpoint per service (e.g. you can have TLS connection
for admin Keystone endoint and for all public services except Glance; for all
other services plain HTTP will be used). Also it gives you opportunity to use
different certificate per each endpoint.
