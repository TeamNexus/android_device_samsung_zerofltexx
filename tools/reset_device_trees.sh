#!/bin/bash

#
# Copyright (C) 2018 TeamNexus
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#
# For different changes on all device-trees, this script
# commits and pushes all changes made to them
#

# Arguments
RESET_ARGS="${1}"
BRANCH=${2:-nx-9.0}

CURR_PWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SAM_DEVICES="$( realpath "${CURR_PWD}/../.." )"

# Only list device-trees, not common one
for devtree in "${SAM_DEVICES}"/zero[f,l]*; do
	devname="$( basename "${devtree}" )"

	git -C "${devtree}" add --all .
	git -C "${devtree}" reset ${RESET_ARGS}
	git -C "${devtree}" push https://github.com/TeamNexus/android_device_samsung_${devname} HEAD:${BRANCH} --force
done
