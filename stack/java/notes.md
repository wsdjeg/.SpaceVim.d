### 第一章 Java程序设计概述
#### Java程序设计平台

Java不只是一中语言，而是一个完整的平台，有一个庞大的库，其中包含了很多可重用的代码和一个提供诸如安全性、跨操作系统的可移植性以及自动垃圾回收等服务的执行环境。

#### java“白皮书”的关键术语
- 简单性：语法简单，去除了C++中部分不适当的特性 支持小型机器；
- 面向对象：面向对象是一种设计艺术，重点放在数据的对象的接口上；
- 网络技能：大量类库支持，便于网络开发；
- 健壮性：Java编译时能检测出许多在其它语言中仅能在运行时刻才能检测出的问题；
- 安全性：
- 体系结构中立：
- 可移植性：Java中数据类型有固定的大小，这消除了代码移植时的问题；
- 解释型：增量链接，言过其实，但目前即时编译技术使得效率更高；
- 高性能：即时编译含有更多可用的信息，监控代码执行频率，消除函数内嵌；
- 多线程：
- 动态性：

#### Java applet 与 Internet

#### Java 发展简史

```
1991 Green
    ↓
1992 * 7
    ↓
1993 First Person
    ↓
1994
    ↓
1995 HotJava applet
    ↓
1996 - 今 Java
```

#### 关于Java的常见误解

### 第二章 Java程序设计环境

- *JDK*
```shell
sudo apt-get install openjdk-8-jdk
sudo apt-get install openjdk-8-doc
sudo apt-get install openjdk-8-source
```

- *VIM*or*NEOVIM*

[vimrc](https://github.com/wsdjeg/DotFiles/blob/master/vimrc)

### 第三章 Java的基本程序设计结构
访问修饰符 access modifier
骆驼命名 CamelCase

关于字符串，应先判断是否为null，否则调用方法是会出现运行时异常；

![2015-12-27 20-43-36](https://cloud.githubusercontent.com/assets/13142418/12010282/d2764e7c-acda-11e5-9a6e-b4892820daff.png)

### 第五章 继承(inheritance)

一个对象变量可以指示多种实际类型的现象被称为多态(polymorphism)。在运行时能够自动地选择调用哪个方法的现象被称为动态绑定(dynamic bingding)。

Java语言规范要求euqals方法具有下面的特征：

1. 自反性：对于任何非空引用x，x.equals(x)应该返回true
2. 对称性：对于任何引用x和y，当且仅当y.equals(x)返回true时，x.equals(y)也应当返回true
3. 传递性：对于任何引用x,y和z，如果x.equals(y)返回true，y.equals(z)返回true，那么x.equals(z)也应该返回true
4. 一致性：如果x和y的引用对象没有发生变化，那么反复调用x.equals(y)应该返回同样的值
5. 对于任意非空引用x，x.equals(null)应该返回false

### LINKS

[java8-the-missing-tutorial](https://github.com/shekhargulati/java8-the-missing-tutorial)

##JavaWeb开发学习笔记

###求解给定List中和为指定数值对所有可能组合

1. 利用递归循环,求出所有组合可能 并存入List中,再存入List<List>中,遍历 判断 筛选最终组合

2. 对给定的List进行处理,排序,求最多最少可能取值对个数

3. 用String 替换掉List 并连同已取值求和 和取值位置 以及 等信息 传参,在取最后一个数时进行判断,若值等于sum 则追加String


### MVN新建java应用
```shell
    mvn -B archetype:generate \
      -DarchetypeGroupId=org.apache.maven.archetypes \
      -DgroupId=com.mycompany.app \
      -DartifactId=my-app
```
```shell
mvn archetype:generate -DgroupId=com.test -DartifactId=web-app -DarchetypeArtifactId=maven-archetype-webapp -DinteractiveMode=false
```
Struts2 环境搭建
pom.xml
```xml
        <dependency>
            <groupId>org.apache.struts</groupId>
            <artifactId>struts2-core</artifactId>
            <version>2.5-BETA2</version>
        </dependency>

```
wen.xml
```xml
    <filter>
        <filter-name>struts2</filter-name>
        <filter-class>org.apache.struts2.dispatcher.filter.StrutsPrepareAndExecuteFilter</filter-class>
        <!--<filter-class>org.apache.struts2.dispatcher.ng.filter.StrutsPrepareAndExecuteFilter</filter-class>-->
    </filter>

    <filter-mapping>
        <filter-name>struts2</filter-name>
        <url-pattern>*.action</url-pattern>
    </filter-mapping>
```
struts.xml
```xml
<!DOCTYPE struts PUBLIC "-//Apache Software Foundation//DTD Struts Configuration 2.0//EN" "http://struts.apache.org/dtds/struts-2.0.dtd">
<struts>
    <include file="struts-default.xml"></include>
    <package name="a" extends="struts-default">
       <action name="helloworld" class="com.wsdjeg.action.HelloWorldAction">
           <result>/result.jsp</result>
       </action>
       <action name="product-input" class="com.wsdjeg.action.ProductAction" method="save">
           <!--
                result 子标签 包含 name 属性 匹配方法返回值
                type 标签说明响应类型
                标签体为响应目的地


            -->
           <result name="success" type="dispatcher">/WEB-INF/page/productdetails.jsp</result>
       </action>
       <action name="productlist" class="com.wsdjeg.action.ProductAction" method="listAll">
           <result>/WEB-INF/page/productlist.jsp</result>
       </action>
    </package>
</struts>
```

mvn 单元测试
mvn test -Dtest=com.wsdjeg.test.HibernateTestTest

pom.xml
```
<dependency>
      <groupId>junit</groupId>
            <artifactId>junit</artifactId>
                  <version>4.11</version>
                        <scope>test</scope>
                            </dependency>
```
```java
import org.junit.Assert;
import org.junit.Test;

public class DaemonTest{
    @Test
    public void test(){}
}


```

###jQuery study notes

install jQuery by maven


add this dependency into pom.xml
```xml
        <dependency>
            <groupId>org.webjars</groupId>
            <artifactId>jquery</artifactId>
            <version>3.0.0-alpha1</version>
        </dependency>

```

test.jsp

```jsp

<%@ page language="java" contentType = "text/html;charset=UTF-8"
pageEncoding="UTF-8"%>
<html>
    <script type="text/javascript" src="webjars/jquery/3.0.0-alpha1/jquery.min.js"></script>
    <script type="text/javascript">
            $(document).ready(function(){
                alert("helloworld");
            });
    </script>
</html>
```

the conversion between object of jQuery and DOM

```js
var $cr = $("#cr"); //var cr = document.getElementById("cr"); only one object
var cr = $cr[0];// var cr = $cr.get(0);
```
```js
var cr = document.getElementById("cr");
var $cr = $(cr);
```

jQuery 的优点

1. 简洁
```js
$("#id")   //document.getElementById("id");需要判断此对象是否存在,才可以使用方法,否则浏览器报错
$("tagName")  //document.getElementsByTagName("tagName")

if(document.getElementById("id"))
    document.getElementById("id").style.color = "red";

//而使用jquery则不需要判断
$("#id").css("color","red");
```

2. jQuery hide() show() toggle()

```js
$("#hide").click(function(){
          $("p").hide();
          });

$("#show").click(function(){
          $("p").show();
          });
<p>test</p>

```
$(selector).toggle(speed,callback);

3. jQuery 淡入淡出效果

jQuery fadeIn(speed,callback) fadeOut(speed,callback) fadeToggle(speed,callback)

fadeTo(speed,opacity,callback)

`0<opacity<1`

4. jQuery 上下滑动效果

jQuery slideDown(speed,callback) slideUp(speed,callback) slideToggle(speed,callback)


5. jQuery animate({params},speed,callback)

params 必须的

```js
$("button").click(function(){
  var div=$("div");
  div.animate({height:'300px',opacity:'0.4'},"slow");
  div.animate({width:'300px',opacity:'0.8'},"slow");
  div.animate({height:'100px',opacity:'0.4'},"slow");
  div.animate({width:'100px',opacity:'0.8'},"slow");
});
```

animate 队列按序执行

5. stop(stopAll,gotoEnd)

默认两个参数都是false

6. callback函数

为了避免动画结束之前,后续队列中的js语句执行产生错误或者冲突

7. jQuery 方法链接技术

```js
$("#p1").css("color","red").slideUp(2000).slideDown(2000);
```
```js
$("#p1").css("color","red")
    .slideUp(2000)
    .slideDown(2000);
```

8. html获取和设置 html() text() val() 均可以有回调函数 callback()


```js
$("#test").html()//获取
$("#test").html("hello text!")//设置


```
9. 添加 append() prepend() after() before()

```js
//创建对象
var text1 = "<p>test</p>"
var text2 = $("<i></i>").text("test text!")

```
