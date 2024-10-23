$NeovimPath = "~/.config/nvim"
Remove-Item -Force $NeovimPath -Recurse
Copy-Item -Recurse $(Join-Path -Path $PSScriptRoot -ChildPath nvim) $NeovimPath
