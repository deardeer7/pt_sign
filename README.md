# PT Sign

PT站签到脚本

## 签到站点支持

- 通用签到方式站点：KeepFrds、SouLvoice、HDAI、HDBD、PTMSG、HDFANS、CCF、DIC、U2、MTEAM、GPW、HUIJVTT（貌似已关闭站点）
- 签到方式1站点：PTHOME
- 签到方式2站点：HAIDAN
- 签到方式3站点：Lemonhd、HDATMOS、HDZONE、HDTIME、3WMG
- 签到方式4站点：HDAREA
- 签到方式5站点：PterClub

具体配置参考：[配置文件说明](#签到站点配置)

## 食用说明

1. 访问 (http://iyuu.cn/) ，使用微信扫码获取Token的api链接.

<img src="images/2021101616404050.png" alt="微信推送接口" width="700px" />

2. 往下拉动页面复制包含token的api链接.

<img src="images/2021101616424205.png" alt="微信推送接口" width="700px" />

3. 克隆本项目

```shell
git clone https://github.com/deardeer7/pt_sign.git
```

4. 打开 `pt.py` 文件，找到 `api = ''` 这行，把api链接填充进去后保存.
```python
api = 'http://iyuu.cn/your_api'
```
<img src="images/2021101617161603.png" alt="填写api" width="700px" />

5. 打开 `site.json` 文件，自行根据[站点支持](#签到站点支持)和[站点配置](签到站点配置)，添加站点

6. 安装requests库

```shell
pip install requests
```

7. 运行脚本，进行签到
```shell
python pt.py
```

## 微信推送效果

<img src="images/042D032D23E73FD19B0F818993EF3E91.png" alt="微信推送接口" width="300px" />

## 自动签到

### 1. 脚本定时签到

run.sh：
```shell
#!/bin/bash
while :
do
    date
    python pt.py
    sleep 1d
done
```

执行：

```shell
nohup bash run.sh >sign.log 2>&1 &
```

### 2. 搭配`cron`实现定时签到

例子：每天7:07 执行签到：

```shell
7 7 * * * path/to/your/python path/to/pt_sign/pt.py
```

## 签到站点配置

查看签到站点支持：[签到站点支持](#签到站点支持)

cookie获取参考：[link1](https://blog.csdn.net/liuyanlin610/article/details/75105105) [link2](https://blog.csdn.net/u011781521/article/details/87791125)

注意站点地址 `url` 填写完整，如 `https://hdatmos.club/attendance.php`

通用签到方式:
```json
{
    "site": "站点名称",
    "url": "站点地址",
    "cookie": "站点cookie"
}
```
签到方式1:
```json
{
    "site": "站点名称",
    "url": "域名/attendance.php",
    "referer": "域名/index.php",
    "cookie": "站点cookie"
}
```
签到方式2:
```json
{
    "site": "站点名称",
    "url": "域名/signin.php",
    "referer": "域名/index.php",
    "cookie": "站点cookie"
}
```
签到方式3:
```json
{
    "site": "站点名称",
    "url": "域名/attendance.php",
    "cookie": "站点cookie"
}
```
签到方式4:
```json
{
    "site": "站点名称",
    "url": "域名/sign_in.php",
    "referer": "域名/faq.php",
    "action": "sign_in",
    "cookie": "站点cookie"
}
```
签到方式5:
```json
{
    "site": "站点名称",
    "url": "域名/attendance-ajax.php",
    "cookie": "站点cookie"
}
```


## 更新日志

### 2023-11-26

- 调整本说明排版 
- 完善本说明文件

### 2021-10-16

1. 新增爱语飞飞微信通知推送;

2. 删除使用Python项目管理器运行方式
