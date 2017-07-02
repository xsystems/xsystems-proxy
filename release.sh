#!/bin/sh

if [ -z "${COMMIT}" ]; then
  echo "The COMMIT environment variable is NOT set, but is required."
fi

if [ -z "${VERSION}" ]; then
  echo "The VERSION environment variable is NOT set, but is required."
fi

git tag --annotate --message "Release ${VERSION}" ${VERSION} ${COMMIT}
git push origin ${VERSION}

docker build --tag xsystems/proxy:${VERSION} "https://github.com/xsystems/xsystems-proxy.git#${COMMIT}"
docker tag xsystems/proxy:${VERSION} xsystems/proxy:latest
docker push xsystems/proxy:${VERSION}
docker push xsystems/proxy:latest
