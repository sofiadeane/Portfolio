# Type of attack suspected

A potential explanation for the timeout error that is being experienced could be that the server is unable to handle every request as it is having to handle an unusually high amount of traffic. 

The logs show that more than 160 SYN-requests were made by the same IP adress in the span of 58 seconds. <br>

<strong>This abnormal traffic is likely a sign of an ongoing SYN Flood (DoS attack*).</strong>

<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

<small> <strong>(*) How a DoS Attack works </strong>

When website visitors try to establish a connection with the web server, a three-way
handshake occurs using the TCP protocol. <br>

1. The user sends a [SYN] packet requesting access to the server.
2. If authorized, the server responds with a [SYN, ACK] packet and designates one of its ports to the user.
3. The user finalizes the handshake and establishes the connection with a [ACK] package.

However, ports on a server are limited, and when a malicious actor sends a large number of SYN packets all at once it can clog up all of the server's ports, making it unable to respond to legitimate requests and even make the server shut down. This attack is known as a Denial of Service (DoS) attack.

</small>