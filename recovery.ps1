# 选择备份文件所在的文件夹
$backup_folder = "D:\DockerBackup"

# 恢复容器备份
$containers = Get-ChildItem $backup_folder -Filter "*.tar" -Recurse
foreach ($container in $containers) {
    docker load -i $container.FullName
}

# 恢复数据卷备份
$volumes = Get-ChildItem $backup_folder -Filter "*.zip" -Recurse
foreach ($volume in $volumes) {
    $container_name = $volume.BaseName
    docker run --rm -v ${container_name}:/target -v $volume.FullName:/backup alpine unzip /backup/data.zip -d /target
}