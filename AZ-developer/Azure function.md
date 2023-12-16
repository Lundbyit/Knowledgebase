# Triggers
Multiple services can be used as triggers outside of HTTP, cron-statements
A function can only have one trigger but multiple in-bindings
# Bindings
Input and output binding for at function.
* Name, type and direction are **required**
Below you can see queue as an input binding defined by `direction: in` and an output binding defined by `direction: out`
```
{
  "bindings": [
    {
      "name": "order",
      "type": "queueTrigger",
      "direction": "in",
      "queueName": "myqueue-items",
      "connection": "MY_STORAGE_ACCT_APP_SETTING"
    },
    {
      "name": "$return",
      "type": "table",
      "direction": "out",
      "tableName": "outTable",
      "connection": "MY_TABLE_STORAGE_ACCT_APP_SETTING"
    }
  ]
}
```

**HttpBindings**
```
{
  "bindings": [
    {
      "authLevel": "function",
      "type": "httpTrigger",
      "direction": "in",
      "name": "req",
      "methods": [
        "get",
        "post"
      ]
    },
    {
      "type": "http",
      "direction": "out",
      "name": "res"
    }
  ]
}
```

# HttpTriggers
## Authorization level
different types of  keys
function - each function
host - the whole function app

