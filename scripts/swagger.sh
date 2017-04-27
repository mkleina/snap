#!/bin/bash

#http://www.apache.org/licenses/LICENSE-2.0.txt
#
#
#Copyright 2017 Intel Corporation
#
#Licensed under the Apache License, Version 2.0 (the "License");
#you may not use this file except in compliance with the License.
#You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
#Unless required by applicable law or agreed to in writing, software
#distributed under the License is distributed on an "AS IS" BASIS,
#WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#See the License for the specific language governing permissions and
#limitations under the License.

__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

swagger generate spec -o ${__dir}/../swagger.json
swagger validate ${__dir}/../swagger.json

if [[ $? -eq 0 ]]; then
SWAGGER_JSON=$(cat ${__dir}/../swagger.json)
echo "/*
http://www.apache.org/licenses/LICENSE-2.0.txt


Copyright 2017 Intel Corporation

Licensed under the Apache License, Version 2.0 (the \"License\");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an \"AS IS\" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

// This is auto-generated file, do not modify.

package v2

import \"encoding/json\"

var swaggerJSON = json.RawMessage([]byte(\`$SWAGGER_JSON\`))" > ${__dir}/../mgmt/rest/v2/swagger_autogen.go
echo "File swagger_autogen.go updated."
fi
