<h2>Summary of the problem found in the DNS and ICMP.</h2>
The UDP protocol reveals that when the DNS was contacted to retrieve the IP address
This is based on the results of the network analysis, which show that the ICMP echo reply
returned the error message “udp port 53 unreachable.” Since port 53 is associated with DNS protocol traffic, we know this is an issue with the DNS server, further supported by the flags associated with the outgoing UDP message and domain name retrieval.


<h2> Analysis of the data and cause of the incident.</h2>
The incident occurred today at 13.24hs. Customers alerted the organization that they received the message “destination port unreachable” when they attempted to visit the website yummyrecipesforme.com. The cybersecurity team is currently investigating the issue so customers can access the website again. In our investigation into the issue, we conducted packet sniffing tests using tcpdump. The next step is to identify whether the DNS server is down or if traffic to port 53 is blocked. The DNS server might be down due to a successful DoS/DDoS attack or a misconfiguration. 
