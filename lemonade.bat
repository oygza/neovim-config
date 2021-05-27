if "%1"=="hide" goto CmdBegin
start mshta vbscript:createobject("wscript.shell").run("""%~0"" hide",0)(window.close)&&exit
:CmdBegin
cd "C:\Program Files\lemonade"
lemonade.exe --port=2489 --line-ending="crlf" --allow="192.168.0.0/0,::/24" server
