<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 21/04/2020
  Time: 6:33 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .lds-facebook {
        display: inline-block;
        position: relative;
        width: 80px;
        height: 80px;
        text-align: center;
    }
    .lds-facebook div {
        display: inline-block;
        position: absolute;
        left: 8px;
        width: 16px;
        background: #812529;
        animation: lds-facebook 1.2s cubic-bezier(0, 0.5, 0.5, 1) infinite;
    }
    .lds-facebook div:nth-child(1) {
        left: 8px;
        animation-delay: -0.24s;
    }
    .lds-facebook div:nth-child(2) {
        left: 32px;
        animation-delay: -0.12s;
    }
    .lds-facebook div:nth-child(3) {
        left: 56px;
        animation-delay: 0;
    }
    @keyframes lds-facebook {
        0% {
            top: 8px;
            height: 64px;
        }
        50%, 100% {
            top: 24px;
            height: 32px;
        }
    }
</style>
<div class="pos-loading" style="position: fixed;display:flex;align-items:center;justify-content:center;background-color:white;top: 0;right:0;left: 0;top: 0;height: 100%;width: 100%;z-index: 100">

    <div>
        <div>
            <img style="height:350px;" src="<%=request.getContextPath() %>/img/Victoria_1.png">
        </div>
        <div style="display: flex;justify-content: center;align-items: center">
            <div class="lds-facebook"><div></div><div></div><div></div>
        </div>
    </div>
    </div>

</div>
<script>
    document.onreadystatechange = function() {
        if (document.readyState !== "complete") {
            $(".pos-loading").show();

        } else {
            $(".pos-loading").hide();
        }
    };
</script>
