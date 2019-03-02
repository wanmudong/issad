<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <%--<link rel="stylesheet" href="/bootstrap.min.css" type="text/css" />--%>
    <script src="/jquery-1.11.3.min.js" type="text/javascript"></script>
    <!-- 引入表单校验jquery插件 -->
    <script src="/jquery.validate.min.js" type="text/javascript"></script>
    <script src="/bootstrap.min.js" type="text/javascript"></script>
    <script type="text/javascript">

        function college_major() {

            var selectNodesObj = document.getElementById('college');
            var selIndex = selectNodesObj.selectedIndex;     //获取当前选择的选项的index值
            var selValue = selectNodesObj.options[selIndex].value; //获取当前选择项的值
            console.log(selIndex)
            console.log(selValue)

            $.ajax({
                "async":false,
                "url":"/students/major/"+selValue,
                "type":"GET",
                "dataType":"json",
                "success":function(data){
                    console.log(data)
                    document.getElementById("major").options.length=0;
                    var selectNodesObjMajor = document.getElementById('major');
                    data.forEach(item => console.log(item));
                    <%--data.forEach(item => {selectNodesObjMajor.appendChild('<option value="${item.id}"  >${item.majorName}</option>')})--%>
                    data.forEach(item => {selectNodesObjMajor.options.add(new Option(item.majorName,item.id))});
                    // selectNodesObjMajor.appendChild()

                }
            });
        }

    </script>
</head>
<body>
<div id="shr" align="center" style="margin-top:50">
    <div style="font-size:24"> 输入学生信息 </div>
    <form id="myform" action="/students/update" method="post" >
        <table border="1">
            <tr>
                <td style="width:100px" > 姓名：</td>
                <td ><input type="text" name="name" style="font-size:24" value="${student.name}"/></td>
            </tr>
            <tr>
                <td style="width:100px" > 年龄：</td>
                <td ><input type="text" name="age" style="font-size:24" value="${student.age}"/></td>
            </tr>
            <tr>
                <td  style="width:100"> 性别：</td>
                <td>
                    <input style=" font-size:24" type="radio" name="sex"  value="男"
                           <c:if test="${student.sex == '男'}">
                            checked
                            </c:if>
                    >男
                    <input style=" font-size:24" type="radio" name="sex" value="女"
                            <c:if test="${student.sex == '女'}">
                            checked
                            </c:if>
                    />女
                </td>
            </tr>
            <tr>
                <td  style="width:100"> 爱好：</td>
                <td>
                    <input style=" font-size:24" type="checkbox" name="hobby" value="体育"
                            <c:if test="${fn:contains(student.hobby, '体育')}">
                                checked
                            </c:if>
                    />体育
                    <input style=" font-size:24" type="checkbox" name="hobby" value="音乐"
                            <c:if test="${fn:contains(student.hobby, '音乐')}">
                                checked
                            </c:if>
                    />音乐
                    <input style=" font-size:24" type="checkbox" name="hobby" value="旅游"
                            <c:if test="${fn:contains(student.hobby, '旅游')}">
                                checked
                            </c:if>
                    />旅游
                    <input style=" font-size:24" type="checkbox" name="hobby" value="游戏"
                            <c:if test="${fn:contains(student.hobby, '游戏')}">
                                checked
                            </c:if>
                    />游戏
                </td>
            </tr>
            <tr>
                <td  style="width:100" > 学院：</td>
                <td>
                    <select id="college" name="collegeId" style="font-size:24" onchange="college_major()">
                        <option value="--------">--------</option>
                        <c:forEach items="${listCollege}" var="college">
                            <option value="${college.id}"
                                    <c:if test="${student.collegeId == college.id}">
                                        selected="selected"
                                    </c:if>
                            >${college.collegeName}</option>
                        </c:forEach>

                    </select>
                </td>
            </tr>
            <tr>
                <td style="width:100"> 专业：</td>
                <td>
                    <select id="major" name="majorId" style="font-size:24">
                        <c:if test="${student.majorId != null }">
                           <option value="${student.majorId}">${student.major}</option>
                        </c:if>

                    </select>
                </td>
            </tr>
        </table>
        <p/>
        <table>
            <tr>

                <td> <input type="hidden" name="id" value="${student.id}"> </td>
                <td> <input type="submit" name="add" value="修改学生信息"> </td>
                <td> <input type="reset" name="reset" value="重置" style="width:100"> </td>
            </tr>
        </table>
    </form>

</div>


</body>
</html>