#!/bin/bash

# export to temporary file to debug values
cat <<EOT >> body.json
{
  "parameters":
      {
          "imgName": "boxblinkracer/shopware6-mollie"
      }
}
EOT

curl -X POST -d @body.json -H "Content-Type: application/json" -H "Circle-Token: $1" https://circleci.com/api/v2/project/github/boxblinkracer/docker-sw6-mollie/pipeline