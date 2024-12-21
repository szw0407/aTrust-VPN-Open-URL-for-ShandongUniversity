# aTrust-VPN-Open-URL

The SDU new VPN provided by aTrust is very hard to use with lots of bugs. This script can help to make it easier to use. For Windows users only.

山东大学新版aTrust VPN太难用，还有不少的问题。本脚本旨在让它用起来更方便。

**懒人方案**：如果你只需要访问网页而不需要访问其他的网络内容，直接去[这个项目](https://github.com/szw0407/SDU-webvpn-helper/)即可。大多数人应该也就是访问一下网页而已了，基本上可以说是功能足够了。

**太长不看**，一句话概括：如果不折腾花活，安装aTrust程序并且保证服务正常运行的情况下，双击运行VBS脚本文件，弹的框里面粘贴你要访问的网址（URL），协议支持HTTP和HTTPS。

这个脚本的初衷是，深信服的那个软件到处拉屎，把文件夹都搞得乱七八糟，还据说会有后门、监听；而且对于 Linux 没有提供任何常见的发行版的支持，难以使用；此外，如果按照官方的使用方法，必须在那个软件界面里面打开山东大学图书馆的网站，从山大图书馆里面索引转到对应的数据库，对于访问某个特定的链接可以说是极不方便，于是本人就希望找一个能不太麻烦地使用它的方式。

## 更新

**更新**：目前已经测试过使用aTrust的docker镜像，可以在Windows上使用Docker Desktop运行，也理论上可以在Linux上运行。运行后，可以直接从网页登入，而不需要打开aTrust主程序的GUI。有可能会偶尔出现登录网页很长时间都无法检测到客户端的情况，但是重新打开网页就会发现其实已经登录成功了。

此外，据说 Windows 已经移除了 VBScript，所以这个脚本可能在未来会失效。我已经使用 Python 重新实现了这个脚本，运行方法：

```bash
# for Linux
chmod +x aTrustOpen  # only need to run once, make the script executable
./aTrustOpen https://ip8.com
```

```powershell
# for Windows
python aTrustOpen.py https://ip8.com
```

当然了，我其实更希望有大佬刚好路过，帮助我把这个项目做得更好。上面的饼画的很大，实际上我已经做的、能做的很有限，所有东西都在现学。欢迎到本文末加群。

## 功能 Features

> 想要直接打开通知的网址，但是得到的只是一个403 Forbidden？
> 想要直接访问同学转发的论文链接，但是IP不在学校，无法打开全文？
> 想要得到一个“山东济南教育网”的IP属地，隐藏自己的真实所在地？

以上需求，本脚本可以比较容易满足。但是由于本人时间精力非常有限，这个脚本只能很粗糙的使用，但是给出了思路。欢迎Fork和Pull Request。

## 预备工作 BEFORE YOU RUN THE SCRIPT

对于普通Windows/MacOS/iOS/安卓/UOS/麒麟等**国内常见操作系统**的用户来说，请直接看到**否则**部分，和Docker有关的内容是给高级用户（如常见Linux使用者，或者那些就是无法使用aTrust的人） For users of Windows, MacOS, iOS, Android, UOS, Kylin or other operate systems common in China, please refer to the **Otherwise** part. The content related to Docker is for advanced users (e.g., common Linux users, or those who just can't use aTrust). 

If you are using Linux or if you can use Docker Desktop on Windows, you may use the commands below to start the aTrust in Docker. Thanks to [docker-easyconnect](https://github.com/docker-easyconnect/docker-easyconnect) for the container image.

如果你使用Linux或者可以在Windows上使用Docker Desktop，你可以使用以下命令来启动Docker中的aTrust。感谢[docker-easyconnect](https://github.com/docker-easyconnect/docker-easyconnect)提供的容器镜像。

```bash
docker run --rm --device /dev/net/tun --cap-add NET_ADMIN -ti -e PASSWORD=xxxx -e URLWIN=1 -v $HOME/.atrust-data:/root -p 127.0.0.1:5901:5901 -p 127.0.0.1:1080:1080 -p 127.0.0.1:8888:8888 -p 127.0.0.1:54631:54631 hagb/docker-atrust:vncless
```

对于这个命令里面的一些细节的解释：

- NET_ADMIN 权限是必须的，因为aTrust需要创建虚拟网卡。
- PASSWORD 这个东西是对应于`docker-atrust:latest`镜像的环境变量，其提供了一个VNC连接查看aTrust主程序的GUI。但是这里用不到，所以使用了`docker-atrust:vncless`镜像，这个参数也没有了什么实际的价值。
- URLWIN 这个环境变量也是用在VNC里面，用来弹出个框显示登入的网址的，但是这里用不到，所以也没有什么实际的价值。
- $HOME/.atrust-data 这个是挂载的目录，用来保存aTrust的配置文件。
- 5901端口是VNC的端口，可以用VNC查看aTrust的主程序界面。这里其实也用不上
- 1080端口是SOCKS5代理端口，可以用来代理浏览器访问网站。
- 8888端口是HTTP代理端口，可以用来代理浏览器访问网站。
- 54631端口是aTrust的控制端口，这个东西是必须的，不然无法让网页和aTrust主程序通信。

如果你**只需要访问一些网页**这种最简单的功能，你**只需要**54631这一个端口即可！不必配置任何代理，因为网页是通过深信服**私有的协议**和aTrust主程序通信的，不需要代理就能打开这些网页，只需要而且**只能**使用aTrust主程序或者这个程序改写网址（URL）而打开，因为网页访问通过隧道似乎就是通过改写的URL实现的，改写的URL指向aTrust服务器，这个服务器会处理所有的请求。aTrust不会主动地代理所有的连接，对于任何不是直接指向山东大学的请求，他不会产生任何影响。但是对于建立TCP/UDP连接，接入山东大学的内网IP地址，就需要使用代理端口。具体的行为多试试就能大概了解了。

> 如果你已经选择并启动了Docker容器，你可以直接跳到“登入”部分。

**Otherwise** you need to install the aTrust VPN client from the official website. You can download it from [here](https://vpn.sdu.edu.cn/) at the top right corner. Note that for Linux users, the website only offers UOS and Kylin versions. You may need to use bwrap to load the necessary libraries from the UOS or Kylin Linux and then unpack the deb package.

**否则**，你需要从官方网站下载aTrust VPN客户端。你可以在[这里](https://vpn.sdu.edu.cn/)的右上角找到下载链接。注意，对于Linux用户，官网只提供了UOS和麒麟版本。你可能需要使用bwrap加载UOS或者麒麟Linux中的必要库，然后解压deb包。

If you do not want to use the GUI or have other problems (For users running Windows):

如果你不想手动打开主程序，或者打开主程序后还是提示“服务未启动”，使用这个办法（这部分内容仅适用于Windows）：

Open `taskmgr.exe` or `services.msc` and run the aTrustService

打开“任务管理器”或者“服务”，找到一个叫做`aTrustService`的东西，运行它。如果找不到，那就重装aTrust。

## 登入 Login

Open `https://vpn.sdu.edu.cn/portal/#!/login` and login in the web browser.

浏览器[打开这个](https://vpn.sdu.edu.cn/portal/#!/login)，登录。可能会花一段时间才能初始化成功，等等就好了。本人最长一次等了超过10分钟还在转圈（深信服，真有你的）。如果等了大概2分钟还是在转圈，其实大概率已经登录成功，就是网页前端出了点问题，可以不管了。如果使用aTrust程序，此时你的电脑托盘区的aTrust图标会从灰色变成绿色。反正他是绿的就对了。

If the login is successful, the browser will show the aTrust dashboard, which is in fact, hard to use.

如果一切顺利，会在浏览器展示和aTrust应用程序本身界面类似的界面。但是这个界面真的没有什么用。

## 使用脚本 Using the script

Now you can use this script. Download the code from here or Release page and double-click to run the VBS script.

所以现在你就使用这个脚本。双击打开，输入或者粘贴一个你要访问的网址。

You can try opening `https://ip8.com`. Your IP address should be in Jinan, China.

如果你想测试一下代理访问的IP，你可以打开`https://ip8.com`或者别的什么查询IP地址的网页，看看你的IP属地是不是山东济南教育网。

对于那个 Python 实现的脚本，需要在命令行使用，细节见上文。

Enjoy using!

祝使用愉快！

## Other things

If you have a GitHub Account, please give me a star if you like it, thanks.

用得爽点个星星可好？谢谢！

Testing QQ group:

路过的大佬们，请不吝赐教，也帮助我一个沙袋蒟蒻提升一下水平。加群唠嗑：

![QQ](https://szw0407.github.io/images/QQgroup.jpg)
