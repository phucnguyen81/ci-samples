# Kick off a build on circleci

$uri = 'https://circleci.com/api/v1.1/project/github/phucnguyen81/ci-samples?circle-token=8b9386241a753945fdc583d796f5ece55d861039'

$headers = @{
  'Content-Type' = 'application/json'
}

$body = @{
  build_parameters = @{
    DOWNLOAD_URL = 'https://phucknguyen-bucket.s3.amazonaws.com/ci-samples-2.zip'
  }
}

$bodyJson = $body | ConvertTo-Json

Invoke-RestMethod -Uri $uri `
  -Method Post `
  -Headers $headers  `
  -Body $bodyJson
