---

layout: post

title:       "Hibernate - One To Many (Annotation)"
description: "One-to-many associations are declared at the property level with the annotation @OneToMany."

categories: [java]
tags:       [hibernate]

---


One-to-many associations are declared at the property level with the annotation [@OneToMany](http://docs.oracle.com/javaee/7/api/javax/persistence/OneToMany.html).


## Bidirectional

{% highlight java %}

@Entity
@Table(name = "CONTACT")
public class Contact {

  @OneToMany(
    mappedBy = "contact",
    cascade = CascadeType.ALL,
    orphanRemoval = true,
    fetch = FetchType.EAGER)
  @Fetch(FetchMode.SELECT)
  private Set<Address> addresses = new LinkedHashSet<Address>();

  ...
}

@Entity
@Table(name = "ADDRESS")
public class Address {

  @ManyToOne(fetch = FetchType.EAGER)
  @JoinColumn(name = "CONTACT_ID", nullable = false)
  private Contact contact;

  ...
}
{% endhighlight %}


## Unidirectional

A unidirectional one to many using a foreign key column (using [@JoinColumn](http://docs.oracle.com/javaee/7/api/javax/persistence/JoinColumn.html)) in the owned entity is not that common and not really recommended. You are strongly advised to use a join table for this kind of association.

{% highlight java %}

@Entity
@Table(name = "CONTACT")
public class Contact {

  @OneToMany(
    cascade = CascadeType.ALL,
    orphanRemoval = true,
    fetch = FetchType.EAGER)
  @JoinColumn(name="CONTACT_ID")
  @Fetch(FetchMode.SELECT)
  private Set<Address> addresses = new LinkedHashSet<Address>();
  
  ...
}

@Entity
@Table(name = "ADDRESS")
public class Address {

  ... // no bidirectional
}
{% endhighlight %}


## Unidirectional with join table

A unidirectional one to many with join table is much preferred. This association is described through [@JoinTable](http://docs.oracle.com/javaee/7/api/javax/persistence/JoinTable.html).

{% highlight java %}

@Entity
@Table(name = "CONTACT")
public class Contact {

  @OneToMany(
    cascade = CascadeType.ALL,
    orphanRemoval = true,
    fetch = FetchType.EAGER)
  @JoinTable(
    name="Address",
    joinColumns = @JoinColumn( name = "CONTACT_ID"),
    inverseJoinColumns = @JoinColumn( name = "ADDRESS_ID"))
  private Set<Address> addresses = new LinkedHashSet<Address>();

  ...
}

@Entity
@Table(name = "ADDRESS")
public class Address {

  ... // no bidirectional
}
{% endhighlight %}
