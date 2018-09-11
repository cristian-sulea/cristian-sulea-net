---

layout: post

date:        "2014-06-26"
title:       "Hibernate - Entity Superclass (@MappedSuperclass)"
description: "The solution to code repetition (like for example wiring an id field in every Hibernate entity) is to inherit these properties from a superclass."

categories: java hibernate

---


The solution to code repetition (like for example wiring an `id`, `version` and/or `timestamp` fields in every Hibernate entity) is to inherit these properties from a superclass. This can be done using the [@MappedSuperclass](http://docs.oracle.com/javaee/7/api/javax/persistence/MappedSuperclass.html) annotation.
A mapped superclass designates a class whose mapping information is applied to the entities that inherit from it.

Notes:

- a mapped superclass has no separate table defined for it;
- mapping information may be overridden in such subclasses by using the [@AttributeOverride](http://docs.oracle.com/javaee/7/api/javax/persistence/AttributeOverride.html) and [@AssociationOverride](http://docs.oracle.com/javaee/7/api/javax/persistence/AssociationOverride.html) annotations or corresponding XML elements.


## Example: Concrete class as a mapped superclass

*AbstractEntity.java*

{% highlight java %}

@MappedSuperclass
public abstract class AbstractEntity {

  @Id
  @GeneratedValue(strategy = GenerationType.AUTO)
  @Column(name = "ID", updatable = false, nullable = false)
  private Long id;

  @Temporal(TemporalType.TIMESTAMP)
  @Column(name = "LAST_UPDATE_TIMESTAMP", nullable = false)
  private Date lastUpdateTimestamp;

  @Version
  @Column(name = "VERSION", nullable = false)
  private int version = 0;

  @Override
  public String toString() {
    return String.valueOf(id);
  }

  @PreUpdate
  protected void onPreUpdate() {
    lastUpdateTimestamp = new Date();
  }

  public Long getId() {
    return id;
  }

  public Date getLastUpdateTimestamp() {
    return lastUpdateTimestamp;
  }

  public int getVersion() {
    return version;
  }
}
{% endhighlight %}

*Email.java*

{% highlight java %}

@Entity
@Table(name = "EMAIL")
public class Email extends AbstractEntity {

  @Column(name = "ADDRESS", nullable = false)
  private String address;

  public String getAddress() {
    return address;
  }

  public void setAddress(String address) {
    this.address = address;
  }
}
{% endhighlight %}
