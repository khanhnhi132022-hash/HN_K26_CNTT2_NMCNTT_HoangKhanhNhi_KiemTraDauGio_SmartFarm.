# Script: auto_report.ps1
# Tac gia: Khanh Nhi
# Ngay tao: 27/10/2026

Write-Host "Dang loc du lieu..."


"=== TONG SO SU CO ===" | set-content ../backup/bao-cao-su-co.txt


 Gc ../data/log-he-thong.log | sls "critical" | add-content ../backup/bao-cao-su-co.txt
 Gc ../data/log-he-thong.log | sls "error" | add-content ../backup/bao-cao-su-co.txt



Write-Host "Da loc xong..."