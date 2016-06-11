#!/bin/sh

set -e

# start logging
service rsyslog start

# enable IP forwarding
service pptpconfig start

exec "$@"
