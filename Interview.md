# Interview

## What is the difference between a security group and a NACL?

A security group is a stateful firewall that is attached to an instance. It controls the inbound and outbound traffic for that instance only.
A NACL (Network Access Control List) is a stateless firewall that is attached to a subnet. It controls the inbound and outbound traffic for that subnet.

### stateful vs stateless, what is the difference?

Stateful means that the firewall remembers the state of the connection. If a connection is established, the firewall will allow the return traffic. This is the default behavior of a firewall.

Stateless means that the firewall does not remember the state of the connection. If a connection is established, the firewall will not allow the return traffic. This is the default behavior of a NACL.

## What is a VPC?

A VPC is a virtual network in AWS. It is a logical isolation of the AWS cloud. It allows you to launch AWS resources into a virtual network that you've defined. 