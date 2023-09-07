# aTrust-VPN-Open-URL

The SDU new VPN provided by aTrust is very hard to use with lots of bugs. This script can help to make it easier to use. For Windows users only.

山东大学新版aTrust VPN太难用，还有不少的问题。本脚本旨在让它用起来更方便。

## 更新

**更新**：本人正在着手将aTrust封装在Docker或者其他容器，然后跑在服务端。现在本人有以下几个想法

- 对于自己有能力获取到服务器的用户，提供一站式的配置方案，将服务器作为代理服务器配置完成后，直接在系统中将代理服务器设置为自己的服务器即可。
- 对于自己没有能力获取到服务器，但是使用Linux或者在Windows上安装了Docker并可以正常使用的用户，我们提供本地的配置方法。当然由于Docker在本地运行，可能会占用一些资源，尤其是Windows上，所以本人并不特别希望如此操作。当然，如果使用podman或者其他容器，可能后续也会做这方面的配置脚本，但是个人时间有限，等有需求再说吧······
- 如果你很不幸不想或者不会运行Docker也无法得到服务器，我会继续维护这个最简单的脚本（实际上我觉得已经够用了，有Enhancement方面的需求提issue，我且看着能不能做）
- 优化GUI，把上述的几个功能全部集合起来，做一个像样的程序出来
- 把代理的逻辑写到规则代理软件（比如Clash）的配置文件中

今天偶然看到了已经有人号称能把aTrust部署进Docker，我就意识到，现在能整的活已经越来越多了。

当然了，我其实更希望有大佬刚好路过，帮助我把这个项目做得更好。上面的饼画的很大，实际上我已经做的、能做的很有限，所有东西都在现学。欢迎到本文末加群。

## 功能 Features

    想要直接打开通知的网址，但是得到的只是一个403 Forbidden？
    想要直接访问同学转发的论文链接，但是IP不在学校，无法打开全文？
    想要得到一个“山东济南教育网”的IP属地，隐藏自己的真实所在地？

以上需求，本脚本可以比较容易满足。但是由于本人时间精力非常有限，这个脚本只能很粗糙的使用，但是给出了思路。欢迎Fork和Pull Request。

## 预备工作 BEFORE YOU RUN THE SCRIPT

DO make sure the VPN service is working. YOU MUST INSTALL aTrust client and run it.

一定要**确保**你正确安装了aTrust客户端。本脚本只是改了一下具体的使用方式，没有涉及底层原理实现。你必须正确安装，并保证对应的“服务”在工作。

其他事项请查看更新字段

If you do not want to use the GUI or have other problems:

如果你不想手动打开主程序，或者打开主程序后还是提示“服务未启动”，使用这个办法：

open `taskmgr.exe` or `services.msc` and run the aTrustService

打开“任务管理器”或者“服务”，找到一个叫做`aTrustService`的东西，运行它。如果找不到，那就重装aTrust。

open https://vpn.sdu.edu.cn/portal/#!/login

登录的网址就是上面的那个地址，登录可能会花一段时间才能初始化成功，等等就好了。网络状况很差的情况下，甚至可能要花几分钟甚至十几分钟。如果等了大概2分钟还是在转圈，可以试试关掉这个网页，大概率已经登录成功。此时你的电脑托盘区的aTrust图标会从灰色变成绿色。反正他是绿的就对了。

login.

If the login is successful, the browser will show the aTrust dashboard, which is in fact, hard to use.

如果一切顺利，会在浏览器展示和aTrust应用程序本身界面类似的界面。但是这个界面真的没有什么用。

## 使用脚本 Using the script

Now you can use this script. Download the code from here or Release page and double-click to run the VBS script.

所以现在你就使用这个脚本。双击打开，输入或者粘贴一个你要访问的网址。

You can try opening `https://ip8.com`. Your IP address should be in Jinan, China.

如果你想测试一下代理访问的IP，你可以打开`https://ip8.com`或者别的什么查询IP地址的网页，看看你的IP属地是不是山东济南教育网。

Enjoy using!

祝使用愉快！

## Other things

If you have a GitHub Account, please give me a star if you like it, thanks.

用得爽点个星星可好？谢谢！

Testing QQ group:

路过的大佬们，请不吝赐教，也帮助我一个沙袋蒟蒻提升一下水平。加群唠嗑：

![QQ](https://szw0407.github.io/images/QQgroup.jpg)
