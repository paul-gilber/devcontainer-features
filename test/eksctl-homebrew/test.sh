#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "eksctl version" eksctl version

reportResults
