<!DOCTYPE HTML>
<html>
<head>
<META name="description" content="R7000">
<META http-equiv="Content-Type" content="text/html; charset=utf-8">
<META http-equiv="Content-Style-Type" content="text/css">
<META http-equiv="Pragma" content="no-cache">
<META HTTP-equiv="Cache-Control" content="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="Mon, 06 Jan 1990 00:00:01 GMT">

<title>NETGEAR Router RAX40</title>
<link rel="stylesheet" href="css/table_noh.css">
<link rel="stylesheet" href="css/scrollbar.css">
<link rel="stylesheet" href="css/button.css">

<script src="jquery.js"></script>
<script src="script/jquery.mousewheel.js"></script>
<script type="text/javascript" src="script/jquery.jscrollpane.min.js"></script>

<script src="script/script.js"></script>
<link rel="stylesheet" href="form.css">
<script language="javascript" type="text/javascript" src="func.js"></script>
<script language="javascript" type="text/javascript" src="msg.js"></script>
<script language="javascript" type="text/javascript" src="utility.js"></script>
<script language="javascript" type="text/javascript" src="browser.js"></script>
<script language="javascript" type="text/javascript" src="md5.js"></script>
<script language="javascript" type="text/javascript" src="wep.js"></script>

<script language="javascript" type="text/javascript">
<!-- hide script from old browsers


    $(document).ready(function()
    {	
        $("#target").submit(function() {
            buttonFilter();
        });
    });

function do_submit()
{
    //document.forms[0].submit();
	top.location.href="start.html";
}
function wait()
{
    setTimeout("do_submit()",2000);
}
//-->
</script>
<link href="css/custom.css" rel="stylesheet" type="text/css">
</head>
<body  style="margin:0px;" onLoad="wait();">
<form name="formname" method="POST" action="lang_check2.cgi"> 
<table border="0" cellpadding="0" cellspacing="3" width="100%">
<tr>
    <td colspan="2">
        <div class="subhead2"><% GetMultiLangStr("MRU010") %></div>
    </td>
</tr>
<tr>
    <td colspan="2" class="pt-50 pl-25" align="center">
        <b style="font-family: 'Avenir Next';font-size: 16px"><% GetMultiLangStr("MRU033") %></b>
    </td>
</tr>
<tr>
    <td colspan="2" height="12"><div style="background-image:url('seprator.gif');width:100%;background-repeat:repeat-x;">&nbsp;</div></td>
</tr>

</table>
<input type="hidden" name="top_changed" value="1">
<input type="hidden" name="USER_SET_TOKEN" value="<% GetCommonCfg("USER_SET_TOKEN") %>">
</form>
</body>
</html>
