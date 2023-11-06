#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "butane --version" butane --version

reportResults
