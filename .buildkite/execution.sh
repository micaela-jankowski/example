#!/bin/sh

buildkite-agent artifact download hello/my-hello-app . --step build-step
cd hello
chmod +x ./my-hello-app
./my-hello-app "$(buildkite-agent meta-data get name)"