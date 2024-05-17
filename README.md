# haproxy-docker

[![version)](https://img.shields.io/docker/v/crashvb/haproxy/latest)](https://hub.docker.com/repository/docker/crashvb/haproxy)
[![image size](https://img.shields.io/docker/image-size/crashvb/haproxy/latest)](https://hub.docker.com/repository/docker/crashvb/haproxy)
[![linting](https://img.shields.io/badge/linting-hadolint-yellow)](https://github.com/hadolint/hadolint)
[![license](https://img.shields.io/github/license/crashvb/haproxy-docker.svg)](https://github.com/crashvb/haproxy-docker/blob/master/LICENSE.md)

## Overview

This docker image contains a docker [HAProxy](https://haproxy.com/).

## Entrypoint Scripts

### haproxy

The embedded entrypoint script is located at `/etc/entrypoint.d/haproxy` and performs the following actions:

1. A new haproxy configuration is generated using the following environment variables:

 | Variable | Default Value | Description |
 | -------- | ------------- | ----------- |

## Standard Configuration

### Container Layout

```
/
├─ etc/
│  ├─ entrypoing.d/
│  │  └─ haproxy
│  └─ healthcheck.d/
│     └─ haproxy
└─ usr/
   └─ local/
      ├─ etc/
      │  └─ haproxy/
      │     └─ haproxy.cfg
      └─ sbin/
         └─ haproxy
```

### Exposed Ports

None.

### Volumes

None.

## Development

[Source Control](https://github.com/crashvb/haproxy-docker)

* [Configuration Manual](https://www.haproxy.com/documentation/haproxy-configuration-manual/latest/)

