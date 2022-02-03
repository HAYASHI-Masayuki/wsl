# WSL 2用環境構築スクリプト・設定

## 基本

1. `wsl --install -d Ubuntu` はしておく。
2. `wsl --cd "~" --exec /bin/bash -c "git clone https://github.com/HAYASHI-Masayuki/wsl.git && HOST_USER=... ./wsl/init.sh"`
3. 後はSSHで入れるので、入ってAnsible叩く。


## sshd, docker他自動起動

`wsl --exec bash /home/<USER>/wsl/startup.sh` を、ホスト側でタスクスケジューラに設定して、ログオン時に毎回実行するようにしておく。

なお、今後Windows 11に移行した際は、wsl.confのboot.commandあたりで設定するとよさそう。
