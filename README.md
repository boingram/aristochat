# Aristochat

Aristochat is a chat server used to explore running Elixir apps on Kubernetes.

To run locally, install dependencies with `mix deps.get` and start your endpoint with `mix phoenix.server`. 

To run via Kubernetes, submit your desired specifications file from the `k8s` folder with `kubectl create -f <spec>.yaml`. 

To interact with via a terminal UI, check out [Aristochat Client](https://github.com/boingram/aristochat-client).

### Kubernetes Specifications
| Name | Description | 
|------|-------------|
| **initial** | Specifies deployment and service for Aristochat
| **initial_clustered** | Expands initial with environment variables to faciliate clustering Aristochat pods
