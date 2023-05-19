# 设置备份目录
$backupDir = "D:\DockerBackup"

# 创建备份目录（如果不存在）
New-Item -ItemType Directory -Force -Path $backupDir

# 获取所有容器信息
$containers = docker ps -a --format "{{.ID}}"

# 备份每个容器
foreach ($container in $containers) {
    # 获取容器名称
    $containerName = docker inspect --format='{{.Name}}' $container
    $containerName = $containerName -replace "/", ""

    # 备份容器
    docker export $container > "$backupDir\$containerName.tar"

    # 备份数据卷
    docker run --rm -v ${containerName}:/volume -v ${backupDir}:/backup alpine tar -czf /backup/$containerName-data.tar.gz /volume
}
