#!/bin/bash

# Copyright 2020 Dynatrace LLC
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

IMAGE_NAME=${1:-keptn/dns.keptn.sh}
IMAGE_VERSION=${2:-master}

PORT=${3:-53}

# this runs the image daemonized (-d), opens port 53 on tcp and udp, and makes it so it automatically restarts (unless it was stopped)
docker run -d -p 0.0.0.0:53:$PORT/tcp -p 0.0.0.0:53:$PORT/udp --restart unless-stopped ${IMAGE_NAME}:${IMAGE_VERSION}
