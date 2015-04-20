## Configuring Security

To authorize your submission to each REST endpoint, AdTruth Resolve uses a keyed **H**ashing **M**essage **A**uthentication **C**ode (HMAC) algorithm. The role of HMAC is to do the following: 

* Ensure the integrity of the message
* Verify authentication of the sender and receiver to the client
* Prevent replay attacks

The cryptographic strength of the HMAC depends upon the size of the secret key that is used. As such, the SHA-256 function is used to generate a 256-bit signature for the submitted text.

To use HMAC, you must produce an authentication header that includes a key that identifies who you are (API Account Key) and a hash that proves the message came from you and has not been modified (Signature).

In the sample implementation code, the Utility.java class (inside the `util` package) contains the necessary code for the HMAC security. See the following lines inside Utility.java:

```java
    public static final String CLIENT_CODE = "12345";
    public static final String SECRET_CODE = "zander";
```

You must change the values for the `CLIENT_CODE` and `SECRET_CODE` to the values supplied to you by your account representative. This is all that is required to configure HMAC to authorize your submission in the sample implementation. (The rest of the code in the class generates the SHA-256 value required for the authorization.)

Each of the REST endpoints uses the Utility class for HMAC authorization. 

When you submit your request, an authorization element will be included in the header. This authorization header contains the client code along with a signature. The signature is generated using a unique value such as time, an IP address value, or other string that you hashed using HMAC-SHA256 along with the secret.
