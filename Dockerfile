
FROM alpine as munger

ARG new_image_name
COPY *.yaml manifests

FROM quay.io/openshift/origin-operator-registry:latest

COPY --from=munger manifests manifests
RUN initializer

CMD ["registry-server"]
