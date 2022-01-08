# WSL 2用環境構築スクリプト・設定

## 基本

1. `wsl --install -d Ubuntu` はしておく。
2. `wsl --cd ~--exec /bin/bash -c "git clone https://github.com/HAYASHI-Masayuki/wsl.git && HOST_USER=... ./wsl/init.sh`
3. 後はSSHで入れるので、入ってAnsible叩く。
