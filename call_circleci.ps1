# Kick off a build on circleci

# Script parameters
param (
  [string]$token = $env:CIRCLECI_TOKEN
)

If ([string]::IsNullOrEmpty($token)) {
  throw "Token is required as parameter or env variable CIRCLECI_TOKEN"
}

# fail on first error (e.g. directory not exist)
$ErrorActionPreference = "Stop"

$uriBase = "https://circleci.com/api/v1.1/project/github"
$username = "phucnguyen81"
$project = "ci-samples"
$uri = "${uriBase}/${username}/${project}?circle-token=${token}"

$headers = @{
  'Content-Type' = 'application/json'
}

$body = @{
  build_parameters = @{
    DOWNLOAD_URL = 'https://phucknguyen-bucket.s3.amazonaws.com/ci-samples-2.zip'
    COMMAND = 'katalon-execute.sh -browserType="Chrome" -retry=0 -statusDelay=15 -testSuitePath="Test Suites/TS_RegressionTest"'
    ENVIRONMENT_VARIABLES = @{
      BUILD_MARKER = 'Nothing yet, just need a single variable'
    }
  }
}

$bodyJson = $body | ConvertTo-Json

Invoke-RestMethod -Uri $uri -Method Post -Headers $headers -Body $bodyJson

