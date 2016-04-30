keycloak-proxy
====

Description
-----------
A docker container to use in proxying traffic for an app when keycloak integration is not possible. See proxy implementation/configuration details here [here](http://keycloak.github.io/docs/userguide/keycloak-server/html/proxy.html).


Usage Documentation
-----------------
The majority of the configuration for the proxy is actually done in a proxy.json file, which you'll need to add to the container at `/proxy.json` before running.  It should be noted too that this container exposes port `8080`, but the `proxy.json` file allows you to choose any listen port (it's best then, that you ensure your file contains `"http-port": "8080"`).

```bash
docker run -d -v /path/to/local/proxy.json:/proxy.json -p 8080:8080 stevenolen/keycloak-proxy
```  


Disclaimer/TODOs
-----------------
This container doesn't expect to be run with `https` (instead, it's better to do that with another reverse proxy above). 