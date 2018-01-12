<%@ taglib prefix="e" uri="https://www.owasp.org/index.php/OWASP_Java_Encoder_Project" %>
<div class="card border-dark mb-3">
    <%--<div class="card-header">${param.title}</div>--%>
    <div class="card-body text-dark">
        <div class="row">
            <div class="col-2">
                <img style="float: left; margin-right: 5%" src="https://placem.at/things?h=100&w=100&random=1&txt=0" alt="">
            </div>
            <div class="col-10">
                <h4 style="display: inline">Title:  <e:forHtmlContent value="${param.title}" /></h4><br>
                <span class="card-text">Category: <e:forHtmlContent value="${param.category}" /></span><br>
                <span class="card-text">Date:  <e:forHtmlContent value="${param.date}" /></span><br>
                <span style="text-align: center" class="card-text">Location:  <e:forHtmlContent value="${param.location}" /></span>
            </div>
        </div>
    </div>
</div>


