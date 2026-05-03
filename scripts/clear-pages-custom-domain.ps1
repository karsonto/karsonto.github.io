# Clears GitHub Pages custom domain so https://karsonto.github.io/ serves the site instead of redirecting.
# Requires: Fine-grained or classic PAT with "Administration" on repository (or repo admin via REST).
# Usage: $env:GITHUB_TOKEN = "ghp_..." ; .\scripts\clear-pages-custom-domain.ps1

$ErrorActionPreference = "Stop"
$owner = "karsonto"
$repo = "karsonto"
$token = $env:GITHUB_TOKEN
if (-not $token) {
  Write-Host "Set GITHUB_TOKEN to a PAT with repo admin (Settings -> Developer settings -> Personal access tokens)." -ForegroundColor Yellow
  exit 1
}

$uri = "https://api.github.com/repos/$owner/$repo/pages"
$headers = @{
  Authorization = "Bearer $token"
  Accept        = "application/vnd.github+json"
  "User-Agent"  = "clear-pages-custom-domain"
}

# build_type workflow = Settings -> Pages -> GitHub Actions
$body = '{"cname":null,"build_type":"workflow"}'

try {
  Invoke-RestMethod -Method Patch -Uri $uri -Headers $headers -Body $body -ContentType "application/json"
  Write-Host "OK: Custom domain cleared. Wait 2-5 minutes, then open https://$owner.github.io/" -ForegroundColor Green
} catch {
  Write-Host "API error: $($_.Exception.Message)" -ForegroundColor Red
  if ($_.ErrorDetails.Message) { Write-Host $_.ErrorDetails.Message }
  exit 1
}
