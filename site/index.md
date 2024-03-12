---
layout: base
site:
  title: Cristian Sulea
  description: Software Developer
  title_hide: true
---

# Cristian Sulea
> Software Developer
> - [<img src="assets/github2.svg" style="max-width: 1rem;">](http://google.com.au/) LinkedIn
> - [<img src="assets/linkedin.svg" style="max-width: 1rem;">](http://google.com.au/) LinkedIn


- [![GitHub](assets/github2.svgx)](https://example.com) [GitHub](https://example.com)
- [<img src="assets/github.svg" style="max-width: 1rem;">](http://google.com.au/)

> {%- include icons/linkedin.svg -%}

## Experience



### Senior Java Developer (& Software Architect)
**PSS Prosoft Solutions**\
Bucharest, Romania\
*February 2008 - Present*

Other roles:
- Technical Lead
- Development Lead
  Other activities and responsibilities:
- analysis and design for new projects
- analysis and integration for the new features and change requests for current projects
- develop and manage pilot projects
- develop and manage prototype projects to test the integration of various technologies
- technical proposals
- performance improvements
  Senior Java Developer
  Entrust | Craiova, Romania
  July 2007 - February 2008 (8 months)

Other roles:
- Firm Administrator (and Partner)
- Technical Lead
- Development Lead
  Other activities and responsibilities:
- analysis and design for new projects
- analysis and integration for the new features and change requests for current projects

### Senior Java Developer
**Entrust | Craiova, Romania**\
*July 2007 - February 2008 (8 months)*

Other roles:
- Firm Administrator (and Partner)
- Technical Lead
- Development Lead
  Other activities and responsibilities:
- analysis and design for new projects
- analysis and integration for the new features and change requests for current projects

# Spring - Quick start tutorial

The [Spring Framework](http://spring.io) is an open source application framework and inversion of control container for the Java platform.
The framework's core features can be used by any Java application, but there are extensions for building web applications on top of the Java EE platform.
Although the framework does not impose any specific programming model, it has become popular in the Java community as an alternative to, replacement for,
or even addition to the Enterprise JavaBean (EJB) model ([Wikipedia / Spring Framework](http://en.wikipedia.org/wiki/Spring_Framework)).

A key element of Spring is infrastructural support at the application level: Spring focuses on the "plumbing" of enterprise applications so that teams can focus on application-level business logic, without unnecessary ties to specific deployment environments.

1. How old are you?
2. What alternatives to foundations should you use when building?
3. What is metagaming? Is it ever OK?
4. Do raids require:
  - admin approval
  - an RP reason
  - for the opposing player to be online?
  - All of the above?
5. Does the use of sorcery require admin approval?
6. How long does a player have to post a writeup in Discord after committing a hostile PVP action (stealing, fighting)?
7. True or False: using a Welcome Center or other player/admin-made crafting area requires a writeup to be done.
8. What is the exception to the rule that you must wait one IRL week from your first writeup before joining any clan?

A key element of Spring is infrastructural support at the application level: Spring focuses on the "plumbing" of enterprise applications so that teams can focus on application-level business logic, without unnecessary ties to specific deployment environments.

A key element of **Spring** is infrastructural support at the application level: Spring focuses on the "plumbing" of enterprise applications so that teams can focus on application-level business logic, without unnecessary ties to specific deployment environments.

> A key element of Spring is infrastructural support at the application level: Spring focuses on the "plumbing" of enterprise applications so that teams can focus on application-level business logic, without unnecessary ties to specific deployment environments.

A key element of Spring is infrastructural support at the application level: Spring focuses on the "plumbing" of enterprise applications so that teams can focus on application-level business logic, without unnecessary ties to specific deployment environments.

---

A key element of Spring is infrastructural support at the application level: Spring focuses on the "plumbing" of enterprise applications so that teams can focus on application-level business logic, without unnecessary ties to specific deployment environments.

```html
<html>
  <head>
  </head>
  <body>
    <p>Hello, World!</p>
  </body>
</html>
```

A key element of Spring is infrastructural support at the application level: Spring focuses on the "plumbing" of enterprise applications so that teams can focus on application-level business logic, without unnecessary ties to specific deployment environments.

A key element of Spring is infrastructural support at the application level: Spring focuses on the "plumbing" of enterprise applications so that teams can focus on application-level business logic, without unnecessary ties to specific deployment environments.

## Spring dependencies

The Spring dependencies are available for download via [Maven Central Repository](http://search.maven.org).

### Spring dependencies

#### Spring dependencies

##### Spring dependencies

A key element of Spring is infrastructural support at the application level: Spring focuses on the "plumbing" of enterprise applications so that teams can focus on application-level business logic, without unnecessary ties to specific deployment environments.

###### Spring dependencies

A key element of Spring is infrastructural support at the application level: Spring focuses on the "plumbing" of enterprise applications so that teams can focus on <code>application-level</code> business logic, without unnecessary ties to specific deployment environments.

> pom.xml

{% highlight xml %}
<PJproject
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
