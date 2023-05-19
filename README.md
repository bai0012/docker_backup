# docker_backup
使用Powershell脚本备份Docker for Windows中的容器和数据卷

## 使用方法

拉取该程序
```powershell
git clone https://github.com/bai0012/docker_backup
```

```powershell
cd docker_backup
```

### 备份容器和数据卷

修改backup.ps1中第一行备份路径，然后在powershell中运行

```powershell
./backup.ps1
```

### 恢复容器和数据卷

修改recovery.ps1中第一行备份路径，然后在powershell中运行

```powershell
./recovery.ps1
```

(恢复脚本尚未验证)

## 疑难解答

### 提示gzip报错

Git安装时会附带gzip.exe，将Git安装文件夹里含gzip.exe的文件夹路径加入到Windows环境变量中

如：

```
C:\Program Files\Git\usr\bin
```

(本程序在GPT4的指导下生成)
