### Network protocol involved in the incident
Because the incident involves the Yummy Recepies website we know the network protocol involved is HTTP. Aditionally, the tcpdump logs suggests that the malicious file was downloaded from a website.

<br>

### Report on the incident
Several customers contacted the website’s helpdesk stating that when they visited the website, they were asked to download and run a file that "contained access to new recipes". The website owner tried logging into the web server but noticed they were locked out of their account.

Cybersecurity analysts ran tcpdump and attempted to replicate the incident in a sandbox. Effectively, after visiting the YummyRecipes website, there is a request to download and network traffic is redirected to greatrecipesforme.com. After the handshake is done there are aditional data packages being exchanged with the same server. 

On its own, that would not be the red flag it is (it could be explained away by any interaction with the website from the user's side), but in this instance, the exchange is likely to be the download of malware.

Conclusion reached by the cybersecurity team: The web server was impacted by a brute force attack. The hacker took advantage of the fact that the admin password was still set to the default password. Additionally, there were no controls in place to prevent a brute force attack. 

<br>
<br>

### Recommendation for brute force attacks
Upon regaining access to their account, the owner should make sure all admin accounts are required to use Multi-Factor Authentication (MFA), which adds an extra layer of security. MFA reduces the risk of unauthorized access as having the correct password alone is not sufficient for account access. This measure can be implemented using the account management system.

