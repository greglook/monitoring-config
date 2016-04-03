Monitoring Configuration
========================

This repo contains some Ansible playbooks and roles to configure a monitoring
stack consisting of [Tensor](https://readthedocs.org/projects/tensor/),
[Riemann](http://riemann.io/), [InfuxDB](https://influxdata.com/), and
[Grafana](https://grafana.org/) (TRIG for short).

The playbooks here are targeted at running these services on FreeBSD hosts, but
should be adaptable to other systems fairly simply. Targeting FreeBSD lets me
use jails to run these as containerized services on a FreeNAS host, which
provides a nice GUI for administering them.
