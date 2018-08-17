---

layout: post

date:        "2013-06-5"
title:       "Multiple properties files in Spring context XML"
description: "Spring allows to externalize string literals in its context configuration files into external properties files."

categories: java spring framework

---


Spring allows to externalize string literals in its context configuration files into external properties files,
in order to separate application specific settings from framework specific configuration.


## &lt;context:property-placeholder/&gt;

This element activates the replacement of ${...} placeholders, resolved against the specified properties file (as a Spring resource location).

{% highlight xml %}
<context:property-placeholder
    location = "classpath:dao.properties,
                classpath:services.properties,
                classpath:user.properties,
                /WEB-INF/config/config.properties"
    ignore-unresolvable="true"/>
{% endhighlight %}


## PropertyPlaceholderConfigurer

A property resource configurer that resolves placeholders in bean property values of context definitions.

{% highlight xml %}
<bean
    id="propertyConfigurer"
    class="org.springframework.beans.factory.config.PropertyPlaceholderConfigurer">
 
    <property name="locations">
        <list>
            <value>classpath:dao.properties</value>
            <value>classpath:services.properties</value>
            <value>classpath:user.properties</value>
            <value>/WEB-INF/config/config.properties</value>
        </list>
    </property>
 
    <property name="ignoreUnresolvablePlaceholders" value="true"/>
</bean>
{% endhighlight %}


{% include resources.html %}
