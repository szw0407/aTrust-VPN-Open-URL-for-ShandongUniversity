# aTrust-VPN-Open-URL

The SDU new VPN provided by aTrust is very hard to use with lots of bugs. This script can help to make it easier to use. For Windows users only.

山东大学新版aTrust VPN太难用，还有不少的问题。本脚本旨在让它用起来更方便。

    想要直接打开通知的网址，但是得到的只是一个403 Forbidden？
    想要直接访问同学转发的论文链接，但是IP不在学校，无法打开全文？
    想要得到一个“山东济南教育网”的IP属地，隐藏自己的真实所在地？

以上需求，本脚本可以比较容易满足。但是由于本人时间精力非常有限，这个脚本只能很粗糙的使用，但是给出了思路。欢迎Fork和Pull Request。

## BEFORE YOU RUN THE SCRIPT

DO make sure the VPN service is working. YOU MUST INSTALL aTrust client and run it.

一定要**确保**你正确安装了aTrust客户端。本脚本只是改了一下具体的使用方式，没有涉及底层原理实现。你必须正确安装，并保证对应的“服务”在工作。

If you do not want to use the GUI or have other problems:

如果你不想手动打开主程序，或者打开主程序后还是提示“服务未启动”，使用这个办法：

open `taskmgr.exe` or `services.msc` and run the aTrustService

打开“任务管理器”或者“服务”，找到一个叫做`aTrustService`的东西，运行它。如果找不到，那就重装aTrust。

open https://vpn.sdu.edu.cn/portal/#!/login

登录的网址就是上面的那个地址，登录可能会花一段时间才能初始化成功，等等就好了。网络状况很差的情况下，甚至可能要花几分钟甚至十几分钟。如果等了大概2分钟还是在转圈，可以试试关掉这个网页，大概率已经登陆成功。

login.

If the login is successful, the browser will show the aTrust dashboard, which is in fact, hard to use.

如果一切顺利，会在浏览器展示和aTrust应用程序本身界面类似的界面。但是这个界面真的没有什么用。

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
