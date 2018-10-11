---

layout: post

title:       "RESTful Java JAX RS Exception Handling"
description: "Errors can be reported to a client either by creating and returning the appropriate Response object or by throwing an Exception."

categories: [java]
tags:       [jax-rs, rest, exception]

resources:
  - "<https://dennis-xlc.gitbooks.io/restful-java-with-jax-rs-2-0-en/cn/>"

---


Errors can be reported to a client
- either by creating and returning the appropriate `Response` object;
- or by throwing an `Exception`.

There are 3 ways of handling thrown exceptions:
- thrown exceptions are handled by the JAX-RS runtime (if there is an exception mapper registered);
- if the thrown exception is not handled by a mapper (`javax.ws.rs.ext.ExceptionMapper`), it is propagated and handled by the container JAX-RS is running within;
- a `javax.ws.rs.WebApplicationException` can be thrown by application code and automatically processed by JAX-RS without having to write an explicit mapper.


## Exception Mapping

Relying on the underlying servlet container to handle the exception doesn’t give much flexibility. Catching and then wrapping all these exceptions within [WebApplicationException] would become quite tedious. Alternatively, you can implement and register instances of [ExceptionMapper]. These objects know how to map a thrown application exception to a [Response] object:

```java
public interface ExceptionMapper<E extends Throwable> {
  Response toResponse(E exception);
}
```

For example:

```java
@Provider
public class NullPointerExceptionMapper
    implements ExceptionMapper<NullPointerException> {

  public Response toResponse(NullPointerException e) {
    return Response.status(Response.Status.NOT_FOUND).build();
  }
}
```

The implementation must be annotated with the `@Provider` annotation (to tell the JAX-RS runtime that it is a component).

JAX-RS supports exception inheritance as well. When an exception is thrown, JAX-RS will first try to find an [ExceptionMapper] for that exception’s type. If it cannot find one, it will look for a mapper that can handle the exception’s superclass. It will continue this process until there are no more superclasses to match against.


# javax.ws.rs.WebApplicationException

JAX-RS has a built-in unchecked exception that applications can throw. This exception is preinitialized with either a [Response] or a particular status code:

```java
public class WebApplicationException extends RuntimeException {

  public WebApplicationException() {...}
  public WebApplicationException(Response response) {...}
  public WebApplicationException(int status) {...}
  public WebApplicationException(Response.Status status) {...}
  public WebApplicationException(Throwable cause) {...}
  public WebApplicationException(Throwable cause, Response response) {...}
  public WebApplicationException(Throwable cause, int status) {...}
  public WebApplicationException(Throwable cause, Response.Status status) {...}

  public Response getResponse() {...}
}
```

When JAX-RS sees that a [WebApplicationException] has been thrown by application code, it catches the exception and calls its `getResponse()` method to obtain a [Response] to send back to the client.
If the application has initialized the [WebApplicationException] with a status code or [Response] object, that code or [Response] will be used to create the actual HTTP response. Otherwise, the [WebApplicationException] will return a status code of `500 Internal Server Error` to the client.

For example:

```java
@Path("/test")
public class TestResource {

  @GET
  @Path("/something")
  @Produces("application/xml")
  public Customer getCustomer(@QueryParam("id") int id) {

    Something something = findSomething(id);

    if (something == null) {
      throw new WebApplicationException(Response.Status.NOT_FOUND);
    }

    return something;
  }
}
```


# Exception Hierarchy

JAX-RS 2.0 has added a nice exception hierarchy for various HTTP error conditions.
So, instead of creating an instance of [WebApplicationException] and initializing it with a specific status code, you can use one of these exceptions instead.

|Exception                     | Status code | Description                               |
|------------------------------|:-----------:|-------------------------------------------|
| BadRequestException          | 400         | Malformed message                         |
| NotAuthorizedException       | 401         | Authentication failure                    |
| ForbiddenException           | 403         | Not permitted to access                   |
| NotFoundException            | 404         | Couldn’t find resource                    |
| NotAllowedException          | 405         | HTTP method not supported                 |
| NotAcceptableException       | 406         | Client media type requested not supported |
| NotSupportedException        | 415         | Client posted media type not supported    |
| InternalServerErrorException | 500         | General server error                      |
| ServiceUnavailableException  | 503         | Server is temporarily unavailable or busy |


[Response]: https://docs.oracle.com/javaee/7/api/javax/ws/rs/core/Response.html
[ExceptionMapper]: https://docs.oracle.com/javaee/7/api/javax/ws/rs/ext/ExceptionMapper.html
[WebApplicationException]: https://docs.oracle.com/javaee/7/api/javax/ws/rs/WebApplicationException.html


{% include resources.html %}