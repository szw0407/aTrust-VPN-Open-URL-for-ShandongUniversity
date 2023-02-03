dim a
dim Wsh

a=inputbox("Input or Paste the URL you want to visit:","aTrust proxy")

if left(a,4)<>"http" then
    k=instr(a,"/")
    if k>0 then l=left(a,k-1) else l=a
    r=right(a,len(a)-len(l))
    l=Replace(l,".","-")
    l=l&".atrust.sdu.edu.cn:81"
    
else
    if left(a,5)="https" then
        a=right(a,len(a)-8)
        k=instr(a,"/")
        l=left(a,k-1)
        r=right(a,len(a)-len(l))
        l=Replace(l,".","-")
        l=l&"-s.atrust.sdu.edu.cn:81"

    else
        k=instr(a,"/")
        l=left(a,k-1)
        r=right(a,len(a)-len(l))
        l=Replace(l,".","-")
        l=l&".atrust.sdu.edu.cn:81"

    end if
end if
ret="https://"&l&r
Set Wsh = WScript.CreateObject("WScript.Shell")
msgbox ret
Wsh.Run ret