# ============================================================
# deploy.ps1 - IELTS 7.0 GitHub Pages Deploy Script
# Cách dùng: Chạy lệnh này trong terminal tại thư mục ielts-7.0
#   ./deploy.ps1
# ============================================================

$ROOT = Split-Path -Parent $MyInvocation.MyCommand.Path
$DEPLOY_DIR = Join-Path $ROOT ".github-pages"
$COMMIT_MSG = "Update: $(Get-Date -Format 'yyyy-MM-dd HH:mm')"

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  IELTS 7.0 - Deploy to GitHub Pages" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Bước 1: Copy file mới nhất vào thư mục deploy
Write-Host "[1/3] Copying latest files..." -ForegroundColor Yellow
Copy-Item -Path "$ROOT\index.html" -Destination "$DEPLOY_DIR\" -Force
Copy-Item -Path "$ROOT\assets" -Destination "$DEPLOY_DIR\" -Recurse -Force
Write-Host "      Done!" -ForegroundColor Green

# Bước 2: Commit
Write-Host "[2/3] Committing changes: '$COMMIT_MSG'" -ForegroundColor Yellow
git -C $DEPLOY_DIR add .
$status = git -C $DEPLOY_DIR status --porcelain
if ($status) {
    git -C $DEPLOY_DIR commit -m $COMMIT_MSG
    Write-Host "      Done!" -ForegroundColor Green
} else {
    Write-Host "      No changes to commit." -ForegroundColor Gray
}

# Bước 3: Push lên GitHub
Write-Host "[3/3] Pushing to GitHub Pages..." -ForegroundColor Yellow
git -C $DEPLOY_DIR push origin main
Write-Host "      Done!" -ForegroundColor Green

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "  SUCCESS! Site updated in ~1 minute." -ForegroundColor Green
Write-Host "  URL: https://kieraling21.github.io/ielts-70/" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
