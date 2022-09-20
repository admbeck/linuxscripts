#notrayicon
; win+letter to call programm
Browser()
{
    Try
    {
        Run, firefox
        return
    }
    Try
    {
        Run, msedge
        return
    }
    return
}
#w::Browser()
; wsl stuff
#Enter::Run, wt -p openSUSE-Tumbleweed
#n::Run, wt -p vimwiki
+#n::Run, wt -p newsboat
return
