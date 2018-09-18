---

layout: post

title:       "XStream - Quick start tutorial"
description: "Quick start tutorial on serializing an object to XML (and deserializing back from XML) using XStream, a simple java library."

categories: [java]
tags:       [xstream, xml]

---


[XStream] is a simple java library to serialize objects to XML and back again.


## Create classes to be serialized

```java

public class Contact {
 
    private String name;
 
    private List<Address> addresses;
 
    public Contact(String name, Address... addresses) {
        this.name = name;
        this.addresses = new ArrayList<Address>(Arrays.asList(addresses));
    }
 
    public Contact(String name, List<Address> addresses) {
        this.name = name;
        this.addresses = addresses;
    }
 
    // ... other constructors and methods
}
```

```java

public class Address {
 
    private String street;
    private String city;
 
    public Address(String street, String city) {
        this.street = street;
        this.city = city;
    }
 
    // ... other constructors and methods
}
```

[XStream] doesn't care about the visibility of the fields. No getters or setters are needed.
Also, [XStream] does not limit you to having a default constructor.


## Initializing XStream

```java
XStream xStream = new XStream();
```

In this case you require in the classpath [XPP3], a very fast XML pull-parser implementation.
If you do not want to include these dependencies, you can use a standard [JAXP DOM] parser:

```java
// does not require XPP3 library
XStream xStream = new XStream(new DomDriver());
```

or since Java 6 the integrated [StAX] parser instead:

```java
// does not require XPP3 library starting with Java 6
XStream xStream = new XStream(new StaxDriver());
```

To make the XML more concise, you can create aliases for your custom class names to XML element names:

```java
xStream.alias("contact", Contact.class);
xStream.alias("address", Address.class);
```


## Serializing an object to XML

Create the object:

```java

Address address1 = new Address("My Street", "Bucharest");
Address address2 = new Address("Another Street", "Bucharest");

Contact contact = new Contact("Cristian Sulea", address1, address2);
```

Convert the object to XML:

```java
String xml = xStream.toXML(contact);
```

The resulting XML is:

```xml
<contact>
    <name>Cristian Sulea</name>
    <addresses>
        <address>
            <street>My Street</street>
            <city>Bucharest</city>
        </address>
        <address>
            <street>Another Street</street>
            <city>Bucharest</city>
        </address>
    </addresses>
</contact>
```


## Deserializing an object back from XML

```java
Contact contact = (Contact) xStream.fromXML(xml);
```


## Putting It All Together

All the code in a single `class` to make'it easier to copy/paste/run and then play with the code.

```java

package xstream.tutorial;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.io.xml.DomDriver;

public class XStreamTutorial {

  public static void main(String[] args) {

    XStream xStream = new XStream(new DomDriver());

    xStream.alias("contact", Contact.class);
    xStream.alias("address", Address.class);

    Address address1 = new Address("My Street", "Bucharest");
    Address address2 = new Address("Another Street", "Bucharest");

    Contact contact = new Contact("Cristian Sulea", address1, address2);

    xStream.toXML(contact, System.out);
  }

  public static class Contact {

    private String name;

    private List<Address> addresses;

    public Contact(String name, Address... addresses) {
      this.name = name;
      this.addresses = new ArrayList<Address>(Arrays.asList(addresses));
    }

    public Contact(String name, List<Address> addresses) {
      this.name = name;
      this.addresses = addresses;
    }

    public String getName() {
      return name;
    }

    public void setName(String name) {
      this.name = name;
    }

    public List<Address> getAddresses() {
      return addresses;
    }

    public void setAddresses(List<Address> addresses) {
      this.addresses = addresses;
    }
  }

  public static class Address {

    private String street;
    private String city;

    public Address(String street, String city) {
      this.street = street;
      this.city = city;
    }

    public String getStreet() {
      return street;
    }

    public void setStreet(String street) {
      this.street = street;
    }

    public String getCity() {
      return city;
    }

    public void setCity(String city) {
      this.city = city;
    }
  }
}
```

[XStream]:  http://x-stream.github.io
[XPP3]:     http://www.extreme.indiana.edu/xgws/xsoap/xpp/
[JAXP DOM]: http://en.wikipedia.org/wiki/Java_API_for_XML_Processing
[StAX]:     http://en.wikipedia.org/wiki/StAX