# Kick off a build on circleci

$uri = 'https://circleci.com/api/v1.1/project/github/phucnguyen81/ci-samples?circle-token=8b9386241a753945fdc583d796f5ece55d861039'
$headers = @{
  'Content-Type' = 'application/json'
}
Invoke-RestMethod -Uri $uri -Method Post -Headers $headers
