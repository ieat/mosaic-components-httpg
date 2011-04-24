#!/bin/bash

set -e -E -u -o pipefail || exit 1
test "${#}" -eq 0

cd -- "$( dirname -- "$( readlink -e -- "${0}" )" )"

set -x

rm -Rf ./generated
mkdir ./generated

VERSION=2.3.1

cp -T ./repositories/rabbitmq-management/ebin/rabbit_management.app.in ./generated/rabbit_management.app
cp -T ./repositories/rabbitmq-management-agent/ebin/rabbit_management_agent.app.in ./generated/rabbit_management_agent.app
cp -T ./repositories/rabbitmq-mochiweb/ebin/rabbit_mochiweb.app.in ./generated/rabbit_mochiweb.app

sed -r -e 's!%%VSN%%!'"${VERSION}"'!g' -i ./generated/rabbit_management.app
sed -r -e 's!%%VSN%%!'"${VERSION}"'!g' -i ./generated/rabbit_management_agent.app
sed -r -e 's!%%VSN%%!'"${VERSION}"'!g' -i ./generated/rabbit_mochiweb.app

exit 0
