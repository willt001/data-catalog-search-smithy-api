# Data catalog search API using Smithy

This repository contains an example on how to build an API using Smithy and deploying the API to AWS API Gateway using Open API and AWS Lambda.

## Smithy

Smithy is an IDL (interface definition language) which can be used to define APIs in a programming language agnostic and protocol agnostic way [Official Docs](https://smithy.io/2.0/index.html).

In the ```/models/main.smithy``` file I define the API service, the operations which belong to that service, and the data structures/objects which are used as inputs ands outputs for these operations.

## Deploying an API on AWS API Gateway from a Smithy model

Prerequisites: [Smithy CLI](https://smithy.io/2.0/guides/smithy-cli/cli_installation.html)

To convert the Smithy model into Open API format, the ```smithy-build.json``` file needs to be configured. 

In this file I specify the ```openapi-conversion``` Smithy projection and the target service (matching the service defined in ```/models/main.smithy```).

Once ```smithy-build.json``` is configured and saved, running the command ```smithy build``` will create an Open API specification for the API in ```build\smithy\openapi-conversion\openapi\SearchService.openapi.json```.

In the AWS Management Console, navigate to API Gateway > APIs > Create API > Import REST API. Uploading the Open API file created above will create the API for you in API Gateway.

The integrations for each of the resources in the newly created API should now be created. In this example I use AWS Lambda Python functions: ```/lambda-functions```

