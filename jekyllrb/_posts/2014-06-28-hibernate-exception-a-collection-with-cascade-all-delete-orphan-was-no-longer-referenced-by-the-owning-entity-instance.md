---

layout: post

date:        "2014-06-28"
title:       "HibernateException - A collection with cascade=\"all-delete-orphan\" was no longer referenced by the owning entity instance"
description: "Hibernate is unable to track changes to a newly set collection (as a new object) and thus has no idea how to apply the cascading persistence to your objects."

categories: java hibernate

---


What is happening is that [Hibernate](http://hibernate.org) requires complete ownership of the children collection in the parent object.
If you set it to a new object, Hibernate is unable to track changes to that collection and thus has no idea how to apply the cascading persistence to your objects.

So the code like:

{% highlight java %}
this.children = someNewSetOfChildren;
{% endhighlight %}

or like:

{% highlight java %}
parent.setChildren(someNewSetOfChildren);
{% endhighlight %}

results in a [HibernateException](https://docs.jboss.org/hibernate/orm/4.3/javadocs/org/hibernate/HibernateException.html) with the message:

> A collection with cascade="all-delete-orphan" was no longer referenced by the owning entity instance

The full stack trace of the exception is:

{% highlight java %}

org.hibernate.HibernateException:
A collection with cascade="all-delete-orphan" was no longer referenced by the owning entity instance: entities.Parent.childs
    at org.hibernate.engine.internal.Collections.processDereferencedCollection(Collections.java:116)
    at org.hibernate.engine.internal.Collections.processUnreachableCollection(Collections.java:67)
    at org.hibernate.event.internal.AbstractFlushingEventListener.flushCollections(AbstractFlushingEventListener.java:245)
    at org.hibernate.event.internal.AbstractFlushingEventListener.flushEverythingToExecutions(AbstractFlushingEventListener.java:100)
    at org.hibernate.event.internal.DefaultAutoFlushEventListener.onAutoFlush(DefaultAutoFlushEventListener.java:55)
    at org.hibernate.internal.SessionImpl.autoFlushIfRequired(SessionImpl.java:1099)
    at org.hibernate.internal.SessionImpl.list(SessionImpl.java:1528)
    at org.hibernate.internal.CriteriaImpl.list(CriteriaImpl.java:374)
    at org.hibernate.internal.CriteriaImpl.uniqueResult(CriteriaImpl.java:396)
    ...
{% endhighlight %}

To avoid this problem, any time we want to add or delete something to the list, we have to modify the contents of the collection instead of assigning a new one with code like:

{% highlight java %}
parent.getChildren().clear();
parent.getChildren().addAll(someNewSetOfChildren);
{% endhighlight %}

or like:

{% highlight java %}

public void setChildren(Set<Child> someNewSetOfChildren) {
 
    //
    // This will override the set that Hibernate is tracking.
    // this.children = someNewSetOfChildren;
 
    this.children.clear();
    this.children.addAll(someNewSetOfChildren);
}
{% endhighlight %}
