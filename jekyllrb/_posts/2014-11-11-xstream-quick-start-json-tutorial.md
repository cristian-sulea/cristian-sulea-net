---

layout: post

title:       "XStream - Quick start JSON tutorial"
description: "Quick start tutorial on serializing an object to JSON (and deserializing back from JSON) using XStream, a simple java library."

categories: [java]
tags:       [xstream, json]

---


Please check the [XStream - Quick start tutorial].
The only difference is in the line with the initialization:


```java
XStream xStream = new XStream(new JsonHierarchicalStreamDriver());
```

The output is as follows:

```json
{"contact": {
  "name": "Cristian Sulea",
  "addresses": [
    {
      "street": "My Street",
      "city": "Bucharest"
    },
    {
      "street": "Another Street",
      "city": "Bucharest"
    }
  ]
}}
```


## Dropping the root

Sometimes the root node in the generated JSON is superfluous, since its name is caused by the Java type of the written object that has no meaning in JSON and increases only the nesting level of the structure.
Therefore it is possible to drop this root by initializing the internally used [JsonWriter] in a different mode.

Again, the only difference is in the initialization:

```java
XStream xStream = new XStream(new JsonHierarchicalStreamDriver() {
  public HierarchicalStreamWriter createWriter(Writer writer) {
    return new JsonWriter(writer, JsonWriter.DROP_ROOT_MODE);
  }
});
```

The output is as follows:

```json
{
  "name": "Cristian Sulea",
  "addresses": [
    {
      "street": "My Street",
      "city": "Bucharest"
    },
    {
      "street": "Another Street",
      "city": "Bucharest"
    }
  ]
}
```


## Read from JSON

```java
Contact contact = (Contact) xStream.fromXML(json);
```

[XStream - Quick start tutorial]: {% post_url 2014-11-10-xstream-quick-start-tutorial %}
[JsonWriter]:                     http://xstream.codehaus.org/javadoc/com/thoughtworks/xstream/io/json/JsonWriter.html