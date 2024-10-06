git pull --prune && git branch | Select-String -Pattern '^[^\*].*' | ForEach-Object { git branch -D $_.toString().Trim() }
