function fnPostNew_CUSTOM()
{
  console.log('hello    ');
  //appendData();
	debugs('FCZ Start', gAction);
	var prevgAction=gAction;
	gAction='NEWREFERENCE';
   console.log(' TE G ACTION   ');  
	fcjRequestDOM=buildUBSXml();
 
 console.log('REQUEST DONE    ');
	debugs('FCZ', fcjRequestDOM);
	fcjResponseDOM=fnPost(fcjRequestDOM, servletURL,functionId);
	debugs('FCZ req', fcjRequestDOM);
	debugs('FCZ resp', fcjResponseDOM);
 
    console.log('REQUEST U KTHY    ');
	if(!fnProcessResponse()){
	return true;
	}
	debugs('FCZ final', fcjResponseDOM);
	
	gAction=prevgAction;
  //return true;
  
 }
 
 
var reference;

 function fnPreCopy_CUSTOM(){
 
	 reference=document.getElementById('BLK_MASTER__REFERENCE').value;
   return true;
 }

function  fnPostCopy_CUSTOM(){
    document.getElementById('BLK_MASTER__REFERENCE').value=reference+"C";
	 	return true;
 }
