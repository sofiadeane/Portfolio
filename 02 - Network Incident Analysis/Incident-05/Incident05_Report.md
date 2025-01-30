# Report on Incident05
The company experienced a security event when all network services suddenly stopped responding. The cybersecurity team found the disruption was caused by a distributed denial of services (DDoS) attack through a flood of incoming ICMP packets. 

This report outlines the incident's timeline, impact, and the organization's actions across the five NIST CSF functions to enhance future resilience against similar attacks.

<br>
<br>

| NIST CSF Function   | Summary |
|:-------------------:|:-------:|
| Identify            | A malicious actor or actors targeted the company with an ICMP flood attack. The entire internal network was affected.  |
| Protect             | The cybersecurity team implemented a new firewall rule to limit the rate of incoming ICMP packets and an IDS/IPS system to filter out some ICMP traffic based on suspicious characteristics. |
| Detect              | The cybersecurity team configured source IP address verification on the firewall to check for spoofed IP addresses on incoming ICMP packets as well as network monitoring software to detect abnormal traffic patterns |
| Respond             | For future security events, the cybersecurity team will isolate affected systems to prevent further disruption to the network. They will attempt to restore any critical systems and services that were disrupted by the event. Then, the team will analyze network logs to check for suspicious and abnormal activity. The team will also report all incidents to upper management and appropriate legal authorities, if applicable. |
| Recover             | To recover from a DDoS attack by ICMP flooding, access to network services need to be restored to a normal functioning state. In the future, external ICMP flood attacks should be blocked at the firewall, but if this proves insufficient or only partially effective, all non-critical network services should be stopped to reduce internal network congestion and prioritize critical operations. Start by bringing critical network services back online one by one, ensuring they are operational and stable before proceeding. Continuously monitor network traffic to identify any remaining malicious activity or residual effects from the attack. Once the ICMP flood has subsided and the network is stable, gradually restore non-critical services and systems. |

<br>
<br>
<br>

 **Notes:** All protections, rules and protocols regarding this type of attack must be reviewed and updated after one occurs.