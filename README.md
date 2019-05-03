# aws-s3-olm-operator

### Setup and Building the Registry and Operator

#### Clone Framework Repos

1. Clone the Operator repo
```
# cd <gopath>/src/github.com/yard-turkey
# git clone https://github.com/yard-turkey/aws-s3-olm-operator.git

```

2. Create Operator-Framework Dir structure in *<gopath>/src/github.com*
```
 # cd /<gopath>/src/github.com
 # mkdir operator-framework
 # cd operator-framework 
 
```

3. Clone the Operator SDK in the Operator-Framework directory path.

```
 # git clone https://github.com/operator-framework/operator-sdk.git
```


4. Clone the Operator-Registry in the Operator-Framework directory path.

```
 # git clone https://github.com/operator-framework/operator-registry.git
``` 


#### Build the Registry base image and builder container

1. From the operator-registry repo run the following commands.

```
 # cd operator-registry
 # docker build -t quay.io/operator-framework/upstream-registry-builder:latest -f  upstream-builder.Dockerfile .
 
```

2. From the operator-registry directory copy the *upstream-example.Dockerfile* to your operators repo root or at the same level of your *manifests* sub directory.
```
 # cp upstream-example.Dockerfile ../../yard-turkey/aws-s3-olm-operator/.
```

3. Now build the server-registry and push it.
```
 # cd ../../yard-turkey-aws-s3-olm-operator
 # docker build -t quay.io/screeley44/aws-s3-operator-registry:v1.0.0 -f upstream-example.Dockerfile .
 # docker push quay.io/screeley44/aws-s3-operator-registry:v1.0.0
```

#### Install the Catalog and Operator on your OCP 4.0 cluster.

1. Create the Catalog.

```
 # oc create -f ./manifests/awss3operator/catalog-source.yaml
```

2. Make sure the catalog is running in the *openshift-operator-lifecycle-manager* project/namespace.

```
 # oc get pods -n openshift-operator-lifecycle-manager | grep aws*
```


