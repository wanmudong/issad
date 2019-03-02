<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <form id="myform" action="/students/add" method="post" >
        <table border="1">
            <tr>
                <td style="width:100px" > 姓名：</td>
                <td ><input type="text" name="name" style="font-size:24"/></td>
            </tr>
            <tr>
                <td style="width:100px" > 年龄：</td>
                <td ><input type="text" name="age" style="font-size:24"/></td>
            </tr>
            <tr>
                <td  style="width:100"> 性别：</td>
                <td>
                    <input style=" font-size:24" type="radio" name="sex"  value="男" checked/>男
                    <input style=" font-size:24" type="radio" name="sex" value="女" />女
                </td>
            </tr>
            <tr>
                <td  style="width:100"> 爱好：</td>
                <td>
                    <input style=" font-size:24" type="checkbox" name="hobby" value="体育"/>体育
                    <input style=" font-size:24" type="checkbox" name="hobby" value="音乐"/>音乐
                    <input style=" font-size:24" type="checkbox" name="hobby" value="旅游"/>旅游
                    <input style=" font-size:24" type="checkbox" name="hobby" value="游戏"/>游戏
                </td>
            </tr>
            <tr>
                <td  style="width:100" > 学院：</td>
                <td>
                    <select id="college" name="collegeId" style="font-size:24" onchange="college_major()">
                        <option value="--------">--------</option>
                        <c:forEach items="${listCollege}" var="college">
                            <option value="${college.id}" >${college.collegeName}</option>
                        </c:forEach>

                    </select>
                </td>
            </tr>
            <tr>
                <td style="width:100"> 专业：</td>
                <td>
                    <select id="major" name="majorId" style="font-size:24">
                        <option value="--------">--------</option>

                    </select>
                </td>
            </tr>
        </table>
        <p/>
        <table>
            <tr>
                <td> <input type="submit" name="add" value="添加学生信息"> </td>
                <td> <input type="reset" name="reset" value="重置" style="width:100"> </td>
            </tr>
        </table>
    </form>

</div>
<div id="llan" align="center">
    <div style="font-size:24"> 学生信息浏览 </div>
    <table border="1">
        <tr align="center">
            <td style="width:100">姓名</td>
            <td style="width:100">年龄</td>
            <td style="width:100">性别</td>
            <td style="width:100">爱好</td>
            <td style="width:100">学院</td>
            <td style="width:100">专业</td>
            <td style="width:100">修改与删除</td>
        </tr>
        <%--<tr align="center">--%>
            <%--<td >张三</td>--%>
            <%--<td >18</td>--%>
            <%--<td >男</td>--%>
            <%--<td >体育,音乐</td>--%>
            <%--<td >计算机学院</td>--%>
            <%--<td >电子技术</td>--%>
            <%--<td >--%>
                <%--<input type="button" name="update" value="修改" >--%>
                <%--<input type="button" name="delete" value="删除">--%>
            <%--</td>--%>
        <%--</tr>--%>
        <c:forEach items="${listStudent}" var="student">
            <tr>
            <option value="${college.id}" >${college.collegeName}</option>
            <td >${student.name}</td>
            <td >${student.age}</td>
            <td >${student.sex}</td>
            <td >${student.hobby}</td>
            <td >${student.college}</td>
            <td >${student.major}</td>

            <td >
                <input type="button" name="update" value="修改" onclick="location.href='update/${student.id}'">
                <input type="button" name="delete" value="删除" onclick="location.href='del/${student.id}'">
            </td>
            </tr>
        </c:forEach>
    </table>
</div>


</body>
</html>