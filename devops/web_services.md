---
tags:
  - MIFI
  - devops
  - web
  - webservers
---
[[nginx_apache_report]]

**Web server** is a computer system, which sends web-pages to the clients using HTTP.

Capabilities of the web servers:
1. *Support scripting:* web servers should support server scripting languages like PHP, Python or Ruby for generating web pages
2. *Security:* Most of web servers have security functions like authentication, SSL, TLS, encryption and much more for securing client's data
3. *Compatibility:* web servers usually support multiple operating systems and browsers
4. *Scalability:* web servers should be scalable in terms of user trafic

## Principles of Web Servers

**Domain name** is a address of the web site in the Internet. Whenever domain name is introduces or link is tapped, web server starts its work to present needed page. Web server is responsible for openning needed web site. This process has a few stages.

**"Client-server"** model is a popular interaction scheme for a lot of internet services. In this model client is a program or a device (for example computer or phone), that requests for some data from server.

Web servers process client's requests for four steps:
1. Whenever user requests for access to a web page his internet browser initiates HTTP-request for granting access. Next using system of domain names (DNS) or its cache to transform url address and find IP address of the web page. This allows browser to identify web server that stores web pages of the web-site.
2. Web server works like mail operator. Receiving HTTP request and processing it throughout its own HTTP-server.
3. When web-server receives a request he sends all necessary files to web browser to let the user see its content.
4. However, if HTTP server can't find or process requested files it sends error message to the web browser

## Types of web servers

Web servers can vary in functionality, architecture and methods of processing requests.

### Static web servers

This is the most simple type that holds only static files like HTML-files, images, CSS and JavaScript. Static web servers simply transfer files to the client by request without changing it.

**Pros:**
- high performance
- easy to setup
- low resource requirements

**Cons:**
- limited in functionality
- impossible to process dynamic data (for example data from the data base)

### Dynamic web servers

This severs can generate web pages as they are needed according to the client's request. They usually uses data bases or other server processes for generating content.

**Pros:**
- ability to use dynamic content
- data base usage
- ability to personalize the page

**Cons:**
- high resource usage
- hard to setup and maintain

### Proxy servers

Proxy servers are a mediator between the client and the main web server. They can cache data, improving access speed or filter traffic for security.

**Pros:**
- high security
- cache usage
- masking IP-addresses of the clients

**Cons:**
- can lead to the lag in different scenarios
- require additional resources for setup

### Revers-proxy servers

Revers-proxy servers get clients' requests and redirect them on other servers for processing. This servers often used for balancing the load and distribution of the traffic between multiple servers.

**Pros:**
- balancing the load
- increasing fault tolerance
- defend servers from the direct attacks

**Cons:**
- high system complexity
- bottleneck can appear on the proxy-server level

## Servers Software

- **Apache**: Open source web server. Can be used as static, dynamic and reverse-proxy server
- **[[nginx]]**: Open source web server with high performance and low resource usage. Main feature of nginx is that it can process high amount of connections. It can process requests asynchronously.
- **Microsoft IIS**
