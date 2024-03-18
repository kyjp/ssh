## imageとcontainerの作成
docker build . -t ssh-container
docker run -d -p 2222:22 ssh-container

## sshのためのコマンド
ssh root@localhost -p 2222

## passはDockerfile参照

サーバ内でgitを使ってみよう
git clone gitのurl
git fetch
git pull
