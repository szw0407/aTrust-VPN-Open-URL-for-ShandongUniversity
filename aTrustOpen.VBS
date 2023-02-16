dim a
dim Wsh
Set Wsh = WScript.CreateObject("WScript.Shell")
a=inputbox("Input or Paste the URL you want to visit:","aTrust proxy","https://")
if a<>"" and a<>"https://" then
    if left(a,4)<>"http" then
        k=instr(a,"/")
        if k>0 then l=left(a,k-1) else l=a
        r=right(a,len(a)-len(l))
        l=Replace(l,".","-")
        if MsgBox("Use HTTPS?",vbYesNo,"aTrustProxy")=vbYes then l=l&"-s"
        l=l&".atrust.sdu.edu.cn:81"
    else
        if left(a,5)="https" then
            a=right(a,len(a)-8)
            k=instr(a,"/")
            if k>0 then l=left(a,k-1) else l=a
            r=right(a,len(a)-len(l))
            l=Replace(l,".","-")
            l=l&"-s.atrust.sdu.edu.cn:81"
        else
            a=right(a,len(a)-7)
            k=instr(a,"/")
            if k>0 then l=left(a,k-1) else l=a
            r=right(a,len(a)-len(l))
            l=Replace(l,".","-")
            l=l&".atrust.sdu.edu.cn:81"

        end if
    end if
    ret="https://"&l&r
    ' msgbox ret
    Wsh.Run ret
ElseIf a="https://" Then
    a=a&"vpn.sdu.edu.cn/"
    Wsh.Run a
Else
    MsgBox("Canceled.")
end if