---

layout: post

date:        "2013-05-27"
title:       "Spring - Quick start tutorial"
description: "The Spring Framework is an open source application framework and inversion of control container for the Java platform."

categories: java spring framework

resources:
  - "[http://spring.io](http://spring.io)"
  - "[http://en.wikipedia.org/wiki/Spring_Framework](http://en.wikipedia.org/wiki/Spring_Framework)"

---


The [Spring Framework](http://spring.io) is an open source application framework and inversion of control container for the Java platform.
The framework's core features can be used by any Java application, but there are extensions for building web applications on top of the Java EE platform.
Although the framework does not impose any specific programming model, it has become popular in the Java community as an alternative to, replacement for,
or even addition to the Enterprise JavaBean (EJB) model ([Wikipedia / Spring Framework](http://en.wikipedia.org/wiki/Spring_Framework)).

A key element of Spring is infrastructural support at the application level: Spring focuses on the "plumbing" of enterprise applications
so that teams can focus on application-level business logic, without unnecessary ties to specific deployment environments.


## Spring dependencies

The Spring dependencies are available for download via [Maven Central Repository](http://search.maven.org).

*pom.xml*

{% highlight xml %}
<project
    xmlns="http://maven.apache.org/POM/4.0.0"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://maven.apache.org/POM/4.0.0
                        http://maven.apache.org/xsd/maven-4.0.0.xsd">
 
    <modelVersion>4.0.0</modelVersion>
 
    <groupId>spring-tutorials</groupId>
    <artifactId>spring-quick-tutorial</artifactId>
    <version>1.0</version>
 
    <name>Spring - Quick tutorial</name>
 
    <dependencies>
 
        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-context</artifactId>
            <version>3.1.4.RELEASE</version>
        </dependency>
 
    </dependencies>
 
</project>
{% endhighlight %}


## Spring bean (the java class)

*SpringBean.java*

{% highlight java %}
package spring.quick.tutorial;

/**
 * A simple spring bean.
 */
public class SpringBean {

    private String name;

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void printName() {
        System.out.println("name: " + name);
    }
}
{% endhighlight %}


## Spring bean configuration file

*spring.xml*

{% highlight xml %}
<beans
    xmlns="http://www.springframework.org/schema/beans"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://www.springframework.org/schema/beans
                        http://www.springframework.org/schema/beans/spring-beans-3.1.xsd">

    <bean id="bean" class="spring.quick.tutorial.SpringBean">
        <property name="name" value="Cristian Sulea" />
    </bean>

</beans>
{% endhighlight %}


## Run It

*SpringQuickTutorial.java*

{% highlight java %}
package spring.quick.tutorial;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class SpringQuickTutorial {

    public static void main(String[] args) {

        ApplicationContext context = new ClassPathXmlApplicationContext("spring.xml");
        SpringBean bean = (SpringBean) context.getBean("bean");

        bean.printName();
    }
}
{% endhighlight %}

*Output:*

{% highlight txt %}
name: Cristian Sulea
{% endhighlight %}

{% include resources.html %}
