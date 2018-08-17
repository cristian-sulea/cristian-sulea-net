---

layout: post

date:        "2015-03-10"
title:       "Java Cryptography"
description: "Cryptography is looking at techniques for encoding and verifying things securely. It tends to focus on encryption, authentication and computer protocols."

categories: java cryptography

---


Cryptography is a field looking at techniques for **encoding and verifying things securely**.
It tends to focus on the following issues:
- **encryption** of data so that an unauthorized third party cannot read it without a key of some sort;
- **authentication and validation** (or **certification**);
- **computer protocols** for using the previous two techniques correctly and in a way that allows all parties to know how they're being used (e.g. the TLS protocol allows a client to connect to a server over the Internet without the two machines previously knowing things such as session key or even preferred encryption method, maximum key length, etc).


## Symmetric-key encryption in Java

This is the case where the **same key** is used to both encrypt and decrypt.
It is sometimes called **secret-key encryption**, **single-key encryption** or simply **symmetric encryption**.

In Java, use an instance of [javax.crypto.Cipher](http://docs.oracle.com/javase/7/docs/api/javax/crypto/Cipher.html).

### Encryption example

{% highlight java %}

String passPhrase = "secret sequence of bytes";
byte[] dataToEncrypt = "data to encrypt".getBytes();

MessageDigest digest = MessageDigest.getInstance("SHA");
digest.update(passPhrase.getBytes());

Key key = new SecretKeySpec(digest.digest(), 0, 16, "AES");

Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
cipher.init(Cipher.ENCRYPT_MODE, key);

byte[] encryptedData = cipher.doFinal(dataToEncrypt);

System.out.println(Arrays.toString(encryptedData));

{% endhighlight %}


### Decryption example

{% highlight java %}

String passPhrase = "secret sequence of bytes";
byte[] dataToDecrypt = new byte[] { -84,-66,-113,54,125,48,-28,-60,36,52,-57,109,105,-17,111,-12 };

MessageDigest digest = MessageDigest.getInstance("SHA");
digest.update(passPhrase.getBytes());

Key key = new SecretKeySpec(digest.digest(), 0, 16, "AES");

Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
cipher.init(Cipher.DECRYPT_MODE, key);

byte[] decryptedData = cipher.doFinal(dataToDecrypt);

System.out.println(new String(decryptedData));

{% endhighlight %}


## Asymmetric (public key) encryption in Java

Asymmetric encryption, also known as **public key encryption** or **public key cryptography**, refers to a cryptographic algorithm which requires two separate keys, one of which is secret (or private) and one of which is public:
- the public key is used to encrypt;
- the private key is used to decrypt.

A common paradigm in a centralized client-server system is that a private key is held securely on the server, while the corresponding public key is distributed to all clients.

In Java, the keys will be instances of [java.security.PublicKey](http://docs.oracle.com/javase/7/docs/api/java/security/PublicKey.html) and [java.security.PrivateKey](http://docs.oracle.com/javase/7/docs/api/java/security/PrivateKey.html).

To generate a new pair:

{% highlight java %}

KeyPairGenerator keyPairGenerator = KeyPairGenerator.getInstance("RSA");
KeyPair keyPair = keyPairGenerator.generateKeyPair();
PublicKey publicKey = keyPair.getPublic();
PrivateKey privateKey = keyPair.getPrivate();

{% endhighlight %}

The keys can also be transformed into byte arrays for storage and transmission:

{% highlight java %}

KeyFactory keyFactory = KeyFactory.getInstance("RSA");
byte[] publicKeyBytes = publicKey.getEncoded();
KeySpec keySpec = new X509EncodedKeySpec(publicKeyBytes);
PublicKey keyFromBytes = keyFactory.generatePublic(keySpec);

{% endhighlight %}


### Encryption example

{% highlight java %}

String passPhrase = "secret sequence of bytes";
byte[] dataToEncrypt = "data to encrypt".getBytes();

MessageDigest digest = MessageDigest.getInstance("SHA");
digest.update(passPhrase.getBytes());

Cipher cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding");
cipher.init(Cipher.ENCRYPT_MODE, publicKey);

byte[] encryptedData = cipher.doFinal(dataToEncrypt);

System.out.println(new String(encryptedData));

{% endhighlight %}

### Decryption example

{% highlight java %}

String passPhrase = "secret sequence of bytes";
byte[] dataToDecrypt = /* read from stream/file/etc */;

MessageDigest digest = MessageDigest.getInstance("SHA");
digest.update(passPhrase.getBytes());

Cipher cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding");
cipher.init(Cipher.DECRYPT_MODE, privateKey);

byte[] decryptedData = cipher.doFinal(dataToDecrypt);

System.out.println(new String(decryptedData));

{% endhighlight %}

{% include resources.html %}
