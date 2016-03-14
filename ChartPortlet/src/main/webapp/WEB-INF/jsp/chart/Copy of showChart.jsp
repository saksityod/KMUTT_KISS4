<%--
  Created by IntelliJ IDEA.
  User: imake
  Date: 07/09/2015
  Time: 19:10
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/WEB-INF/jsp/include.jsp" %>
<%@ page contentType="text/html; charset=utf-8" %>
<c:set var="ns"><portlet:namespace/></c:set>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expires" content="0">
    <title></title>
    <!-- Bootstrap core CSS -->
    <%--
    <link rel="stylesheet" href="<c:url value="/resources/bootstrap/css/bootstrap.min.css"/>" type="text/css"/>
--%>

</head>
<!-- class="icon-comment icon-white"  -->
<%--
<div><i id="${ns}myTooltip"  class="icon-comment icon-white"  title="${chartSettingForm.comment}"
        style="position:relative;top:0;left:97%;cursor: pointer;background-image:
                url('<c:url value="/resources/images/comment.jpg"/>') ">

</i> </div>
--%>
<div>
    <%--
    <button id="${ns}comment_bt" type="button" class="btn btn-lg btn-danger" data-toggle="popover" title="Comment"
            data-content="${chartSettingForm.comment}">Click to toggle popover</button>
--%>
        <a tabindex="0" id="${ns}comment_bt"
            data-toggle="popover" data-trigger="focus" title="Comment"
           data-content="${chartSettingForm.comment}">
            <img id="${ns}linktox" src="<c:url value="/resources/images/comment.jpg"/>" style="cursor:pointer;width:16px;height: 16px;padding-left:5px" />
        </a>
        <%--
        <img id="${ns}comment_bt"  data-toggle="popover" data-trigger="focus" title="Comment"
             data-content="${chartSettingForm.comment}" src="<c:url value="/resources/images/comment.jpg"/>"
        style="position:relative;top:0;left:0%;cursor:pointer;width:16px;height: 16px"  />
    <img id="${ns}myTooltip"   src="<c:url value="/resources/images/comment.jpg"/>"
          style="position:relative;top:0;left:0%;cursor:pointer;width:16px;height: 16px" title="${chartSettingForm.comment}" />
          --%>
    <c:if test="${not empty chartSettingForm.linkTo}">
        <%--  onclick="${ns}linkto('${chartSettingForm.linkTo}')"
        onclick="window.open('${chartSettingForm.linkTo}');" target="_blank"
        --%>
        <a  onclick='${ns}linkto("${chartSettingForm.linkTo}")'  >
        <img id="${ns}linktox" src="<c:url value="/resources/images/link-xxl.png"/>" style="cursor:pointer;width:16px;height: 16px;padding-left:5px" />
            </a>
    </c:if>

</div>
<c:if test="${chartSettingForm.dataSourceType=='1' && chartSettingForm.showFilter=='1' }">
    <portlet:actionURL var="formAction">
        <portlet:param name="action" value="doSubmit"/>
    </portlet:actionURL>
    <form:form id="chartSettingForm" modelAttribute="chartSettingForm" method="post" name="chartSettingFormm"
               action="${formAction}" enctype="multipart/form-data">
        <form:hidden path="dataSourceType"/>
        <form:hidden path="chartInstance"/>
        <form:hidden path="globalFilterString"/>
	    <c:forEach items="${filters}" var="filter" varStatus="loop">
	        &nbsp;&nbsp;${filter.filterName}:&nbsp;
	        <select id="filter_${chartSettingForm.chartInstance}_${filter.filterId}" name="filter_${chartSettingForm.chartInstance}_${filter.filterId}" >
	        	<c:forEach items="${filter.filterValues}" var="item" varStatus="loop2">
		        	<c:choose>
					    <c:when test="${filter.selectedValue.equals(item.keyMapping)}">
					        <option value="${item.keyMapping}" selected>${item.valueMapping}</option>
					    </c:when>    
					    <c:otherwise>
					            <option value="${item.keyMapping}">${item.valueMapping}</option>
					    </c:otherwise>
					</c:choose>
	        	</c:forEach>
        	</select>
        &nbsp;&nbsp;
    	</c:forEach>
	    <table width="100%">
	        <tr>
	            <td align="left">
	                <button type="submit"
	                        class="btn btn-primary">Submit
	                </button>
	            </td>
	        </tr>
	    </table>
    </form:form>
</c:if>
<table border="0" width="100%">
<div align="center" id="${ns}chart_table_caption"></div>
<div align="center" id="${ns}chart_table_subCaption"></div>
</table>
<div id="${ns}chartContainer"> Please Config Chart!</div>
<%--
<span id="${ns}chartContainer" style="line-height: 100%; display:
inline-block; zoom: 1; width: 99%; height: 34.65px; background-color: rgb(255, 255, 255);">
Please Config Chart!
</span>
--%>

<script type="text/javascript" src="<c:url value="/resources/js/jquery-1.11.2.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/fusioncharts/js/fusioncharts.js" />"></script>
<%-- --%>
<script type="text/javascript" src="<c:url value="/resources/fusioncharts/js/themes/fusioncharts.theme.fint.js"/>"></script>



<script src="<c:url value="/resources/bootstrap/js/bootstrap.min.js"/>"></script>
<%--
<script src="<c:url value='/resources/js/bootbox.min.js'/>" type="text/javascript"></script>
--%>
<script type="text/javascript">
    <%-- pie3d column2d --%>
    FusionCharts.ready(function(){
        <%--
        var dataSource;
        var chartype="";

        var chartHeight="300";
        <c:if test="${chartSettingForm.chartType=='gantt'}">
        chartHeight="600";

        </c:if>
        <c:if test="${chartSettingForm.chartType=='hbullet'}">
        chartHeight="150";

        </c:if>
        <c:if test="${not empty chartSettingForm.jsonStr}">
        var revenueChart = new FusionCharts({
            "type": "${chartSettingForm.chartType}",
            "renderAt": "${ns}chartContainer",
            "width": "100%", // 500
            "height": "${chartSettingForm.chartHeight}", // chartHeight,
            "dataFormat": "json",
            "dataSource":${chartSettingForm.jsonStr}

        });
        revenueChart.render();

        </c:if>
        --%>
        <%--
        YUI().use(
                'aui-tooltip',
                function(Y) {
                    new Y.TooltipDelegate(
                            {
                                trigger: '#${ns}myTooltip',
                                position: 'right'
                            }
                    );
                }
        );
   --%>
    })
    function ${ns}linkto(link_url){
        window.open(link_url,"_blank");
    }
    function ${ns}renderTable(){
    	 var jsonStrObj=${chartSettingForm.jsonStr};
         var caption=jsonStrObj.table.caption;
         var subCaption=jsonStrObj.table.subCaption;
         var header =jsonStrObj.header;
         var dataset= jsonStrObj.dataset;
         $("#${ns}chart_table_caption").html("<b>"+caption+"</b><br/>");
         $("#${ns}chart_table_subCaption").html(subCaption);
         var str="<table class=\"table table-bordered\">";
         if(header.length>0){
             str=str+"<thead bgcolor=\""+jsonStrObj.table.headerBgColor+"\">"+"<tr>";
	         for(var i=0;i<header.length;i++){
	             str=str+""+
	                 "<th class=\"th_class\"  style=\"text-align:center\" >"+header[i].cell+"</th>";
	         }
	         str=str+"</tr></thead>";
    	}
         //data
         str=str+"<tbody>";
         for(var i=0;i<dataset.length;i++){
             var datarow=dataset[i].data;
             str=str+""+ " <tr style=\"cursor: pointer;\" \">";
             for(var j=0;j<datarow.length;j++){
                 str=str+""+"<td  style=\"text-align:left\">";
                 if( datarow.length>0){
                     str=str+""+datarow[j].value;
                 }
                 str=str+""+"</td>";
             }
             str=str+"</tr>";
         }
         str=str+"</tbody>";
         str=str+"</table>";
         $("#${ns}chartContainer").html(str);
     	 //function
		var tgr =	$("#${ns}chartContainer>table>tbody");
         //footer
         if(jsonStrObj.footer.length>0){
        	for(var i = 0 ;i<jsonStrObj.footer.length;i++){
        		
        	}
         }
    }
    function ${ns}renderTableOld(){
        var jsonStrObj=${chartSettingForm.jsonStr};
        var headers_title =jsonStrObj.table.header_title;
        var header_width =jsonStrObj.table.header_width;
        var row_position=jsonStrObj.table.row_position;
        var caption=jsonStrObj.table.caption;
        var subCaption=jsonStrObj.table.subCaption;
        var row_picture=jsonStrObj.table.row_picture;
        var datas= jsonStrObj.data;
        $("#${ns}chart_table_caption").html("<b>"+caption+"</b><br/>");
        $("#${ns}chart_table_subCaption").html(subCaption);
        //alert(datas)
        var str="<table class=\"table table-bordered\">"+
                "<thead>"+
                " <tr>";
        for(var i=0;i<headers_title.length;i++){
            str=str+""+
                "<th class=\"th_class\" width=\""+header_width[i]+"%\" style=\"text-align:center\" >"+headers_title[i]+"</th>";
        }
        for(var i=0;i<datas.length;i++){
            var values=datas[i].value;
           // alert(row_picture[i])
            str=str+""+
                    " <tr style=\"cursor: pointer;\" \">";
            for(var j=0;j<values.length;j++){
                str=str+""+
                        "<td  style=\"text-align:"+row_position[j]+"\">";

                if(row_picture[j]=='1' && values[j].length>0){
                    str=str+"<img src=\"/ChartPortlet/resources/images/"+values[j]+"\" style=\"cursor:pointer;width:16px;height: 16px;\" />";
                }else{
                    str=str+""+values[j];

                }
                str=str+""+"</td>";
            }
            str=str+"</tr>";
        }
        str=str+"</tbody>"+
                        "</table>";
        $("#${ns}chartContainer").html(str);
        //alert(jsonStrObj.chart.header_title)
    }
</script>
<script>
    $(document).ready(function () {
        $("#${ns}comment_bt").popover({
            html:true
        });
        $("#${ns}comment_bt2").popover({
            html:true
        });
        var dataSource;
        var chartype="${chartSettingForm.chartType}";
        var chartHeight="300"; //default
        if(chartype=="gantt"){ chartHeight="600"; }
        else if(chartype=="hbullet"){ chartHeight="150"; }
        <c:if test="${not empty chartSettingForm.jsonStr && chartSettingForm.chartType!='table'}">
        var revenueChart = new FusionCharts({
            "type": "${chartSettingForm.chartType}",
            "renderAt": "${ns}chartContainer",
            "width": "100%", // 500
            "height": "${chartSettingForm.chartHeight}", // chartHeight,
            "dataFormat": "json",
            "dataSource":${chartSettingForm.jsonStr}

        });
        revenueChart.render();
        /*
        var revenueChart = new FusionCharts({
            "type": chartype,
            "renderAt": "${ns}chartContainer",
            "width": "100%", // 500
            "height": chartHeight, 
            "dataFormat": "json",
            "dataSource":${chartSettingForm.jsonStr}
        });
        revenueChart.render();*/
        </c:if>        
        <c:if test="${chartSettingForm.chartType=='table' }">
            ${ns}renderTable();
        </c:if>

    });
</script>
        </body>
</html>