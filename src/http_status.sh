#!/bin/python3
# Description: List a given http response code.

import sys

filtered = []
#extended = False
if len(sys.argv) > 1:
	filtered = [int(a) for a in sys.argv[1:]]

status_codes = [
	{
	    "category": "Information responses",
	    "code": 100,
	    "title": "Continue",
	    "description": "This interim response indicates that the client should continue the request or ignore the response if the request is already finished."
	},
	{
	    "category": "Information responses",
	    "code": 101,
	    "title": "Switching Protocols",
	    "description": "This code is sent in response to an Upgrade request header from the client and indicates the protocol the server is switching to."
	},
	{
	    "category": "Information responses",
	    "code": 102,
	    "title": "Processing (WebDAV)",
	    "description": "This code indicates that the server has received and is processing the request, but no response is available yet."
	},
	{
	    "category": "Information responses",
	    "code": 103,
	    "title": "Early Hints",
	    "description": "This status code is primarily intended to be used with the Link header, letting the user agent start preloading resources while the server prepares a response."
	},
	{
	    "category": "Successful responses",
	    "code": 200,
	    "title": "OK",
	    "description": "The request succeeded. The result meaning of \"success\" depends on the HTTP method:\n    \n      GET: The resource has been fetched and transmitted in the message body.\n      HEAD: The representation headers are included in the response without any message body.\n      PUT or POST: The resource describing the result of the action is transmitted in the message body.\n      TRACE: The message body contains the request message as received by the server."
	},
	{
	    "category": "Successful responses",
	    "code": 201,
	    "title": "Created",
	    "description": "The request succeeded, and a new resource was created as a result. This is typically the response sent after POST requests, or some PUT requests."
	},
	{
	    "category": "Successful responses",
	    "code": 202,
	    "title": "Accepted",
	    "description": "The request has been received but not yet acted upon.\n      It is noncommittal, since there is no way in HTTP to later send an asynchronous response indicating the outcome of the request.\n      It is intended for cases where another process or server handles the request, or for batch processing."
	},
	{
	    "category": "Successful responses",
	    "code": 203,
	    "title": "Non-Authoritative Information",
	    "description": "This response code means the returned metadata is not exactly the same as is available from the origin server, but is collected from a local or a third-party copy.\n      This is mostly used for mirrors or backups of another resource.\n      Except for that specific case, the 200 OK response is preferred to this status."
	},
	{
	    "category": "Successful responses",
	    "code": 204,
	    "title": "No Content",
	    "description": "There is no content to send for this request, but the headers may be useful.\n      The user agent may update its cached headers for this resource with the new ones."
	},
	{
	    "category": "Successful responses",
	    "code": 205,
	    "title": "Reset Content",
	    "description": "Tells the user agent to reset the document which sent this request."
	},
	{
	    "category": "Successful responses",
	    "code": 206,
	    "title": "Partial Content",
	    "description": "This response code is used when the Range header is sent from the client to request only part of a resource."
	},
	{
	    "category": "Successful responses",
	    "code": 207,
	    "title": "Multi-Status (WebDAV)",
	    "description": "Conveys information about multiple resources, for situations where multiple status codes might be appropriate."
	},
	{
	    "category": "Successful responses",
	    "code": 208,
	    "title": "Already Reported (WebDAV)",
	    "description": "Used inside a <dav:propstat> response element to avoid repeatedly enumerating the internal members of multiple bindings to the same collection."
	},
	{
	    "category": "Successful responses",
	    "code": 226,
	    "title": "IM Used (HTTP Delta encoding)",
	    "description": "The server has fulfilled a GET request for the resource, and the response is a representation of the result of one or more instance-manipulations applied to the current instance."
	},
	{
	    "category": "Redirection messages",
	    "code": 300,
	    "title": "Multiple Choices",
	    "description": "The request has more than one possible response. The user agent or user should choose one of them. (There is no standardized way of choosing one of the responses, but HTML links to the possibilities are recommended so the user can pick.)"
	},
	{
	    "category": "Redirection messages",
	    "code": 301,
	    "title": "Moved Permanently",
	    "description": "The URL of the requested resource has been changed permanently. The new URL is given in the response."
	},
	{
	    "category": "Redirection messages",
	    "code": 302,
	    "title": "Found",
	    "description": "This response code means that the URI of requested resource has been changed temporarily.\n      Further changes in the URI might be made in the future. Therefore, this same URI should be used by the client in future requests."
	},
	{
	    "category": "Redirection messages",
	    "code": 303,
	    "title": "See Other",
	    "description": "The server sent this response to direct the client to get the requested resource at another URI with a GET request."
	},
	{
	    "category": "Redirection messages",
	    "code": 304,
	    "title": "Not Modified",
	    "description": "This is used for caching purposes.\n      It tells the client that the response has not been modified, so the client can continue to use the same cached version of the response."
	},
	{
	    "category": "Redirection messages",
	    "code": 305,
	    "title": "Use Proxy Deprecated",
	    "description": "Defined in a previous version of the HTTP specification to indicate that a requested response must be accessed by a proxy.\n      It has been deprecated due to security concerns regarding in-band configuration of a proxy."
	},
	{
	    "category": "Redirection messages",
	    "code": 306,
	    "title": "unused",
	    "description": "This response code is no longer used; it is just reserved. It was used in a previous version of the HTTP/1.1 specification."
	},
	{
	    "category": "Redirection messages",
	    "code": 307,
	    "title": "Temporary Redirect",
	    "description": "The server sends this response to direct the client to get the requested resource at another URI with same method that was used in the prior request.\n      This has the same semantics as the 302 Found HTTP response code, with the exception that the user agent must not change the HTTP method used: if a POST was used in the first request, a POST must be used in the second request."
	},
	{
	    "category": "Redirection messages",
	    "code": 308,
	    "title": "Permanent Redirect",
	    "description": "This means that the resource is now permanently located at another URI, specified by the Location: HTTP Response header.\n      This has the same semantics as the 301 Moved Permanently HTTP response code, with the exception that the user agent must not change the HTTP method used: if a POST was used in the first request, a POST must be used in the second request."
	},
	{
	    "category": "Client error responses",
	    "code": 400,
	    "title": "Bad Request",
	    "description": "The server cannot or will not process the request due to something that is perceived to be a client error (e.g., malformed request syntax, invalid request message framing, or deceptive request routing)."
	},
	{
	    "category": "Client error responses",
	    "code": 401,
	    "title": "Unauthorized",
	    "description": "Although the HTTP standard specifies \"unauthorized\", semantically this response means \"unauthenticated\".\n      That is, the client must authenticate itself to get the requested response."
	},
	{
	    "category": "Client error responses",
	    "code": 402,
	    "title": "Payment Required Experimental",
	    "description": "This response code is reserved for future use.\n      The initial aim for creating this code was using it for digital payment systems, however this status code is used very rarely and no standard convention exists."
	},
	{
	    "category": "Client error responses",
	    "code": 403,
	    "title": "Forbidden",
	    "description": "The client does not have access rights to the content; that is, it is unauthorized, so the server is refusing to give the requested resource.\n      Unlike 401 Unauthorized, the client's identity is known to the server."
	},
	{
	    "category": "Client error responses",
	    "code": 404,
	    "title": "Not Found",
	    "description": "The server cannot find the requested resource.\n      In the browser, this means the URL is not recognized.\n      In an API, this can also mean that the endpoint is valid but the resource itself does not exist.\n      Servers may also send this response instead of 403 Forbidden to hide the existence of a resource from an unauthorized client.\n      This response code is probably the most well known due to its frequent occurrence on the web."
	},
	{
	    "category": "Client error responses",
	    "code": 405,
	    "title": "Method Not Allowed",
	    "description": "The request method is known by the server but is not supported by the target resource.\n      For example, an API may not allow calling DELETE to remove a resource."
	},
	{
	    "category": "Client error responses",
	    "code": 406,
	    "title": "Not Acceptable",
	    "description": "This response is sent when the web server, after performing server-driven content negotiation, doesn't find any content that conforms to the criteria given by the user agent."
	},
	{
	    "category": "Client error responses",
	    "code": 407,
	    "title": "Proxy Authentication Required",
	    "description": "This is similar to 401 Unauthorized but authentication is needed to be done by a proxy."
	},
	{
	    "category": "Client error responses",
	    "code": 408,
	    "title": "Request Timeout",
	    "description": "This response is sent on an idle connection by some servers, even without any previous request by the client.\n      It means that the server would like to shut down this unused connection.\n      This response is used much more since some browsers, like Chrome, Firefox 27+, or IE9, use HTTP pre-connection mechanisms to speed up surfing.\n      Also note that some servers merely shut down the connection without sending this message."
	},
	{
	    "category": "Client error responses",
	    "code": 409,
	    "title": "Conflict",
	    "description": "This response is sent when a request conflicts with the current state of the server."
	},
	{
	    "category": "Client error responses",
	    "code": 410,
	    "title": "Gone",
	    "description": "This response is sent when the requested content has been permanently deleted from server, with no forwarding address.\n      Clients are expected to remove their caches and links to the resource.\n      The HTTP specification intends this status code to be used for \"limited-time, promotional services\".\n      APIs should not feel compelled to indicate resources that have been deleted with this status code."
	},
	{
	    "category": "Client error responses",
	    "code": 411,
	    "title": "Length Required",
	    "description": "Server rejected the request because the Content-Length header field is not defined and the server requires it."
	},
	{
	    "category": "Client error responses",
	    "code": 412,
	    "title": "Precondition Failed",
	    "description": "The client has indicated preconditions in its headers which the server does not meet."
	},
	{
	    "category": "Client error responses",
	    "code": 413,
	    "title": "Payload Too Large",
	    "description": "Request entity is larger than limits defined by server.\n      The server might close the connection or return an Retry-After header field."
	},
	{
	    "category": "Client error responses",
	    "code": 414,
	    "title": "URI Too Long",
	    "description": "The URI requested by the client is longer than the server is willing to interpret."
	},
	{
	    "category": "Client error responses",
	    "code": 415,
	    "title": "Unsupported Media Type",
	    "description": "The media format of the requested data is not supported by the server, so the server is rejecting the request."
	},
	{
	    "category": "Client error responses",
	    "code": 416,
	    "title": "Range Not Satisfiable",
	    "description": "The range specified by the Range header field in the request cannot be fulfilled.\n      It's possible that the range is outside the size of the target URI's data."
	},
	{
	    "category": "Client error responses",
	    "code": 417,
	    "title": "Expectation Failed",
	    "description": "This response code means the expectation indicated by the Expect request header field cannot be met by the server."
	},
	{
	    "category": "Client error responses",
	    "code": 418,
	    "title": "I'm a teapot",
	    "description": "The server refuses the attempt to brew coffee with a teapot."
	},
	{
	    "category": "Client error responses",
	    "code": 421,
	    "title": "Misdirected Request",
	    "description": "The request was directed at a server that is not able to produce a response.\n      This can be sent by a server that is not configured to produce responses for the combination of scheme and authority that are included in the request URI."
	},
	{
	    "category": "Client error responses",
	    "code": 422,
	    "title": "Unprocessable Entity (WebDAV)",
	    "description": "The request was well-formed but was unable to be followed due to semantic errors."
	},
	{
	    "category": "Client error responses",
	    "code": 423,
	    "title": "Locked (WebDAV)",
	    "description": "The resource that is being accessed is locked."
	},
	{
	    "category": "Client error responses",
	    "code": 424,
	    "title": "Failed Dependency (WebDAV)",
	    "description": "The request failed due to failure of a previous request."
	},
	{
	    "category": "Client error responses",
	    "code": 425,
	    "title": "Too Early Experimental",
	    "description": "Indicates that the server is unwilling to risk processing a request that might be replayed."
	},
	{
	    "category": "Client error responses",
	    "code": 426,
	    "title": "Upgrade Required",
	    "description": "The server refuses to perform the request using the current protocol but might be willing to do so after the client upgrades to a different protocol.\n      The server sends an Upgrade header in a 426 response to indicate the required protocol(s)."
	},
	{
	    "category": "Client error responses",
	    "code": 428,
	    "title": "Precondition Required",
	    "description": "The origin server requires the request to be conditional.\n      This response is intended to prevent the 'lost update' problem, where a client GETs a resource's state, modifies it and PUTs it back to the server, when meanwhile a third party has modified the state on the server, leading to a conflict."
	},
	{
	    "category": "Client error responses",
	    "code": 429,
	    "title": "Too Many Requests",
	    "description": "The user has sent too many requests in a given amount of time (\"rate limiting\")."
	},
	{
	    "category": "Client error responses",
	    "code": 431,
	    "title": "Request Header Fields Too Large",
	    "description": "The server is unwilling to process the request because its header fields are too large.\n      The request may be resubmitted after reducing the size of the request header fields."
	},
	{
	    "category": "Client error responses",
	    "code": 451,
	    "title": "Unavailable For Legal Reasons",
	    "description": "The user agent requested a resource that cannot legally be provided, such as a web page censored by a government."
	},
	{
	    "category": "Server error responses",
	    "code": 500,
	    "title": "Internal Server Error",
	    "description": "The server has encountered a situation it does not know how to handle."
	},
	{
	    "category": "Server error responses",
	    "code": 501,
	    "title": "Not Implemented",
	    "description": "The request method is not supported by the server and cannot be handled. The only methods that servers are required to support (and therefore that must not return this code) are GET and HEAD."
	},
	{
	    "category": "Server error responses",
	    "code": 502,
	    "title": "Bad Gateway",
	    "description": "This error response means that the server, while working as a gateway to get a response needed to handle the request, got an invalid response."
	},
	{
	    "category": "Server error responses",
	    "code": 503,
	    "title": "Service Unavailable",
	    "description": "The server is not ready to handle the request.\n      Common causes are a server that is down for maintenance or that is overloaded.\n      Note that together with this response, a user-friendly page explaining the problem should be sent.\n      This response should be used for temporary conditions and the Retry-After HTTP header should, if possible, contain the estimated time before the recovery of the service.\n      The webmaster must also take care about the caching-related headers that are sent along with this response, as these temporary condition responses should usually not be cached."
	},
	{
	    "category": "Server error responses",
	    "code": 504,
	    "title": "Gateway Timeout",
	    "description": "This error response is given when the server is acting as a gateway and cannot get a response in time."
	},
	{
	    "category": "Server error responses",
	    "code": 505,
	    "title": "HTTP Version Not Supported",
	    "description": "The HTTP version used in the request is not supported by the server."
	},
	{
	    "category": "Server error responses",
	    "code": 506,
	    "title": "Variant Also Negotiates",
	    "description": "The server has an internal configuration error: the chosen variant resource is configured to engage in transparent content negotiation itself, and is therefore not a proper end point in the negotiation process."
	},
	{
	    "category": "Server error responses",
	    "code": 507,
	    "title": "Insufficient Storage (WebDAV)",
	    "description": "The method could not be performed on the resource because the server is unable to store the representation needed to successfully complete the request."
	},
	{
	    "category": "Server error responses",
	    "code": 508,
	    "title": "Loop Detected (WebDAV)",
	    "description": "The server detected an infinite loop while processing the request."
	},
	{
	    "category": "Server error responses",
	    "code": 510,
	    "title": "Not Extended",
	    "description": "Further extensions to the request are required for the server to fulfill it."
	},
	{
	    "category": "Server error responses",
	    "code": 511,
	    "title": "Network Authentication Required",
	    "description": "Indicates that the client needs to authenticate to gain network access."
	}
]

for status in status_codes:
	if len(filtered) == 0:
		print(f"Status Code: {status['code']}, Status Text: {status['title']}")

	elif status["code"] in filtered:
		print(f"Status Code: {status['code']}")
		print(f"Status Text: {status['title']}")
		print(f"Description: {status['description']}\n")
