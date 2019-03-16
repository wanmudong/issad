<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/bootstrap.min.css" type="text/css" />
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
    <style>
        .center{
            margin:1%;
            text-align:center;
        }
        .table-striped > tbody > tr:nth-child(2n+1) > td,
        .table-striped > tbody > tr:nth-child(2n+1) > th {
            background-color: rgb(217, 237, 247);
        }
        .col-center-block {
            float: none;
            display: block;
            margin-left: auto;
            margin-right: auto;
        }
        form{
            margin-top: 100px;
        }
        .error{
            color:red
        }

    </style>
    <script  type="text/javascript">
        $(function(){
            $("#myform").validate({
                rules:{
                    "name":{
                        "required":true,
                        "rangelength":[2,10]
                    },
                    "age":{
                        "required":true,
                        "max":200
                    },
                    "sex":{
                        "required":true

                    },
                    "collegeId":{
                        "required":true
                    },
                    "majorId":{
                        "required":true

                    }
                },
                messages:{
                    "name":{
                        "required":"姓名不能为空",
                        "rangelength":"姓名长度应该在2到10之间"
                    }, "age":{
                        "required":"年龄不能为空",
                        "max":"年龄不能超过200岁"
                    }, "sex":{
                        "required":"性别不能为空"
                    }, "collegeId":{
                        "required":"学院不能为空"
                    }, "majorId":{
                        "required":"专业不能为空"

                    }
                }
            });
        });

    </script>
    <script>
        function formReset()
         {
                 document.getElementById("myform").reset();
         }
    </script>
</head>
<body>
<div class="col-xs-6 col-md-4 col-center-block">
    <h1  style="font-family: '造字工房悦圆演示版'">输入学生信息<small>Student Information </small></h1>
    <form  id="myform"  class="form-horizontal" action="/students/add" method="post" accept-charset="UTF-8">

        <div class="form-group">
            <label for="name" class="col-sm-3 control-label"  style="font-family: '造字工房悦圆演示版'">姓名：</label>
            <div class="col-sm-9">
                <input name="name" id="name" type="text" class="form-control" placeholder="例如：林思意">
            </div>
        </div>
        <div class="form-group">
            <label for="money"  class="col-sm-3 control-label"  style="font-family: '造字工房悦圆演示版'">年龄：</label>
            <div class="col-sm-9">
                <input name="age" id="age" type="text" class="form-control" placeholder="例如：23">
            </div>

        </div>
        <div class="form-group">
        <label   class="col-sm-3 control-label"  style="font-family: '造字工房悦圆演示版'">性别：</label>
        <div   class="col-md-offset-1 col-sm-7 "  >
            <label  class="radio">
                <input type="radio" name="sex" id="optionsRadios1" value="男" checked>男

            </label>
            <label  class="radio">
                <input type="radio" name="sex" id="optionsRadios2" value="女">女

            </label>
        </div>
        </div>

        <div class="form-group">
            <label for="hobby"  class="col-sm-3 control-label"  style="font-family: '造字工房悦圆演示版'">爱好：</label>
            <div name="hobby" class="col-sm-9">
                <label class="checkbox-inline">
                    <input type="checkbox" id="1" value="体育" name="hobby"> 体育
                </label>
                <label class="checkbox-inline">
                    <input type="checkbox" id="2" value="音乐"name="hobby"> 音乐
                </label>
                <label class="checkbox-inline">
                    <input type="checkbox" id="3" value="旅游" name="hobby"> 旅游
                </label>
                <label class="checkbox-inline">
                    <input  type="checkbox"  value="游戏" name="hobby"/>游戏
                </label>
            </div>
        </div>

        <div class="form-group">
            <label for="college"  class="col-sm-3 control-label"  style="font-family: '造字工房悦圆演示版'">学院：</label>
            <div class="col-sm-9">
                <select id="college" name="collegeId" style="font-size:24" onchange="college_major()">
                    <option value="--------">--------</option>
                    <c:forEach items="${listCollege}" var="college">
                        <option value="${college.id}" >${college.collegeName}</option>
                    </c:forEach>

                </select>
            </div>
        </div>
        <div class="form-group"    >
            <label for="college"  class="col-sm-3 control-label"  style="font-family: '造字工房悦圆演示版'">专业：</label>
            <div class="col-sm-9"   >
                <select id="major" name="majorId" style="font-size:24">
                    <option value="--------">--------</option>

                </select>
            </div>
        </div>
        <%--<button type="submit" class="btn btn-default">Submit</button>--%>
         <%--<input type="submit" name="add" value="添加学生信息"> </td>--%>
        <%--<input type="reset" name="reset" value="重置" style="width:100"> </td>--%>


        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-primary">提交</button>
                <a class="btn btn-default" type="reset" name="reset" role="button" onclick="formReset()">重置</a>
            </div>
        </div>

    </form>
</div>
        <%--<div class="form-group">--%>
            <%--<label for="pickingPerson"  class="col-sm-3 control-label"  style="font-family: '造字工房悦圆演示版'">领料人姓名：</label>--%>
            <%--<div class="col-sm-9">--%>
                <%--<input name="pickingPerson" id="pickingPerson" type="text" class="form-control" placeholder="例如：许佳琪">--%>
            <%--</div>--%>
        <%--</div>--%>
        <%--<div class="form-group">--%>
            <%--<label for="keeper"  class="col-sm-3 control-label"  style="font-family: '造字工房悦圆演示版'">库管员姓名：</label>--%>
            <%--<div class="col-sm-9">--%>
                <%--<input name="keeper" id="keeper" type="text" class="form-control" placeholder="例如：鞠婧祎">--%>
            <%--</div>--%>
        <%--</div>--%>
        <%--<div class="form-group">--%>
            <%--<label for="pickingDepartment"  class="col-sm-3 control-label"  style="font-family: '造字工房悦圆演示版'">领料部门名称：</label>--%>
            <%--<div class="col-sm-9">--%>
                <%--<input name="pickingDepartment" id="pickingDepartment" type="text" class="form-control" placeholder="例如：产品部">--%>
            <%--</div>--%>
        <%--</div>--%>
        <%--<div class="form-group">--%>

            <%--<label for="auditor"  class="col-sm-3 control-label"  style="font-family: '造字工房悦圆演示版'">审核人员姓名：</label>--%>
            <%--<div class="col-sm-9">--%>
                <%--<input name="auditor" id="auditor" type="text" class="form-control" placeholder="例如：朱小丹">--%>
            <%--</div>--%>
        <%--</div>--%>
        <%--<div class="form-group">--%>
            <%--<label for="auditDate" class="col-sm-3 control-label"  style="font-family: '造字工房悦圆演示版'">审核日期：</label>--%>
            <%--<div class="col-sm-9">--%>
                <%--<input name="auditDate" id="auditDate" type="text" class="form-control" placeholder="例如：2016-02-12">--%>
            <%--</div>--%>
        <%--</div>--%>
        <%--<div class="form-group">--%>
            <%--<label for="memo"  class="col-sm-3 control-label"  style="font-family: '造字工房悦圆演示版'">备注事项：</label>--%>
            <%--<div class="col-sm-9">--%>
                <%--<textarea  name="memo" id="memo"  class="form-control" rows="3" placeholder="不应当超过20字"></textarea>--%>
            <%--</div>--%>
        <%--</div>--%>
        <%--<div class="form-group">--%>
            <%--<div class="col-sm-offset-2 col-sm-10">--%>
                <%--<button type="submit" class="btn btn-primary">提交</button>--%>
                <%--<a class="btn btn-default" href="/demo/index.jsp" role="button">返回</a>--%>
            <%--</div>--%>
        <%--</div>--%>

<%--<div class="center">--%>
    <%--<div style="font-size:24"> 输入学生信息 </div>--%>
    <%--<form id="myform" action="/students/add" method="post" >--%>
        <%--&lt;%&ndash;<table border="1">&ndash;%&gt;--%>
            <%--<tr>--%>
                <%--<td style="width:100px" > 姓名：</td>--%>
                <%--<td ><input type="text" name="name" style="font-size:24"/></td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
                <%--<td style="width:100px" > 年龄：</td>--%>
                <%--<td ><input type="text" name="age" style="font-size:24"/></td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
                <%--<td  style="width:100"> 性别：</td>--%>
                <%--<td>--%>
                    <%--<input style=" font-size:24" type="radio" name="sex"  value="男" checked/>男--%>
                    <%--<input style=" font-size:24" type="radio" name="sex" value="女" />女--%>
                <%--</td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
                <%--<td  style="width:100"> 爱好：</td>--%>
                <%--<td>--%>
                    <%--<input style=" font-size:24" type="checkbox" name="hobby" value="体育"/>体育--%>
                    <%--<input style=" font-size:24" type="checkbox" name="hobby" value="音乐"/>音乐--%>
                    <%--<input style=" font-size:24" type="checkbox" name="hobby" value="旅游"/>旅游--%>
                    <%--<input style=" font-size:24" type="checkbox" name="hobby" value="游戏"/>游戏--%>
                <%--</td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
                <%--<td  style="width:100" > 学院：</td>--%>
                <%--<td>--%>
                    <%--<select id="college" name="collegeId" style="font-size:24" onchange="college_major()">--%>
                        <%--<option value="--------">--------</option>--%>
                        <%--<c:forEach items="${listCollege}" var="college">--%>
                            <%--<option value="${college.id}" >${college.collegeName}</option>--%>
                        <%--</c:forEach>--%>

                    <%--</select>--%>
                <%--</td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
                <%--<td style="width:100"> 专业：</td>--%>
                <%--<td>--%>
                    <%--<select id="major" name="majorId" style="font-size:24">--%>
                        <%--<option value="--------">--------</option>--%>

                    <%--</select>--%>
                <%--</td>--%>
            <%--&lt;%&ndash;</tr>&ndash;%&gt;--%>
        <%--</table>--%>
        <%--<p/>--%>
        <%--&lt;%&ndash;<table>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<tr>&ndash;%&gt;--%>
                <%--&lt;%&ndash;<td> <input type="submit" name="add" value="添加学生信息"> </td>&ndash;%&gt;--%>
                <%--&lt;%&ndash;<td> <input type="reset" name="reset" value="重置" style="width:100"> </td>&ndash;%&gt;--%>
            <%--&lt;%&ndash;</tr>&ndash;%&gt;--%>
        <%--&lt;%&ndash;</table>&ndash;%&gt;--%>
    <%--</form>--%>

<%--</div>--%>
<hr>
<div class="col-xs-6 col-md-8 col-center-block">
<div id="llan" align="center">
    <div class="column-layout-container">
        <h1  style="font-family: '造字工房悦圆演示版'">学生信息浏览</h1>

    </div>
    <div style="font-size:24"> 学生信息浏览 </div>
    <h class="center">
    <table class="table table-striped table-hover" id="mainT" >
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

            <%--<td >--%>
                <%--<input type="button" name="update" value="修改" onclick="location.href='update/${student.id}'">--%>
                <%--<input type="button" name="delete" value="删除" onclick="location.href='del/${student.id}'">--%>
            <%--</td>--%>
                <td><a href="update/${student.id}">修改</a>
                    <%--<td><a href="javascript:if(confirm('确实要删除吗?'))/demo/MaterialCl?type=delete&id=${ material.deliveryOrder}">删除</a></td>--%>

                <a href="/students/del/${student.id}">删除</a></td>
            </tr>
        </c:forEach>
    </table>
    </h>
</div>

</div>
</body>
</html>