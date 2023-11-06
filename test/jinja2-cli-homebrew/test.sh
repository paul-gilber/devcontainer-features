#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "jinja2 --version" jinja2 --version

reportResults
