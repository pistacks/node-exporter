# node-exporter
Node Exporter for ARM | PiStacks

## Version

- pistacks/node-exporter:0.18.1

## Test Node Name in Prometheus:

```
sum(node_memory_MemAvailable_bytes * on(instance) group_left(node_id, node_name) node_meta) by (node_id, node_name)

{node_id="4efss5i3a2qd11yrnsaphhjqq",node_name="rpi-01"}	540819456
{node_id="lwi4pcdgxqiu2kt8omzt1af0p",node_name="rpi-03"}	659771392
{node_id="rjtt9bj8hvqrpjuvb031cmfv8",node_name="rpi-04"}	624553984
```
