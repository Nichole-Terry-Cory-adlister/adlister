<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="e" uri="https://www.owasp.org/index.php/OWASP_Java_Encoder_Project" %>
<title><e:forHtmlContent value="${param.title}" /></title>
<link href="../../assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="../../assets/css/customStyling.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<%--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>--%>
<script src="https://static.filestackapi.com/v3/filestack.js"></script>
<script src="../../assets/js/popper.min.js"></script>
<script src="../../assets/js/bootstrap.min.js"></script>

<script>
    $(document).ready(function(){
        $("#myBtn").click(function(e){
            e.preventDefault();
            $("#myModal").modal('show');
        });
    });
</script>
