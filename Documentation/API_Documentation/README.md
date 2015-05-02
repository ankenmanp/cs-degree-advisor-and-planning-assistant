# CS Degree Advisor and Planning Assistant Documentation

## User-Facing Web API Docs
The specifications for the user-facing web API are written in API Blueprint
markdown and can be found at ./api-docs.md.

### Dependencies
Rendering the web API documentation as a formatted HTML document, based on 
the API Blueprint (https://apiblueprint.org/) specification relies on the 
Aglio utility (https://github.com/danielgtaylor/aglio).

A mock server based on the API Blueprint can be initiallized using the api-mock
utility (https://github.com/localmed/api-mock).

### Aglio
Install Aglio
`npm install -g aglio`

Generate a formatted HTML document from an API Blueprint
`aglio -i api-docs.md -o api-docs.html`

Generate a formatted HTML document with a built in template
`aglio -i api-docs.md -t slate -o api-docs.html`

NOTE: The built in templates of Aglio are statically linked, so you must view
the HTML documents on a server.

You can pass a -s flag to Aglio to preview your document on a server
`aglio -i api-docs.md -s`

### api-mock
Install api-mock
`npm install -g api-mock`

Start a mock server on port 3000
`api-mock ./api-docs.md --port 3000`

You may now hit API endpoints specified in the API Blueprint, example:
`curl -v localhost:3000/courses/`
