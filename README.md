## ArchivesSpace AJAX utility Plugin

A simple plugin for ArchivesSpace to facilitate interaction with the backend via AJAX request initiated in Javascript. Requests are passed to a controller which validates permissions and interacts with the backend using the JSONModel::HTTP module, so user credentials and session tokens do not need to be handled in Javascript.

## Installation

1. Copy the 'ajax_utility' directory to the 'plugins' diectory in ArchivesSapce
2. Add the plugin to the list of plugin to load in `config/config.rb':
```
AppConfig[:plugins] = ['ajax_utility', (other plugins that will use ajax_utility)]
```

## Usage

The plugin provides 2 routes that can be used to GET and POST JSON data.

### GET

Just add `/api` to the beginning of backend REST endpoint URI. For example:

```
/repositories/1/resources/123
```

becomes

```
/api/repositories/1/resources/123
```

Additional query parameters can be included in the URI as usual, e.g.:

```
/api/repositories/1/resources/123?resolve[]=subjects
```

### POST

URIs are formulated the same way as they are for GET. JSON data to be passed to the backed should be included with the key 'json'. Here is a sample implemenation using JQuery.post:


```
var post_data = { title: "This is a new title" }
$.post( "/api/repositories/1/resources/123", { json: post_data } );
```
