/***************************************************************************************************************************
**  This source is part of the FLEXCUBE Software Product. 
**  Copyright (c) 2008 ,2022, Oracle and/or its affiliates.
**  All rights reserved.
**  
**  No part of this work may be reproduced, stored in a retrieval system, 
**  adopted or transmitted in any form or by any means, electronic, mechanical, photographic, 
**  graphic, optic recording or otherwise, translated in any language or computer language, 
**  without the prior written permission of Oracle and/or its affiliates.
**  
**  Oracle Financial Services Software Limited.
**  Oracle Park, Off Western Express Highway,
**  Goregaon (East),
**  Mumbai - 400 063,
**  India.
**  
**  Written by         : 
**  Date of creation   : 
**  File Name          : STDFIO33_CUSTOM.js
**  Purpose            : 
**  Called From        : 
**  
**  CHANGE LOG
**  Last Modified By   : 
**  Last modified on   : 
**  Full Version       : 
**  Reason             : 
****************************************************************************************************************************/

function FN_FIORI_POPULATE()
{
	appendData();
	debugs('FCZ Start', gAction);
	var prevgAction=gAction;
	gAction='POPULATE';
	fcjRequestDOM=buildUBSXml();
	debugs('FCZ', fcjRequestDOM);
	fcjResponseDOM=fnPost(fcjRequestDOM, servletURL,functionId);
	debugs('FCZ req', fcjRequestDOM);
	debugs('FCZ resp', fcjResponseDOM);
	if(!fnProcessResponse()){
	return true;
	}
	debugs('FCZ final', fcjResponseDOM);
	
	gAction=prevgAction;
	
}